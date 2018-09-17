# Better IANA Timezone Mapping
# @author Justin Karnes <justin@perfectcube.co>

module IANA_Converter
  
    # The Complete IANA US Timezone list with mappings to Rails timezones.
  US_TIMEZONE_MAPPING = {
    'America/New_York' => 'America/New_York',
    'America/Detroit' => 'America/New_York',
    'America/Kentucky/Louisville' => 'America/New_York',
    'America/Kentucky/Monticello' => 'America/New_York',
    'America/Indiana/Indianapolis' => 'America/New_York',
    'America/Indiana/Vincennes' => 'America/New_York',
    'America/Indiana/Winamac' => 'America/New_York',
    'America/Indiana/Marengo' => 'America/New_York',
    'America/Indiana/Petersburg' => 'America/New_York',
    'America/Indiana/Vevay' => 'America/New_York',
    'America/Chicago' => 'America/Chicago',
    'America/Indiana/Tell_City' => 'America/Chicago',
    'America/Indiana/Knox' => 'America/Chicago',
    'America/Menominee' => 'America/Chicago',
    'America/North_Dakota/Center' => 'America/Chicago',
    'America/North_Dakota/New_Salem' => 'America/Chicago',
    'America/North_Dakota/Beulah' => 'America/Chicago',
    'America/Denver' => 'America/Denver',
    'America/Boise' => 'America/Denver',
    'America/Phoenix' => 'America/Phoenix',
    'America/Los_Angeles' => 'America/Los_Angeles',
    'America/Anchorage' => 'America/Juneau',
    'America/Juneau' => 'America/Juneau',
    'America/Sitka' => 'America/Juneau',
    'America/Metlakatla' => 'America/Juneau',
    'America/Yakutat' => 'America/Juneau',
    'America/Nome' => 'America/Juneau',
    'Pacific/Honolulu' => 'Pacific/Honolulu',
    'America/Adak' => nil
  }.freeze

  # The complete IANA CA Timezone list with mappings to Rails timezones
  CA_TIMEZONE_MAPPING = {
    'America/St_Johns' => 'America/St_Johns',
    'America/Halifax' => 'America/Halifax',
    'America/Glace_Bay' => 'America/Halifax',
    'America/Moncton' => 'America/Halifax',
    'America/Goose_Bay' => 'America/Halifax',
    'America/Blanc-Sablon' => nil,
    'America/Toronto' => 'America/New_York',
    'America/Nipigon' => 'America/New_York',
    'America/Thunder_Bay' => 'America/New_York',
    'America/Iqaluit' => 'America/New_York',
    'America/Pangnirtung' => 'America/New_York',
    'America/Atikokan' => nil,
    'America/Winnipeg' => 'America/Chicago',
    'America/Rainy_River' => 'America/Chicago',
    'America/Resolute' => 'America/Chicago',
    'America/Rankin_Inlet' => 'America/Chicago',
    'America/Regina' => 'America/Guatemala',
    'America/Swift_Current' => 'America/Guatemala',
    'America/Edmonton' => 'America/Denver',
    'America/Cambridge_Bay' => 'America/Denver',
    'America/Yellowknife' => 'America/Denver',
    'America/Inuvik' => 'America/Denver',
    'America/Creston' => 'America/Phoenix',
    'America/Dawson_Creek' => 'America/Phoenix',
    'America/Fort_Nelson' => 'America/Phoenix',
    'America/Vancouver' => 'America/Los_Angeles',
    'America/Whitehorse' => 'America/Los_Angeles',
    'America/Dawson' => 'America/Los_Angeles'
  }.freeze
  
  # A mapping to `nil` indicates that either:
  # # I was unable to figure out which timezone's rules match the key timezone
  # # Rails does not have a timezone whose rules match the key timezone.
  MASTER_MAP = {}.merge!(US_TIMEZONE_MAPPING).merge!(CA_TIMEZONE_MAPPING)

  # Finds which Timezone string Rails uses to reference an IANA/OLSON timezone.
  #
  # @param iana_timezone [String] the IANA/OLSON timezone you are trying to use, `'America/Boise'` as an example
  # @return [String] the rails timezone that encapsulates the timezone you converted.
  def rails_timezone_for(iana_timezone)
    MASTER_MAP[iana_timezone]
  end

end
