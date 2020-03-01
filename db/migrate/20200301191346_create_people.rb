class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :honorific
      t.string :last_name
      t.string :middle_name
      t.string :first_name
      t.string :suffix
      t.string :gender
      t.string :ttus_email
      t.string :ttus_phone
      t.date :ttus_termination_date
      t.string :termination_reason

      t.timestamps
    end
  end
end
