require 'minitest/autorun'
require './ruby_algorithm/answer'

class Chapter2Test < Minitest::Test
  def test_algorithm_01
    assert_equal [1, 2], algorithm_01(2), '1から引数の数値まで1つずつ増やしながら繰り返すメソッド「upto」について調べてみましょう。'
    assert_equal [1, 2, "らんて"], algorithm_01(3), '3の倍数の場合は「らんて」と返すようにしましょう。'
    assert_equal [1, 2, "らんて", 4, "くん"], algorithm_01(5), '5の倍数の場合は「くん」と返すようにしましょう。'
    assert_equal [1, 2, "らんて", 4, "くん", "らんて", 7, 8, "らんて", "くん", 11, "らんて", 13, 14, "らんてくん"], algorithm_01(15), '3と5の公倍数の場合は「らんてくん」と返すようにしましょう。'
  end

  def test_algorithm_02
    assert_equal 'RUNTEQ', algorithm_02('QETNUR'), '引数の文字列を左右逆転させましょう。'
    assert_equal 'らんてくん', algorithm_02('んくてんら'), '引数の文字列を左右逆転させましょう。'
    assert_equal 'Ruby on Rails', algorithm_02('sliaR no ybuR'), '引数の文字列を左右逆転させましょう。'
  end

  def test_algorithm_03
    assert_equal 'あるごりずむらんてくん', algorithm_03('あらるんごてりくずんむ'), '奇数にあたる文字を抽出してまとめて前方に配置しましょう。'
    assert_equal 'HelloWorld', algorithm_03('HWeolrllod'), '奇数にあたる文字を抽出してまとめて前方に配置しましょう。'
    assert_equal 'プログラミングスクール', algorithm_03('プグロスグクラーミルン'), '奇数にあたる文字を抽出してまとめて前方に配置しましょう。'
  end

  def test_algorithm_04
    assert_equal [4, 2, 5], algorithm_04('Ruby on Rails'), '空白を区切りに文字列を配列化する方法すると良さそうです。'
    assert_equal [4, 2, 6, 4, 7], algorithm_04('Done is better than perfect.'), '「.」は除外しましょう。'
    assert_equal [6, 3, 4, 2, 5, 3, 4, 3, 4, 3, 6, 4, 2, 5, 3, 6], algorithm_04('Things may come to those who wait, but only the things left by those who hustle.'), '「,」は除外しましょう。'
  end
end
