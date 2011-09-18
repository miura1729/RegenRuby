#include "ruby.h"

VALUE regen_cRegen = Qnil;
VALUE regen_compile(VALUE, VALUE);
VALUE regen_match(VALUE, VALUE);

void Init_regen() {
  regen_cRegen = rb_define_class("Regen", rb_cObject);
  rb_define_singleton_method(regen_cRegen, "compile", regen_compile, -1);
  rb_define_method(regen_cRegen, "=~", regen_match, 1);
}
