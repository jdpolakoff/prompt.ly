class AddUsersToPrompts < ActiveRecord::Migration[5.1]
  def change
    add_reference :prompts, :user, foreign_key: true
  end
end
