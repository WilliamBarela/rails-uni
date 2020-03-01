class CreateGraduateAdvisorships < ActiveRecord::Migration[6.0]
  def change
    create_table :graduate_advisorships, comment: "join table of faculty_members and graduate_students" do |t|
      t.boolean :primary_advisor?, comment: "true, false"
      t.date :advising_initiation, comment: "when advisory relationship commenced"
      t.date :advising_termination, comment: "when advisory relationship ended"
      t.belongs_to :faculty_member, index: true, null: false, foreign_key: true, comment: "faculty members may have many advisees"
      t.belongs_to :graduate_student, index: true, null: false, foreign_key: true, comment: "graduate students may have many advisors"

      t.timestamps
    end
  end
end
