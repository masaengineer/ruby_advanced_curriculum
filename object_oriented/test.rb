require 'minitest/autorun'
require './object_oriented/vending_machine'
require './object_oriented/drink'

class VendingMachineTest < Minitest::Test
  def setup
    @vm = VendingMachine.new
  end

  def test_500円でコーラを購入
    drink = @vm.buy(500, Drink::COKE)
    change = @vm.refund

    assert_equal(Drink::COKE, drink.kind)
    assert_equal(400, change)
  end

  def test_10円ではコーラは買えない
    drink = @vm.buy(10, Drink::COKE)
    change = @vm.refund

    assert_nil(drink)
    assert_equal(10, change)
  end

  def test_コーラの在庫が無いときにコーラは買えない
    @vm.buy(100, Drink::COKE)
    @vm.buy(100, Drink::COKE)
    @vm.buy(100, Drink::COKE)
    @vm.buy(100, Drink::COKE)
    @vm.buy(100, Drink::COKE)
    drink = @vm.buy(100, Drink::COKE)
    change = @vm.refund

    assert_nil(drink)
    assert_equal(100, change)
  end

  def testダイエットコーラの在庫が無いときにダイエットコーラは買えない
    @vm.buy(100, Drink::DIET_COKE)
    @vm.buy(100, Drink::DIET_COKE)
    @vm.buy(100, Drink::DIET_COKE)
    @vm.buy(100, Drink::DIET_COKE)
    @vm.buy(100, Drink::DIET_COKE)
    drink = @vm.buy(100, Drink::DIET_COKE)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal(100, change)
  end

  def testお茶の在庫が無いときにお茶は買えない
    @vm.buy(100, Drink::TEA)
    @vm.buy(100, Drink::TEA)
    @vm.buy(100, Drink::TEA)
    @vm.buy(100, Drink::TEA)
    @vm.buy(100, Drink::TEA)
    drink = @vm.buy(100, Drink::TEA)
    change = @vm.refund

    assert_equal(nil, drink)
    assert_equal(100, change)
  end

  def test_釣り銭が足りないときにコーラは買えない
    @vm.buy(500, Drink::COKE)
    @vm.refund
    @vm.buy(500, Drink::COKE)
    @vm.refund
    drink = @vm.buy(500, Drink::COKE)
    change = @vm.refund

    assert_nil(drink)
    assert_equal(500, change)
  end
end
