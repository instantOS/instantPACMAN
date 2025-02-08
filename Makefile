export PREFIX := /usr

.PHONY: all
all:
	$(info Usage: make install [PREFIX=/usr/])
	true

.PHONY: install
install: instantpacman.sh
	$(info INFO: install PREFIX: $(PREFIX))
	install -Dm 755 instantpacman.sh $(DESTDIR)$(PREFIX)/bin/instantpacman

	install -Dm 755 utils/utils.sh $(DESTDIR)$(PREFIX)/share/instantpacman/utils/utils.sh

	install -Dm 755 utils/searchaur.sh $(DESTDIR)$(PREFIX)/share/instantpacman/utils/searchaur.sh
	install -Dm 755 utils/packagelist.sh $(DESTDIR)$(PREFIX)/share/instantpacman/utils/packagelist.sh
	install -Dm 755 utils/choosepackage.sh $(DESTDIR)$(PREFIX)/share/instantpacman/utils/choosepackage.sh

	install -Dm 755 providers/aur.sh $(DESTDIR)$(PREFIX)/share/instantpacman/providers/aur.sh
	install -Dm 755 providers/flatpak.sh $(DESTDIR)$(PREFIX)/share/instantpacman/providers/flatpak.sh

.PHONY: uninstall
uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/instantpacman
	rm $(DESTDIR)$(PREFIX)/share/instantpacman

