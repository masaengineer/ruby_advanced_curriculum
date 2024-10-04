require './object_oriented/drink'
require './object_oriented/coin'
require './object_oriented/stock'

class VendingMachine
  def initialize
    @stock_of_coke = Stock.new(5)
    @stock_of_diet_coke = Stock.new(5)
    @stock_of_tea = Stock.new(5)
    @number_of_100yen = [Coin::ONE_HUNDRED] * 10
    @change = []
  end

  def buy(payment, kind_of_drink)
    if payment != Coin::ONE_HUNDRED && payment != Coin::FIVE_HUNDRED
      @change.push(payment)
      return nil
    end

    if kind_of_drink == DrinkType::COKE && @stock_of_coke.quantity == 0
      @change.push(payment)
      return nil
    elsif kind_of_drink == DrinkType::DIET_COKE && @stock_of_diet_coke.quantity == 0 then
      @change.push(payment)
      return nil
    elsif kind_of_drink == DrinkType::TEA && @stock_of_tea.quantity == 0 then
      @change.push(payment)
      return nil
    end

    # 釣り銭不足
    if payment == Coin::FIVE_HUNDRED && @number_of_100yen.length < 4
      @change.push(payment)
      return nil
    end

    if payment == Coin::ONE_HUNDRED
      @number_of_100yen.push(payment)
    elsif payment == Coin::FIVE_HUNDRED then
      @change = @change.concat(calculate_change)
    end

    if kind_of_drink == DrinkType::COKE
      @stock_of_coke.decrement
    elsif kind_of_drink == DrinkType::DIET_COKE then
      @stock_of_diet_coke.decrement
    else
      @stock_of_tea.decrement
    end

    Drink.new(kind_of_drink)
  end

  def refund
    result = @change.dup
    @change = []
    result
  end

  def calculate_change
    @number_of_100yen.slice!(0, 4)
    [Coin::ONE_HUNDRED] * 4
  end
end
