LUA ?= lua5.1
LUA_INCLUDE ?= /usr/include/$(LUA)

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share/applications

SRC = moonview.lua src/moonview-app.lua src/moonview-menu.lua

moonview:
	luastatic $(SRC) -l$(LUA) -I$(LUA_INCLUDE)
	strip moonview

install:
	install -Dm775 moonview $(DESTDIR)$(BINDIR)/moonview
	install -Dm775 data/moonview.desktop $(DESTDIR)$(DATADIR)/moonview.desktop

uninstall:
	rm -rf $(DESTDIR)$(BINDIR)/moonview
	rm -rf $(DESTDIR)$(DATADIR)/moonview.desktop

clean:
	rm -rf moonview.luastatic.c
	rm -rf moonview

.PHONY: moonview