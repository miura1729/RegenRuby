#include "regen.h"

extern "C" {
  
  VALUE
  regen_compile(VALUE klass, VALUE regstr) {
    std::string regstring = std::string(StringValueCStr(regstr));
    regen::Regex *r = new regen::Regex(regstring, 2);
    return Data_Wrap_Struct(cRegenRegexp, NULL, NULL, r);
  }
  
  VALUE
  regen_match(VALUE self, VALUE matstr) {
    std::string matstring = std::string(StringValueCStr(matstr));
    regen::Regex *rp = (regen::Regex *)DATA_PTR(self);
    return (VALUE)(rp->FullMatch(matstring));
  }
}

    

  
