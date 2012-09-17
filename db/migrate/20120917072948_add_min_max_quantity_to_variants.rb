class AddMinMaxQuantityToVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :min_qty, :integer
    add_column :spree_variants, :max_qty, :integer
  end
end
