class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.datetime :created_at
      t.references :post
    end
  end
end
