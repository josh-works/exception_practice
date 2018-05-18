require './lib/connection'
require 'minitest/autorun'
require 'pry'

class ConnectionTest < Minitest::Test

  def test_initializes_with_response_code
    c = Connection.new(200)
    assert_equal 200, c.status_code
  end

  def test_connect_to_external_service_returns_200
    c = Connection.new(200)

    assert_equal 200, c.connect_to_external_service
  end

  def test_raise_error_when_external_status_returns_404
    c = Connection.new(200)

    assert_raises Exception, c.connect_to_external_service
  end

end
