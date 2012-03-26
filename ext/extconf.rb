require 'mkmf'
$CFLAGS += ' -I ../../Regen/src'
$LOCAL_LIBS += ' ../libregen.a'
create_makefile("regen");
