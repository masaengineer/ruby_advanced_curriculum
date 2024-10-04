'./object_oriented/storage'
'./object_oriented/coinmech'

class VendingMachine
  def initialize
    @storage = Storage.new
    @coin_mech = CoinMech.new
  end

  def buy(payment, kind_of_drink)
    if payment != Coin::ONE_HUNDRED && payment != Coin::FIVE_HUNDRED
      @coin_mech.add_coin_into_change(payment)
      return nil
    end

    if @storage.empty?(kind_of_drink)
      @coin_mech.add_coin_into_change(payment)
      return nil
    end

    if payment == Coin::FIVE_HUNDRED && @coin_mech.not_have_change?
      @coin_mech.add_coin_into_change(payment)
      return nil
    end

    if payment == Coin::ONE_HUNDRED
      @coin_mech.add_coin_into_cash_box(payment)
    elsif payment == Coin::FIVE_HUNDRED then
      @coin_mech.add_change(@coin_mech.take_out_change)
    end

    @storage.decrement(kind_of_drink)
    Drink.new(kind_of_drink)
  end

  def refund
    @coin_mech.refund
  end
end
