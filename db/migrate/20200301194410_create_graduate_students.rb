class CreateGraduateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :graduate_students, comment: "GraduateStudents table for all graduate student roles" do |t|
      t.string :current_program, comment: "Biology, Microbiology, ..."
      t.string :degree_sought, comment: "PhD, Master, PSM, ..."
      t.string :auxiliary_roles, comment: "GA, RA, TA, ..."
      t.integer :expected_graduation_year, comment: "2020, 2021, ..."
      t.string :expected_graduation_semester, comment: "Spring, Fall, Summer"
      t.text :objectives_statement, comment: "160 or less character long objectives/mission statement"
      t.text :research_interests_summary, comment: "paragraph(s) stating summary of research interests"
      t.date :role_start_date, comment: "date in which graduate student's current_program role started"
      t.date :role_termination_date, comment: "date in which graduate student's currrent_program role finished"
      t.string :termination_reason, comment: "default: null; contract ended, fired, quit, ..."
      t.references :person, index: true, null: false, foreign_key: true, comment: "one person to possibly many graduate student roles"

      t.timestamps
    end
  end
end
