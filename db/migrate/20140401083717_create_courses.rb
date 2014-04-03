class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.text :description
      t.integer :length
      t.string :image_url
      t.date :start_time
      t.string :source_url
      t.boolean :audit_status

      t.timestamps
    end
  end
end
