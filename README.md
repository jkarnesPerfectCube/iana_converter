iana_converter
======
iana_converter is a gem designed with a singular goal: _to provide a complete IANA/OLSON mapping to what Rails deems as "important" timezones._

Using this Gem
------
iana_converter is the first gem I have ever written. As such, it is implemented simply and its use is simple:
### Rails / Bundler
1. Add to your gemfile `iana_converter`
2. In whatever model you are trying to persist IANA timezones with `include iana_converter`
3. Instead of `model.timezone = 'America/Unsupported'` do `model.timezone = rails_timezone_for 'America/Unsupported'`
### Not Rails
1. `gem install iana_converter`
2. `require 'iana_converter`
3. `include iana_converter`
4. Call `rails_timezone_for 'Unsupported/Timezone` and the "correct" string will be returned.

Why are there no tests?
------
The implementation of this gem is _rudimentary._ There is *1* method which simply calls a constant hash.
If I were to test the hash, that would be testing Ruby Core functionality.
Testing the contents of the hash is un-necessary because once the mapping is created it should only ever be altered if Timezone Standards change.

Why is only the USA supported?
------
This gem was a conversion of an internal piece of code that we use at PerfectCube to make sure that non-supported time zones do not get persisted. At the time of this writing, we only have one international location who is based in Canada and uses US time.

But I want international timezones / timezones for my country! (AKA: Contributing)
------
Feel free to make the mapping then and submit a PR. It will be checked for correctness before being accepted.
Here is how we made our mapping:
1. Load the tzinfo gem: `require 'tzinfo'`
2. Set up a reference to the country you are mapping: `c = TZInfo::Country.get('US')` (from ISO 3166-1 country codes)
  1. If you don't know your country code, you can see all available codes supported with `TZInfo::Country.all_codes`
3. Now find out what IANA/OLSON timezones your country contains with `c.zones`
4. Make a big list of the zones your country has with the abbreviation they represent: `c.zones.each { |z| puts "#{z.name} maps to #{z.period_for_local(Time.now).abbreviation}" }`
5. Go find the Timezone string that rails associates with that abbreviation: `ActiveSupport::TimeZone.all.each { |tz| puts "#{tz.tzinfo.name} maps to #{tz.tzinfo.current_period.abbreviation}" }`
6. Either hand-match the timezones or parse them out with a script to generate a mapping similar to the mapping in `lib/mappings/us_mapping.rb`
7. Fork this.
8. Add your mapping in a mapping file and submit a PR
9. Enjoy.

If the process is that easy, why didn't you just automate it with two maps and a join?
------
Timezone Abbreviations are not unique. [This issue has been brought up before](https://github.com/tzinfo/tzinfo/issues/38) and solved in an elegant gem by davispuh called [TimezoneParser](https://github.com/davispuh/TimezoneParser). We personally thought that introducing the level of information that gem uses did not fit our use case and thus developed this simplistic lookup table. If you feel you need the full power of the TimezoneParser gem, by all means, go forth and use it! If you want something simple and with a small footprint, use us.