Deface::Override.new(:virtual_path  => "spree/checkout/registration",
                     :name => "guest_checkout",
                     :remove => "div#guest_checkout",
                     :original => "original")