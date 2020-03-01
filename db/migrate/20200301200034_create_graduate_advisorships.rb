class CreateGraduateAdvisorships < ActiveRecord::Migration[6.0]
  def change
    create_table :graduate_advisorships do |t|
      t.boolean :primary_advisor?
      t.date :advising_initiation
      t.date :advising_termination
      t.belongs_to :faculty_member, index: true, null: false, foreign_key: true
      t.belongs_to :graduate_student, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
