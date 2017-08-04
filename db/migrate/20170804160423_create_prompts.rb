class CreatePrompts < ActiveRecord::Migration[5.1]
  def change
    create_table :prompts do |t|
      t.string :title
      t.string :prompt
      t.string :img_url
    end
  end
end
