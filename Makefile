# SPDX-License-Identifier: BSD-3-Clause
# Copyright (c) 2020, Chris Hyndman
# All rights reserved.

PROGRAM ?= pomodoro-beacon
CONFIGURATION ?= debug

SRCS = main.c

OBJDIR = $(CONFIGURATION)/
OBJS = $(OBJDIR)$(addsuffix .o,$(basename $(SRCS)))

$(PROGRAM): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LDLIBS) -o $@

$(OBJDIR)%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -o $@ $<

.PHONY: clean
clean:
	-rm -rf $(OBJDIR) $(PROGRAM) $(PROGRAM).hex
