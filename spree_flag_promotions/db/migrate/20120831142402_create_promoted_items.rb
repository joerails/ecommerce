class CreatePromotedItems < ActiveRecord::Migration
  def change
    create_table :promoted_items do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
