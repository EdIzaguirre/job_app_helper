class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :bio, null: true
      t.text :resume, null: true
      t.timestamps
    end
  end
end
