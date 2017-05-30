DESTDIR=/
prefix=usr
BIN_NAME=lradc-set-current
SCRIPTS=wb-adc-get-value wb-adc-read-channel wb-adc-set-mux

ifeq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
       CC=gcc
else
       CC=$(DEB_HOST_GNU_TYPE)-gcc
endif

SRC = lradc_set_current.c imx233.c

$(BIN_NAME): $(SRC)
	$(CC) $^ -o $@

install: $(BIN_NAME) $(SCRIPTS)
	install -D -m 0755 -t $(DESTDIR)/$(prefix)/bin $^

clean:
	@rm -f $(BIN_NAME)
.PHONY: install clean all



