require './lib/connection'
require 'rubygems'
require 'minitest/autorun'
require 'pry'

require "minitest/unit"
require "mocha/minitest"


class ConnectionTest < Minitest::Test

  def test_connect_to_external_service_returns_200
    conn = Connection.new
    srv = Service.new

    assert_equal 200, conn.connect_to_external_service(srv)
  end

  def test_raise_error_when_service_returns_4xx_using_stubs
    serv = Service.new
    Service.any_instance.stubs(:status_code).returns(404)
    conn = Connection.new

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service(serv)
    end
  end

  # this test doesn't require the `Service` class, though all others do
  def test_rais_error_when_service_returns_4xx_using_mocks
    skip

    conn = Connection.new
    srvc = stub("srvc is now a stub.")
    # srvc.class == Mocha::Mock

    srvc.stubs(:status_code).returns(404)

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service(srvc)
    end
  end

  def test_raises_error_when_service_returns_4xx_no_mocks
    # this fails because Service#status_code is not writable
    # from outside the object
    srvc = Service.new
    srvc.status_code = 404
    conn = Connection.new

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service(srvc)
    end
  end

end
