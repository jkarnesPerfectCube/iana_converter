0.0.4
------
Github repository for this gem is now online. I am now looking at style and method to easily construct the master mapping from modular mapping files witout breaking the code. My experience with Modules is not strong. =(

0.0.3
------
Canadian Timezones are done. I have decided that when I encounter a time zone that I haven't found matching rules for, that the lookup will return `nil`. Currently, the only time zones which fall under this convention are:
* 'America/Blanc-Sablon'
* 'America/Atikokan'
* 'America/Adak'

0.0.2
------
YARD Documentation is created. README is now current. 

0.0.1
------
Initial Release. Mapping has been done for USA timezones across the 50 US states. Currently, America/Adak is handled as America/Adak since no other time zone I have yet found follows its rules.