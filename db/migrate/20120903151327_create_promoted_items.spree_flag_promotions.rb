# This migration comes from spree_flag_promotions (originally 20120831142402)
class CreatePromotedItems < ActiveRecord::Migration
  def change
    create_table :promoted_items do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
