Spree::OrdersController.class_eval do
  respond_to :html

  def buy_now
    @order = current_order(true)

    #params[:products].each do |product_id,variant_id|
    #  quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
    #  quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)
    #  @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
    #end if params[:products]
    logger.info("############################## Buy Now #########################")
    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.buy_now(Spree::Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')
    respond_with(@order) { |format| format.html { redirect_to checkout_state_path(@order.checkout_steps.first) } }
  end

  def populate
    logger.info("##############{params.inspect}")
    @order = current_order(true)

    params[:products].each do |product_id,variant_id|
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)
      @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Spree::Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    fire_event('spree.cart.add')
    fire_event('spree.order.contents_changed')
    respond_with(@order) { |format| format.html { redirect_to checkout_state_path(@order.checkout_steps.first) } }
    #respond_with(@order) { |format| format.html { redirect_to cart_path } }
  end


  #def edit
  #  @order = current_order(true)
  #  logger.info("########################## Here I am")
  #  associate_user
  #  respond_with(@order) { |format| format.html { redirect_to checkout_state_path(@order.checkout_steps.first) } }
  #end
end