require 'rails_helper'

class VCRTest < Test::Unit::TestCase
  def test_example_dot_com
    VCR.use_cassette("synopsis") do
      response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
      assert_match /Example domains/, response.body
    end
  end
end
