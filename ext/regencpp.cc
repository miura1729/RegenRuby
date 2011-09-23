#include "regen.h"

extern "C" {
  
  VALUE
  regen_compile(int argc, VALUE *argv, VALUE klass) {
    VALUE regstr;
    VALUE flagv;
    regen::CompileFlag flag;
    rb_scan_args(argc, argv, "11", &regstr, &flagv);
    switch (flagv) {
    case INT2FIX(-1):
    flag = regen::Onone;
    break;

    case INT2FIX(0):
    flag = regen::O0;
    break;

    case INT2FIX(1):
    flag = regen::O1;
    break;

    case INT2FIX(2):
    flag = regen::O2;
    break;

    case INT2FIX(3):
    flag = regen::O3;
    break;

    default:
    flag = regen::O2;
    break;
    }
    std::string regstring = std::string(StringValueCStr(regstr));
    regen::Regex *r = new regen::Regex(regstring, 2);
    r->Compile(flag);
    return Data_Wrap_Struct(regen_cRegen, NULL, NULL, r);
  }
  
  VALUE
  regen_match(VALUE self, VALUE matstr) {
    std::string matstring = std::string(StringValueCStr(matstr));
    regen::Regex *rp = (regen::Regex *)DATA_PTR(self);
    if (rp->Match(matstring)) {
      return Qtrue;
    } 
    else {
      return Qnil;
    }
  }
}

    

  
