require './lib/connection'
require 'minitest/autorun'
require "mocha/minitest"

class ConnectionTest < Minitest::Test

  def setup
    @conn = Connection.new
    @srv = mock('Service object')
  end

  def test_connect_to_external_service_returns_200
    @srv.stubs(:status_code).returns(200)
    assert_equal 200, @conn.connect_to_external_service(@srv)
  end

  def test_raise_error_when_service_returns_404_using_stubs
    @srv.stubs(:status_code).returns(404)

    assert_raises Connection::ServiceNotFound do
      @conn.connect_to_external_service(@srv)
    end
  end

  def test_raise_service_timeout_if_service_returns_504
    @srv.stubs(:status_code).returns(504)

    assert_raises Connection::ServiceTimeOut do
      @conn.connect_to_external_service(@srv)
    end
  end

end
