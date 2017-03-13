MAKEFLAGS += --no-print-directory --no-builtin-rules

.DEFAULT_GOAL := all

TARGET := prog_A prog_B

prog_A : ARGS += "BIN_NAME=prog_A"
prog_A : ARGS += "SRC_DIRS=./src/prog_A ./src/utils"

prog_B : ARGS += "BIN_NAME=prog_B"
prog_B : ARGS += "SRC_DIRS=./src/prog_B ./src/utils"

$(addsuffix .release,$(TARGET)) : OPTION += release
%.release : %
	@:

$(addsuffix .develop,$(TARGET)) : OPTION += develop
%.develop : %
	@:

$(addsuffix .all,$(TARGET)) : OPTION += all
%.all : %
	@:

$(addsuffix .run,$(TARGET)) : OPTION += run
%.run : %
	@:

$(addsuffix .debug,$(TARGET)) : OPTION += debug
%.debug : %
	@:

$(addsuffix .clear,$(TARGET)) : OPTION += clear
%.clear : %
	@:

$(addsuffix .clean,$(TARGET)) : OPTION += clean
%.clean : %
	@:

all : $(TARGET)
clear : $(addsuffix .clear,$(TARGET))
clean : $(addsuffix .clean,$(TARGET))

$(TARGET) :
	@echo "----- make $(OPTION) $@ -----"
	@make -f ./Makefile.in $(ARGS) $(OPTION)
