#	$OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $

PROG=	nc
SRCS=	netcat.c atomicio.c socks.c \
        openbsd-compat/base64.c openbsd-compat/readpassphrase.c

CC = gcc
override CFLAGS += `pkg-config --cflags glib-2.0`
INC = -Iopenbsd-compat
LIBS = `pkg-config --libs glib-2.0`
OBJS = $(SRCS:.c=.o)

all: nc
nc: $(OBJS)
	$(CC) $(OBJS) $(LIBS) -o nc

$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
	rm -f $(OBJS) nc
