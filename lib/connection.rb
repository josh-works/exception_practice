class Connection

  attr_reader :status_code

  def do_something
    @status_code = get_service_status
  end

  def get_service_status
    # do complicated stuff to get status code
    # but for now, return a random status code to emphasize
    # how uncontrollable this status code might be
    [200, 404, 504].sample
  end


  def connect_to_external_service(srvc)
    puts "inside connect_to_external_service"
    begin
      puts "about to raise an error for #{srvc.status_code}"
      raise ServiceNotFound if srvc.status_code == 404
      puts 'after the raise. WILL I EXECUTE?'
    rescue => ex
      puts ex
    end
    puts "after the rescue, end of method"
  end

  class ServiceNotFound < StandardError; end
  class ServiceTimeOut < StandardError; end
end
