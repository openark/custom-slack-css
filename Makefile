UNAME := $(shell uname -s)
GREP ?= grep -q
SLACK_HACK ?= slack-hack.js

ifeq ($(UNAME), Darwin)
SSB_INTEROP = /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js
else
SSB_INTEROP = /usr/lib/slack/resources/app.asar.unpacked/src/static/ssb-interop.js
endif

.PHONY: install
install:
	@if ! $(GREP) "openark" $(SSB_INTEROP); then \
		cat $(SLACK_HACK) >> $(SSB_INTEROP); \
	fi
