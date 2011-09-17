#include "ruby.h"

VALUE mRegen = Qnil;
VALUE cRegenRegexp = Qnil;
VALUE regen_compile(VALUE, VALUE);
VALUE regen_match(VALUE, VALUE);

void Init_regen() {
  mRegen = rb_define_module("Regen");
  cRegenRegexp = rb_define_class_under(mRegen, "Regexp", rb_cObject);
  rb_define_module_function(mRegen, "compile", regen_compile,1);
  rb_define_method(cRegenRegexp, "match", regen_match, 1);
}
