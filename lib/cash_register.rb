class CashRegister
  attr_accessor :total, :items
  attr_reader :discount, :last_item_total

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(item, price, quantity = 1)
    item_total = quantity * price
    self.total += item_total
    # add to record
    quantity.times do 
      self.items << item
    end
    @last_item_total = item_total
  end

  def apply_discount
    if @discount
      self.total -= (self.total * discount)/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_item_total
  end
end
