require 'regen'
require 'benchmark'

def matchtest(re, text)
  1000.times do 
    re.match(text)
  end
end

text = ""
1000.times do 
  12.times do 
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
  x.report("oni"){ matchtest(reo, text)}
  x.report("ren"){ matchtest(ren, text)}
  x.report("re0"){ matchtest(re0, text)}
  x.report("re1"){ matchtest(re1, text)}
  x.report("re2"){ matchtest(re2, text)}
  x.report("re3"){ matchtest(re3, text)}
}

text = "a" * 1024
rstro =  "^(?:a?){512}a{512}$"
rstr =  "(a?){512}a{512}"
reo = Regexp.compile(rstro)
ren = Regen.compile(rstr, -1)
re0 = Regen.compile(rstr, 0)
re1 = Regen.compile(rstr, 1)
re2 = Regen.compile(rstr, 2)
re3 = Regen.compile(rstr, 3)
Benchmark.bm {|x|
  x.report("oni"){ matchtest(reo, text)}
  x.report("ren"){ matchtest(ren, text)}
  x.report("re0"){ matchtest(re0, text)}
  x.report("re1"){ matchtest(re1, text)}
  x.report("re2"){ matchtest(re2, text)}
  x.report("re3"){ matchtest(re3, text)}
}
