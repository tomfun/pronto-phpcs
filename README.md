# Pronto runner for Phpcs
## Prerequisites
require 
 - php
 - phpcs
 - and standard (Symfony 2 by default)

## Configuration
 You may want set **PHPCS_STANDARD** env variable, or *PATH*, full example:
```
env PHPCS_STANDARD=Zend PATH=$PATH:~/.composer/vendor/bin/ ~/.gem/ruby/2.2.0/bin/pronto run --commit=194080e5537bc6cb0fdf24378b784e439c90f090
```
## AS IS
It is just a wrapper, I am sorry this just copy paste from other [library](https://github.com/mmozuras/pronto-eslint),
I don't know ruby at all.
