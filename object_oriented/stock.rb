class Stock
  def initialize(quantity)
    @quantity = quantity
  end

  def empty?
    @quantity == 0
  end

  def decrement
    @quantity -= 1
  end
end
