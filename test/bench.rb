require 'regen'
require 'benchmark'

text = ""
1000.times do |i|
  10.times do |j|
    text += "0123456789"
  end
  text += "_"
end
reo = Regexp.compile("^(?:(?:0123456789)_?)*$")
ren = Regen.compile("((0123456789)_?)*", -1)
re0 = Regen.compile("((0123456789)_?)*", 0)
re1 = Regen.compile("((0123456789)_?)*", 1)
re2 = Regen.compile("((0123456789)_?)*", 2)
re3 = Regen.compile("((0123456789)_?)*", 3)
Benchmark.bm {|x|
  x.report("oniguruma"){ reo.match(text) }
  x.report("regen non"){ ren.match(text) }
  x.report("regen 0  "){ re0.match(text) }
  x.report("regen 1  "){ re1.match(text) }
  x.report("regen 2  "){ re2.match(text) }
  x.report("regen 3  "){ re3.match(text) }
}
