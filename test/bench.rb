require 'regen'
require 'benchmark'

def matchtest(re, text, rep = 1000)
  rep.times do 
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
print "((0123456789)_?)* \n"
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
print "#{rstr} \n"
reo = Regexp.compile(rstro)
ren = Regen.compile(rstr, -1)
re0 = Regen.compile(rstr, 0)
re1 = Regen.compile(rstr, 1)
re2 = Regen.compile(rstr, 2)
re3 = Regen.compile(rstr, 3)
Benchmark.bm {|x|
  x.report("oni"){ matchtest(reo, text, 10000)}
  x.report("ren"){ matchtest(ren, text, 10000)}
  x.report("re0"){ matchtest(re0, text, 10000)}
  x.report("re1"){ matchtest(re1, text, 10000)}
  x.report("re2"){ matchtest(re2, text, 10000)}
  x.report("re3"){ matchtest(re3, text, 10000)}
}

text << "bbbbbbbbbb"
rstro =  "^.*b.{8}$"
rstr =  ".*b.{8}"
print "#{rstr} \n"
reo = Regexp.compile(rstro)
ren = Regen.compile(rstr, -1)
re0 = Regen.compile(rstr, 0)
re1 = Regen.compile(rstr, 1)
re2 = Regen.compile(rstr, 2)
re3 = Regen.compile(rstr, 3)
Benchmark.bm {|x|
  x.report("oni"){ matchtest(reo, text, 100000)}
  x.report("ren"){ matchtest(ren, text, 100000)}
  x.report("re0"){ matchtest(re0, text, 100000)}
  x.report("re1"){ matchtest(re1, text, 100000)}
  x.report("re2"){ matchtest(re2, text, 100000)}
  x.report("re3"){ matchtest(re3, text, 100000)}
}

text = "http://en.wikipedia.org/wiki/Parsing_expression_grammar"
rstr = "http://((([a-zA-Z0-9]|[a-zA-Z0-9][-a-zA-Z0-9]*[a-zA-Z0-9])\\.)*([a-zA-Z]|[a-zA-Z][-a-zA-Z0-9]*[a-zA-Z0-9])\\.?|[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+)(:[0-9]*)?(/([-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])*(;([-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])*)*(/([-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])*(;([-_.!~*'()a-zA-Z0-9:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])*)*)*(\\?([-_.!~*'()a-zA-Z0-9;/?:@&=+$,]|%[0-9A-Fa-f][0-9A-Fa-f])*)?)?" #"
print "html \n"
rstro = "^#{rstr}$"

reo = Regexp.compile(rstro)
ren = Regen.compile(rstr, -1)
re0 = Regen.compile(rstr, 0)
re1 = Regen.compile(rstr, 1)
re2 = Regen.compile(rstr, 2)
re3 = Regen.compile(rstr, 3)
Benchmark.bm {|x|
  x.report("oni"){ matchtest(reo, text, 100000)}
  x.report("ren"){ matchtest(ren, text, 100000)}
  x.report("re0"){ matchtest(re0, text, 100000)}
  x.report("re1"){ matchtest(re1, text, 100000)}
  x.report("re2"){ matchtest(re2, text, 100000)}
  x.report("re3"){ matchtest(re3, text, 100000)}
}
