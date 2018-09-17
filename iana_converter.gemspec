Gem::Specification.new do |s|
  s.name        = 'iana_converter'
  s.version     = '0.0.4'
  s.date        = '2018-09-17'
  s.summary     = "Work around Rails timezone obfuscation of IANA/OLSON timezones"
  s.description = "This gem is designed to provide a modular, complete, open-source, crowd-sourced mapping of the 650+ IANA/OLSON timezones of the world into Rails' 146 'important' timezones.
  A search for an existing solution showed that this has been an issue since the inception of ActiveSupport::Timezone as far back as 2012. Approaches which have been suggested included such ideas as: Making your own RTree in a spatially aware database and searching on boundaries, just don't use those timezones (yeah, that makes sense), rely on your users to set their own timezone (doesn't help if you do automated onboarding), find a better sourcing API for timezones based on GeoLookup (they almost all use OLSON/IANA).
  Rather than doing any of those things, it made more sense to simply complete the mapping that ActiveSupport::Timezone started on and then seemingly abandoned."
  s.author     = "Justin Karnes"
  s.email       = 'justin@pefectcube.co'
  s.files       = ["lib/iana_converter.rb", "lib/mappings/us_mapping.rb", "lib/mappings/ca_mapping.rb"]
  s.homepage    =
    'https://github.com/jkarnesPerfectCube/iana_converter'
  s.license       = 'MIT'
  s.post_install_message = 'Thanks for using iana_converter. Please report issues to the github repository: https://github.com/jkarnesPerfectCube/iana_converter'
  s.metadata = {
    "source_code_uri" => "https://github.com/jkarnesPerfectCube/iana_converter"
  }
end