require './lib/connection'
require 'rubygems'
require 'minitest/autorun'
require 'pry'

require "minitest/unit"
require "mocha/minitest"


class ConnectionTest < Minitest::Test

  def test_initializes_with_response_code
    c = Connection.new
    assert_equal 200, c.status_code
  end

  def test_connect_to_external_service_returns_200
    conn = Connection.new
    srv = Service.new

    assert_equal 200, conn.connect_to_external_service(srv)
  end

  def test_raise_error_when_service_returns_4xx_using_mocks
    srvc = stub("srvc is now a stub.")
    # srvc.class == Mocha::Mock

    srvc.stubs(:status_code).returns(404)
    conn = Connection.new

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service(srvc)
    end
  end

  def test_raises_error_when_service_returns_4xx_no_mocks
    srvc = Service.new
    srvc.status_code = 404
    conn = Connection.new

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service(srvc)
    end
  end

end
