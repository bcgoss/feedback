class CreateLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :lectures do |t|
      t.references :user, foreign_key: true
      t.references :cohort, foreign_key: true
      t.datetime :start_at
      t.integer :duration

      t.timestamps
    end
  end
end
