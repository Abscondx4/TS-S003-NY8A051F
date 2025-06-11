ICBODY       := NY8A051F
CLIENT_NAME  := XXXXX
CB_FILE      := Demo_1.cb
HOST_TOOL    := NYIDE 5.50
USER_C       := Charge.c Delay.c IncluDoc.c Key.c LED.c main.c Motor.c Power_Mode.c  
LIBS         := 
USER_ASM     :=  
OUT_NAME     := Demo_1
OUT_NAME_U   := Demo_1
CC_PATH      := C:\Nyquest\NYC_NY8
TEMP_FOLDER  := 
OBJDIR       := OBJ
VPATH        := $(CC_PATH)/libsrc/eeprom:

#  - small: disable bank ram
#  - bank2: 2 bank ram (1 word BANKSEL)
#  - bank4: 4 bank ram (2 word BANKSEL)
#
# suffix
#  - NONE:  4-bit S-Page and 4-bit R-Page SFR (0~0xF)
#  - 8b:    5-bit S-Pate and 5-bit R-Page SFR (0~0x1F)
#  - type3: 5-bit S-Page and 4-bit R-Page SFR (0~0xF)
#  - type4: 8b with FGOTO, ROM size > 0x800, 4 RAM bank
#  - v2:    clear RAM at bank3 (hardware mapping to bank0)
MODEL := small.19897

ENABLE_INIT_BSS := 1

CC := sdcc
AS := nyas
LD := nylinker
AR := nyar

LDFLAGS     := -p $(ICBODY) --client "$(CLIENT_NAME)" -L "$(CC_PATH)/lib"      \
               -g -M --riffbin --elf --disasm          \
               --host "$(HOST_TOOL)" --cinit --no-programchecksum             \
               --codechecksum --opt banksel3,inline-builtin  --w-no 32797 --lang zh-cn --fcinit-ram-zero --fcinit-bk0 \
			   

CFLAGS      := -mny8 --errfmt-ny -p$(ICBODY) -D__CPU_$(ICBODY) --debug \
               -I"$(CC_PATH)/include" -I"D:\Nyquest\NY8_Example_Code\include\NY8 C"  -MD   \
                --backup-stk 2    

ASFLAGS     := -p $(ICBODY) --dbgfmt 2 -g -l --w-no 32797 --lang zh-cn  \
               -I "$(CC_PATH)/inc" -I "D:\Nyquest\NY8_Example_Code\include\NY8 C" 

DEPS        := $(addprefix $(OBJDIR)/,$(subst /,\, $(patsubst %.c,%.d,$(USER_C))))
ASM_SRC     := $(USER_ASM)
ASM_SRC     := $(addprefix $(OBJDIR)/,$(subst /,\, $(patsubst %.c,%.s,$(USER_C))))
OBJS        := $(addprefix $(OBJDIR)/,$(subst /,\, $(patsubst %.c,%.o,$(USER_C)))) \
               $(addprefix $(OBJDIR)/,$(subst /,\, $(patsubst %.s,%.o,$(USER_ASM))))
OBJS        := $(sort $(OBJS))

OBJ_DIRS := $(sort $(dir $(OBJS)))
OBJ_DIRS := $(OBJ_DIRS:%\=%)

LIBS        += $(ICBODY).a
BIN_FILE    := $(strip $(OUT_NAME_U)).bin

### memory model and library dependency
ifneq (,$(findstring small,$(MODEL)))
  CFG_FILE  := $(CC_PATH)/cfg/small/$(ICBODY).cfg
  ifeq ($(MODEL),small_type4)
	LIBS    += libsdcc_small_fgo.a
	ASFLAGS += -D USEFGOTO=1
  else
	LIBS    += libsdcc_small.a
  endif
else
  CFG_FILE  := $(CC_PATH)/cfg/bankram/$(ICBODY).cfg
  ASFLAGS   += -D ENABLE_RAM_BANK=1
  ifeq ($(MODEL),bank4_8b)
	LIBS    += libsdcc_bank4.a
  else ifeq ($(MODEL),bank4_type4)
	LIBS    += libsdcc_bank4_fgo.a
	ASFLAGS += -D USEFGOTO=1
  else
	LIBS    += libsdcc_bankram.a
  endif
endif

ifeq ($(ENABLE_INIT_BSS),1)
  LIBS      += startup/$(strip $(MODEL)).a
else
  LIBS      += startup/no-bss/$(strip $(MODEL)).a
endif

### silent command line
ifneq ($(SHOW_CMD),1)
  L = @
endif

### common function
as = $(L)$(info Assembling $(subst $(OBJDIR)/,,$(3))) \
	 $(AS) $(1) -o $(2)

cc = $(L)$(info Compiling $(3)) \
	 $(CC) $(1) -o $(2)

ld = $(L)$(info Linking...) \
     $(LD) $(1)

mkdir = -@mkdir $(subst /,\,$(1)) >nul 2>nul

### main rule
.SUFFIXES:
.SECONDARY:
.PHONY: all clean rebuild

all: $(BIN_FILE)

$(OBJ_DIRS):
	-@1>nul 2>nul mkdir $(subst /,\,$@)

$(BIN_FILE): $(OBJS)
	$(call ld,$(OBJS) $(LIBS) "$(CB_FILE)" -s "$(CFG_FILE)" -o "$(TEMP_FOLDER)$(OUT_NAME)" $(LDFLAGS),$@)



$(OBJDIR)/%.s: %.c | $(OBJ_DIRS)
	$(call cc,-S $< $(CFLAGS),$@,$<)

$(OBJDIR)/%.o: $(OBJDIR)/%.s
	$(call as,$< $(ASFLAGS),$@,$<)

$(OBJDIR)/%.o: %.s | $(OBJ_DIRS)
	$(call as,$< $(ASFLAGS),$@,$<)

-include $(DEPS)

rebuild: clean all

clean:
	-@1>nul 2>nul rmdir /s /q OBJ
	-@1>nul 2>nul del "$(OUT_NAME).bin" "$(OUT_NAME).fpga" "$(OUT_NAME).elf" "$(OUT_NAME).link.lst" "$(OUT_NAME).map" "$(OUT_NAME).htm"
	-@1>nul 2>nul del $(patsubst %.c, %.adb, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.p, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.s, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.o, $(USER_C))
	-@1>nul 2>nul del $(patsubst %.c, %.d, $(USER_C))
	-@1>nul 2>nul del $(subst /,\,$(addsuffix .o, $(basename $(ASM_SRC))))
	-@1>nul 2>nul del $(subst /,\,$(addsuffix .lst, $(basename $(ASM_SRC))))
