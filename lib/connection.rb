class Connection

  attr_reader :status_code

  def initialize
    @status_code = get_service_status
  end

  def get_service_status
    # do complicated stuff to get status code
    # return a status code
    200
  end


  def connect_to_external_service(srvc)
    raise ServiceNotFound if srvc.status_code == 404
    return srvc.status_code
  end

  class ServiceNotFound < StandardError; end
end


# class Service
#   attr_reader :status_code
#
#   def initialize
#     @status_code = get_service_status
#     # status_code would be 200, 504, 404, etc
#   end
#
#   def get_service_status
#     # do complicated stuff here to get status code
#     # return a status code
#     200
#   end
# end
