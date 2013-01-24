class AddDescriptionToChoice < ActiveRecord::Migration
  def change
    add_column :choices, :description, :string
  end
end
