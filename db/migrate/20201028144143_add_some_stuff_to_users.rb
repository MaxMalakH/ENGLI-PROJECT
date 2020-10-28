class AddSomeStuffToUsers < ActiveRecord::Migration[6.0]
  def change
        add_column :users, :gender, :string
        add_column :users, :age, :integer
        add_column :users, :active, :boolean, default: false
    end
  end
