EXECUTABLE := ./1Instance/compRun 
CFLAGS := -O2 -march=native -Wno-attributes -Wformat=0 -Wno-comment
#CFLAGS :=  -Wno-attributes -Wformat=0 
CC := gcc $(CFLAGS)
CINCLUDE := -I./src -I./include -I./include/gas 
CLIBS := -lm
COMPILE := $(CC) -c
SRCDIR := ./src 
OBJDIR := ./obj

vpath %.c $(SRCDIR)

SRCS := $(foreach dir, $(SRCDIR), $(notdir $(wildcard $(dir)/*.c)))
OBJS := $(patsubst %.c,$(OBJDIR)/%.o,$(SRCS))
DEPS := $(patsubst %.c,$(OBJDIR)/%.d,$(SRCS)) 

#list:
#	@echo $(SRCS)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(CC) -o $@ $(OBJS) $(CLIBS)

$(OBJDIR)/%.d: %.c
	$(CC) -MM $(CINCLUDE) $< | sed 's,$*\.o,$(OBJDIR)/$*.o $@,g' > $@
#	$(CC) -M $(CINCLUDE) $< | sed s/\\.o/.d/ > $@

$(OBJDIR)/%.o: %.c
	$(COMPILE) $(CINCLUDE) $< -o $@

clean:
	-rm $(OBJS) $(DEPS) 
cleanall:
	-rm $(OBJS) $(EXECUTABLE) $(DEPS)  
	
##################

-include $(DEPS)

