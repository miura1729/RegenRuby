require 'mkmf'
$CFLAGS += ' -I ../../Regen/src'
$LOCAL_LIBS += ' ../regen.a'
create_makefile("regen");
