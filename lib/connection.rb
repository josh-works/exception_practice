class Connection

  attr_reader :status_code,
              :external_service_status_code

  def initialize(status_code)
    @status_code = status_code
    @external_service_status_code = nil
  end

  def connect_to_external_service
    if connected_to_service?
      puts "connecting"
      return Service.get_service_status
    end
  end

  private

    def connected_to_service?
      true
    end
end

class Service
  def self.get_service_status
    200
  end
end
