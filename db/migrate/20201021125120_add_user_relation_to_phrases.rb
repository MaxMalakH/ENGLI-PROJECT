class AddUserRelationToPhrases < ActiveRecord::Migration[6.0]
  def change
    add_reference :phrases, :user, foreign_key: true
  end
end
