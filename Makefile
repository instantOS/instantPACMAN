export PREFIX := /usr

.PHONY: all
all:
	$(info Usage: make install [PREFIX=/usr/])
	true

.PHONY: install
install: instantchoosepackage.sh instantpackagelist.sh instantpacman.sh
	$(info INFO: install PREFIX: $(PREFIX))
	install -Dm 755 instantchoosepackage.sh $(DESTDIR)$(PREFIX)/bin/instantchoosepackage
	install -Dm 755 instantpackagelist.sh $(DESTDIR)$(PREFIX)/bin/instantpackagelist
	install -Dm 755 instantpacman.sh $(DESTDIR)$(PREFIX)/bin/instantpacman

.PHONY: uninstall
uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/instantchoosepackage
	rm $(DESTDIR)$(PREFIX)/bin/instantpackagelist
	rm $(DESTDIR)$(PREFIX)/bin/instantpacman

