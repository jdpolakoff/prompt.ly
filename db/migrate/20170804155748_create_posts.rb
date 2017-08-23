class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :prompt
      # consider using the `foreign_key: true` constraint when using references
      t.datetime :created_at
      # for created_at and/or updated_at, just use the timestamps helper:
      # t.timestamps
    end
  end
end
