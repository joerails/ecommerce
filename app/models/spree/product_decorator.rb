Spree::Product.class_eval do

  delegate_belongs_to :master, :sku, :price, :weight, :height, :width, :depth, :is_master, :max_qty,:min_qty
  attr_accessible :max_qty, :min_qty
end