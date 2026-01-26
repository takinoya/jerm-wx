# $Id: Makefile,v 1.17 2007/08/09 08:35:12 candy Exp $
#

SRCS=jerm-wx.c
OBJS=jerm-wx.o
JUPITER_FLAGS=-DJUPITER
#LIBWRAP_FLAGS=-DUSE_LIBWRAP
CFLAGS=-g -pipe -Wall $(JUPITER_FLAGS) $(LIBWRAP_FLAGS)
#LDFLAGS=-static
LDLIBS=-lm # -lwrap  # if linux, add '-lnsl'

SRCS=jerm-wx.c
OBJS=jerm-wx.o

all: jerm-wx tiocdtr

jerm-wx: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

clean:
	rm -f $(OBJS) jerm-wx $(.CURDIR)/errs tiocdtr

V=jerm-wx-6801
FILES=README Makefile $(SRCS) jerm.1 tiocdtr.c \
	getaddrinfo.c getaddrinfo.h init.sh rock.pl
dist:
	cd $(.CURDIR) && \
	rm -rf $(V) && \
	mkdir $(V) && \
	ln $(FILES) $(V) && \
	tar -czf $(V).tar.gz $(V) && \
	rm -rf $(V)
