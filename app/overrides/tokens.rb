Deface::Override.new(:virtual_path  => "spree/home/index",
                     :name => "tokens",
                     :replace => "[data-hook='homepage_products']",
                     :partial => "/shared/tokens")