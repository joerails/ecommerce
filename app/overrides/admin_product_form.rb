Deface::Override.new(:virtual_path  => "spree/admin/products/_form",
                     :name => "admin_product_form",
                     :replace => "[data-hook='admin_product_form_fields']",
                     :partial => "admin/edit_product_form")