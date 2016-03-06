test: install
	vendor/bin/archer test

coverage: install
	phpdbg -qrr vendor/bin/phpunit -c vendor/icecave/archer/res/phpunit/phpunit.coverage.xml \
		--bootstrap vendor/autoload.php

lint: install
	./vendor/bin/php-cs-fixer fix

install: vendor/autoload.php

prepare: lint coverage

ci: coverage

.PHONY: _default test coverage lint install prepare ci

vendor/autoload.php: composer.lock
	composer install

composer.lock: composer.json
	composer update
