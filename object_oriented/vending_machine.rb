require './object_oriented/drink'
require './object_oriented/coin'
require './object_oriented/stock'
require './object_oriented/stock_of_100yen'
require './object_oriented/change'

class VendingMachine

  def initialize
    @stock_of_coke = Stock.new(5)
    @stock_of_diet_coke = Stock.new(5)
    @stock_of_tea = Stock.new(5)
    @stock_of_100yen = StockOf100Yen.new(10)
    @change = Change.new
  end

  def buy(payment, kind_of_drink)
    if payment != Coin::ONE_HUNDRED && payment != Coin::FIVE_HUNDRED
      @change.add(payment)
      return nil
    end

    if kind_of_drink == DrinkType::COKE && @stock_of_coke.empty? then
      @change.add(payment)
      return nil
    elsif kind_of_drink == DrinkType::DIET_COKE && @stock_of_diet_coke.empty? then
      @change.add(payment)
      return nil
    elsif kind_of_drink == DrinkType::TEA && @stock_of_tea.empty? then
      @change.add(payment)
      return nil
    end

    # お釣りが無い場合
    if payment == Coin::FIVE_HUNDRED && @stock_of_100yen.not_have_change?
      @change.add(payment)
      return nil
    end

    if payment == Coin::ONE_HUNDRED
      @stock_of_100yen.add(payment)
    elsif payment == Coin::FIVE_HUNDRED then
      @change.add_all(@stock_of_100yen.take_out_change)
    end

    if kind_of_drink == DrinkType::COKE
      @stock_of_coke.decrement
    elsif kind_of_drink == DrinkType::DIET_COKE then
      @stock_of_diet_coke.decrement 1
    else
      @stock_of_tea.decrement
    end

    Drink.new(kind_of_drink)
  end

  def refund
    result = @change.clone
    @change.clear
    result
  end


end
