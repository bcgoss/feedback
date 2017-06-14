class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.string :graduation_year

      t.timestamps
    end
  end
end
