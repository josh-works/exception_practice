require './lib/connection'
require 'rubygems'
require 'minitest/autorun'
require 'pry'

require "minitest/unit"
require "mocha/minitest"


class ConnectionTest < Minitest::Test

  def setup
    @conn = Connection.new
    @srv = stub('Service object')

  end

  def test_connect_to_external_service_returns_200
    @srv.stubs(:status_code).returns(200)
    assert_equal 200, @conn.connect_to_external_service(@srv)
  end

  def test_raise_error_when_service_returns_4xx_using_stubs
    @srv.stubs(:status_code).returns(404)

    assert_raises Connection::ServiceNotFound do
      @conn.connect_to_external_service(@srv)
    end
  end

end
