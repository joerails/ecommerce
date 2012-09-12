#Deface::Override.new(:virtual_path  => "spree/checkout/_address",
#                     :name => "shipping",
#                     :remove => "[data-hook='shipping_fieldset_wrapper']")

Deface::Override.new(:virtual_path  => "spree/checkout/_address",
                     :name => "shipping",
                     :replace => "[data-hook='shipping_fieldset_wrapper']",
                     :partial => "/checkout/shipping_address" )