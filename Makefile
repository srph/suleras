# For some windows shit, I don't know why.
# Anyway, @maebe / Brian committed this ../..
SYSTEM_32 = C:/Windows/System32
if [ -d $(SYSTEM_32) ]; then \
	SHELL = $(SYSTEM_32)/cmd.exe \
fi

NPM = ./node_modules/.bin/
WEBPACK = $(NPM)webpack
WEBPACK_OPT = -d --display-error-details
STYLUS = $(NPM)stylus
STYLUS_OPT = -m --include-css --include ./styles/ --use ./stylus.js < ./styles/main.styl > ./dist/style.css

# Builds the scripts
build:
	$(WEBPACK) -p $(WEBPACK_OPT)

# Build stylus
style:
	$(STYLUS) $(STYLUS_OPT)

# Watches for files changes, and runs `build`
watch:
	$(WEBPACK) -w $(WEBPACK_OPT) || $(STYLUS) -w $(STYLUS_OPT)

# Installs dependencies
install:
	npm install bower -g
	npm install
	bower install

# Run tests
test:
	npm test

.PHONY: build style
