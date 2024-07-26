class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :contact
      t.string :occupation
      t.text :message

      t.timestamps
    end
  end
end
