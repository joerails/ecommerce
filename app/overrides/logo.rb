Deface::Override.new(:virtual_path => "spree/shared/_header",
                     :name => "logo",
                     :replace_contents => "#logo",
                     :partial => "shared/logo")
                     #:text => "MLB Store")