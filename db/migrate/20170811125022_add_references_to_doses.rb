class AddReferencesToDoses < ActiveRecord::Migration[5.0]
  def change
    remove_column :doses, :ingredient_id, :integer
    add_reference :doses, :ingredient, foreign_key: true
  end
end
