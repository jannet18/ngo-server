class MpesasController < ApplicationController
    def stkpush
        phoneNumber = params[:phoneNumber]
        amount = params[:amount]

        url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"
        timestamp = "#{Time.now.strftime "%Y%m%d%H%M%S"}"
        business_short_code = ENV["MPESA_SHORTCODE"]
        password = Base64.strict_encode64("#{business_short_code}#{ENV['MPESA_PASSKEY']}#{timestamp}")

        payload = {
            "BusinessShortCode": business_short_code,
                "Password": password,
                "Timestamp": "20240801221401",
                "TransactionType": "CustomerPayBillOnline",
                "Amount": amount,
                "PartyA": phoneNumber,
                "PartyB": business_short_code,
                "PhoneNumber": phoneNumber7,
                "CallBackURL": "#{ENV["CALLBACK_URL"]}/callback_url",
                "AccountReference": "CompanyXLTD",
                "TransactionDesc": "Payment of X"
    }.to_json

    headers ={
        content_type = 'application/json'
        Authorization = "Bearer #{get_access_token}"
    }
    response = RestClient::Request.new({
        method: :post,
        url: url,
        payload: payload,
        headers: headers,
    }).execute do |response, request|
        case response.code
        when 500
            [:error, JSON.parse(response.to_str)]
        when 400
            [:error, JSON.parse(response.to_str)]
        when 200
            [:success, JSON.parse(response>to_str)]
        else
            fail "Invalid response #{response.to_str} received"
        end
    end
    render json: response
    end

    private
    def generate_access_token_request
        @url = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

        @consumer_key = ENV['MPESA_CONSUSMER_KEY']
        @consumer_secret = ENV['MPESA_CONSUMER_SECRET']
        @userpass = Base64::strict_encode64("#{@consumer_key}:# {@consumer_secret}")
        @headers = {
            Authorization: "Bearer #{@userpass}"
        }

        res = RestClient::Request.execute(url: @url, method: :get,
        headers:{Authorization: "Basic #{@userpass}"})
        res
    end

    def get_access_token
        res = generate_access_token_request()
        if res.code != 200
            r = generate_access_token_request()
            if res.code != 200
                raise MpesaError("Unable to generate access token")
            end
        end
        body = JSON.parse(res, {symbolize_name: true})
        token = body[:access_token]
        AccessToken.destoy_all()
        AccessToken.create!(token: token)
        token
    end
end
