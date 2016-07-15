class CashRegister
  attr_accessor :total, :discount, :items
    
    @last_item_total = 0

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def total
    @total
  end

  def add_item(item, price, quantity = 1)
    item_total = quantity * price
    @total += item_total
    # add to record
    quantity.times do 
      @items << item
    end
    @last_item_total = item_total
  end

  def apply_discount
    if @discount
      @total -= (@total * discount)/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_item_total
  end
end
