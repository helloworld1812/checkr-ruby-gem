module CheckrWebService
  class Client
    module Screenings
      module MotorVehicleReports
        def motor_vehicle_report(id, options={})
          get "motor_vehicle_reports/#{id}", options
        end
      end
    end
  end
end
