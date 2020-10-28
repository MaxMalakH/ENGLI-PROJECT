class AddSlugToPhrase < ActiveRecord::Migration[6.0]
  def change
    add_column :phrases, :slug, :string, :unique => true
  end
end
