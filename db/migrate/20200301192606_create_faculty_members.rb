class CreateFacultyMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :faculty_members do |t|
      t.string :current_title
      t.text :auxiliary_roles
      t.text :objectives_statement
      t.text :research_interests_summary
      t.date :role_start_date
      t.date :role_termination_date
      t.string :termination_reason
      t.references :person, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
