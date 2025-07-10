class CreateResumes < ActiveRecord::Migration[8.0]
  def change
    create_table :resumes do |t|
      t.timestamps
      t.references :job_app, null: false, foreign_key: true
      t.text :content, null: false
    end
  end
end
