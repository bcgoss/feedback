class AddCohortRefToStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :cohort, foreign_key: true
  end
end
