class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people, comment: "People Table: info for all members of the department (excluding role info)" do |t|
      t.string :honorific, comment: "person honorific: Mr., Miss, Ms., Mrs., Dr., ..."
      t.string :last_name, comment: "person surname"
      t.string :middle_name, comment: "person middle name (optional)"
      t.string :first_name, comment: "person given name"
      t.string :suffix, comment: "person suffix: I, II, Jr., Sr., ..."
      t.string :gender, comment: "person gender: female, male, non-binary"
      t.string :ttus_email, comment: "person TTU email username@ttu.edu, username@ttuhsc.edu"
      t.string :ttus_phone, comment: "person work phone"
      t.date :ttus_termination_date, comment: "date of dissociation from TTU"
      t.string :termination_reason, comment: "reason for termination from TTU"

      t.timestamps
    end
  end
end
