INSTALL=install
PREFIX=/usr/local

TARGET := xcape

CFLAGS += -Wall -O -march-native
CFLAGS += `pkg-config --cflags xtst x11`
LDFLAGS += `pkg-config --libs xtst x11`
LDFLAGS += -pthread

$(TARGET): xcape.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

install:
	$(INSTALL) -Dm 755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)

clean:
	rm $(TARGET)

.PHONY: clean
