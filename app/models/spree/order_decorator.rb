#module Spree
#  def Order.include(model)
#    model.class_eval do
Spree::Order.class_eval do
  checkout_flow do
    go_to_state :address
    #go_to_state :delivery
    go_to_state :payment, :if => lambda { |order| order.payment_required? }
    go_to_state :confirm, :if => lambda { |order| order.confirmation_required? }
    go_to_state :complete
    #remove_transition :from => :delivery, :to => :confirm
  end
  #Spree::Order.before_validation :clone_billing_address
  #attr_accessor :use_billing

  def buy_now(variant, quantity = 1)
    self.empty!
    #current_item = find_line_item_by_variant(variant)
    #if current_item
    #  self.empty!
    #end
    current_item = Spree::LineItem.new(:quantity => quantity)
    current_item.variant = variant
    current_item.price   = variant.price
    self.line_items << current_item
    self.reload
    current_item
  end

  def merge!(order)
    logger.info(" I am here")
    logger.info("######################{order.inspect}")
    order.line_items.each do |line_item|
      #logger.info("##########################{line_item.inspect}")
      #self.buy_now(line_item.variant, 1)
      line_item.destroy
    end
    order.destroy
  end
end
#  end
#end
#
#Spree::Order.checkout_flow do
#  go_to_state :address
#  #go_to_state :delivery
#  go_to_state :payment, :if => lambda { |order| order.payment_required? }
#  go_to_state :confirm, :if => lambda { |order| order.confirmation_required? }
#  go_to_state :complete
#  #remove_transition :from => :delivery, :to => :confirm
#end

#Spree::Order.state_machine.before_transition :to => :payment, :do => :clone_billing_address

