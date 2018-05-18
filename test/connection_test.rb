require './lib/connection'
require 'minitest/autorun'
require 'pry'
require 'mocha'

class ConnectionTest < Minitest::Test

  def test_initializes_with_response_code
    skip
    c = Connection.new(200)
    assert_equal 200, c.status_code
  end

  def test_connect_to_external_service_returns_200
    skip
    c = Connection.new(200)

    assert_equal 200, c.connect_to_external_service
  end

  def test_raise_error_when_service_returns_4xx
    # Service.stub(:get_service_status).and_return(404)
    conn = Connection.new(200)

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service
    end
    # assert_equal 404, c.external_service_status_code
  end

end
