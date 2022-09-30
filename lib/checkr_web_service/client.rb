require 'checkr_web_service/connection'
require 'checkr_web_service/authentication'
require 'checkr_web_service/configuration'
require 'checkr_web_service/error'

# Checkr Resources
require 'checkr_web_service/client/accounts'
require 'checkr_web_service/client/adverse_actions'
require 'checkr_web_service/client/adverse_items'
require 'checkr_web_service/client/assessments'
require 'checkr_web_service/client/candidate_stories'
require 'checkr_web_service/client/candidates'
require 'checkr_web_service/client/continuous_checks'
require 'checkr_web_service/client/counties'
require 'checkr_web_service/client/documents'
require 'checkr_web_service/client/driver_licenses'
require 'checkr_web_service/client/employers'
require 'checkr_web_service/client/geos'
require 'checkr_web_service/client/invitations'
require 'checkr_web_service/client/nodes'
require 'checkr_web_service/client/packages'
require 'checkr_web_service/client/professional_licenses'
require 'checkr_web_service/client/programs'
require 'checkr_web_service/client/report_addresses'
require 'checkr_web_service/client/report_etas'
require 'checkr_web_service/client/report_tags'
require 'checkr_web_service/client/reports'
require 'checkr_web_service/client/schools'
require 'checkr_web_service/client/ssns'
require 'checkr_web_service/client/subscriptions'
require 'checkr_web_service/client/verifications'
require 'checkr_web_service/client/webhooks'

# Checkr Screenings
require 'checkr_web_service/client/screenings/county_criminal_searches'
require 'checkr_web_service/client/screenings/education_verifications'
require 'checkr_web_service/client/screenings/employment_verifications'
require 'checkr_web_service/client/screenings/federal_civil_searches'
require 'checkr_web_service/client/screenings/federal_criminal_searches'
require 'checkr_web_service/client/screenings/federal_district_civil_searches'
require 'checkr_web_service/client/screenings/federal_district_criminal_searches'
require 'checkr_web_service/client/screenings/global_watchlist_searches'
require 'checkr_web_service/client/screenings/international_adverse_media_searches'
require 'checkr_web_service/client/screenings/international_criminal_searches'
require 'checkr_web_service/client/screenings/international_education_verifications'
require 'checkr_web_service/client/screenings/international_global_watchlist_searches'
require 'checkr_web_service/client/screenings/international_identity_document_validations'
require 'checkr_web_service/client/screenings/international_motor_vehicle_reports'
require 'checkr_web_service/client/screenings/motor_vehicle_reports'
require 'checkr_web_service/client/screenings/national_criminal_searches'
require 'checkr_web_service/client/screenings/professional_license_verification'
require 'checkr_web_service/client/screenings/sex_offender_searches'
require 'checkr_web_service/client/screenings/ssn_traces'
require 'checkr_web_service/client/screenings/state_criminal_searches'

module CheckrWebService
  class Client
    include CheckrWebService::Authentication
    include CheckrWebService::Configuration
    include CheckrWebService::Connection
    include CheckrWebService::Client::Accounts
    include CheckrWebService::Client::Nodes
    include CheckrWebService::Client::Candidates
    include CheckrWebService::Client::Invitations
    include CheckrWebService::Client::Packages
    include CheckrWebService::Client::Reports

    def initialize(options={})
      options = CheckrWebService.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
