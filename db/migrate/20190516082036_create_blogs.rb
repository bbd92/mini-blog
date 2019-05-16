class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title,  null: false, default: "今日の出来事"
      t.text :text,     null: false
      t.timestamps      null: true
    end
  end
end
