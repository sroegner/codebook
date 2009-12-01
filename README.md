# codebook

This plugin is a minimalistic shared knowledge database for teams using redmine.
It uses the internal syntax highlighting of redmine and is primarily designed for keeping and sharing small 
pieces of code or documentation.

The codebook redmine plugin is my personal journey into the world of redmine and rails engines.
Please let me know about any ideas or problems you encounter while using it.

## Installation

* in your redmine **vendor/plugins** folder, 
    * _git clone git://github.com/sroegner/redmine_codebook.git codebook_
    * The name of the folder you clone into is important for the plugin to work!
* after that in the redmine root, rake db:migrate_plugins 
* right after installation, the Administration view offers a button to quickly put in some languages and categories

## Todo

* Export and Import
* add a project view and bind certain code documents to a project
* Search Integration (seems to be currently unsupported by redmine)

## History

* 0.2.0 changed (internal) plugin name and added localization files to make rails i18n work
* 0.1.1 added settings panel to make the "display line numbers" setting a persistent option
* 0.1.0 initial release

cheers
Steffen
