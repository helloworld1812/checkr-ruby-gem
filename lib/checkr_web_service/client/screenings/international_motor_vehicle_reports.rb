module CheckrWebService
  class Client
    module Screenings
      module InternationalMotorVehicleReports
        def international_motor_vehicle_report(id, options={})
          get "international_motor_vehicle_reports/#{id}", options
        end
      end
    end
  end
end
