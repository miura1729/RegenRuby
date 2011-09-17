require 'test/unit'
require 'regen'

class RegenTest < Test::Unit::TestCase
  def setup
    @pattern_array = []
    @pattern_raw = ["a", "a*", "ba", "b*a", "b+aa", "[ab]a"]
    @pattern_raw.each do |pat|
      pae = []
      pae.push Regen.compile(pat)
      [-1, 0, 1, 2, 3].each do |flg|
        pae.push Regen.compile(pat, flg)
      end
      @pattern_array.push pae
    end
  end

  def test_regen
    ["a", "b", "aabba", "caa", "aab", "banana", "foo"].each do |str|
      @pattern_array.each_with_index do |pate, i|
        except = Regexp.compile("^#{@pattern_raw[i]}$").match(str)
        if except then
          except = true
        end
        pate.each do |pat|
          assert_equal(pat.match(str), except)
        end
      end
    end
  end
end
        
    
