#include "regen.h"

extern "C" {
  
  VALUE
  regen_compile(int argc, VALUE *argv, VALUE klass) {
    VALUE regstr;
    VALUE flagv;
    rb_scan_args(argc, argv, "11", &regstr, &flagv);
    regen::Regen::Options::CompileFlag flag;
    switch (flagv) {
    case INT2FIX(-1):
      flag = regen::Regen::Options::Onone;
    break;

    case INT2FIX(0):
      flag = regen::Regen::Options::O0;
    break;

    case INT2FIX(1):
      flag = regen::Regen::Options::O1;
    break;

    case INT2FIX(2):
      flag = regen::Regen::Options::O2;
    break;

    case INT2FIX(3):
      flag = regen::Regen::Options::O3;
    break;

    default:
      flag = regen::Regen::Options::O2;
    break;
    }
    std::string *regstring = new std::string(StringValueCStr(regstr));
    regen::Regen *r = new regen::Regen(*regstring);
    r->Compile(flag);
    return Data_Wrap_Struct(regen_cRegen, NULL, NULL, r);
  }
  
  VALUE
  regen_match(VALUE self, VALUE matstr) {
    Regen::StringPiece matstring(StringValueCStr(matstr));
    regen::Regen *rp = (regen::Regen *)DATA_PTR(self);
    if (rp->Match(matstring)) {
      return Qtrue;
    } 
    else {
      return Qnil;
    }
  }
}

    

  
