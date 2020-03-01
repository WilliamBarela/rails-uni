class CreateGraduateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :graduate_students do |t|
      t.string :current_program
      t.string :degree_sought
      t.string :auxiliary_roles
      t.integer :expected_graduation_year
      t.string :expected_graduation_semester
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
