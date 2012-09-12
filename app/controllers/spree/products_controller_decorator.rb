Spree::ProductsController.class_eval do
  #respond_override :index => { :html => { :success => lambda { render :partial => "shared/some_file" } } }

end