# codebook

This plugin is a minimalistic shared knowledge database for teams using redmine.
It uses the internal syntax highlighting of redmine (provided by the CodeRay plugin) and is primarily designed for keeping and sharing small 
pieces of source code or documentation.

Please let me know about any ideas or problems you encounter while using it.

---

***Achtung***

The current version of codebook requires and is compatible with Redmine 1.0.0+ (and newer 0.9+ versions of CodeRay)
If, you want to use codebook with pre-1.0.0 versions of Redmine, please download the [0.2.1 tarball](http://github.com/downloads/sroegner/codebook/codebook-0.2.1.tar.gz) from the Downloads section.

## Installation

* in your redmine **vendor/plugins** folder,
    * _git clone git://github.com/sroegner/codebook.git_
* after that in the redmine root, _rake db:migrate:plugins_

## Todo

* improve test coverage
* add Export and Import
* add a project view and bind certain code documents to a project
* search integration (appears currently unsupported by redmine)

## History

* 0.3.0 works with Redmine 1.0.0, added cucumber and rspec tests
* 0.2.1 moved category initialization into migration, no more extra "add default data" option
* 0.2.0 changed plugin name and added localization files to make rails i18n work
* 0.1.1 added settings panel to make the "display line numbers" setting a persistent option
* 0.1.0 initial release

cheers
Steffen
