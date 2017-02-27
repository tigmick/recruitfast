class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
