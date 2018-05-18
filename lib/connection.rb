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
      @esternal_service_status_code = Service.get_service_status
      return Service.get_service_status if Service.get_service_status < 204
      if Service.get_service_status == 404
        raise Connection::ServiceNotFound
      end
    end

  end


  private

    def connected_to_service?
      true
    end


    class ServiceNotFound < StandardError; end
end


class Service
  def self.get_service_status(status = 404)
    puts "service status: #{status}"
    return status
  end
end
