class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteers do |t|
      t.string :fullname
      t.string :email
      t.string :contact
      t.string :area_of_interest
      t.string :church
      t.text :message
      t.boolean :accepted_terms
      t.timestamps
    end
  end
end
