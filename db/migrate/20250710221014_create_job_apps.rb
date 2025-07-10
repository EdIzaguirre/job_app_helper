class CreateJobApps < ActiveRecord::Migration[8.0]
  def change
    create_table :job_apps do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.string :company_name, null: false
      t.string :title, null: false
      t.text :description, null: true
    end
  end
end
