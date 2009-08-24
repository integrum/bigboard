require 'net/http'

class FailsModel
  attr_reader :fails

  def poll_fails
    @fails = []
    response = Net::HTTP.start("builder.integrumdemo.com", 80) {|http| http.get('/fail') }
    response.body.scan(/<li>(.+)<\/li>/) do |fail|
      @fails << fail
    end
    @fails.flatten!
  end

  # uncomment to test without a connection or see variations
#  def poll_fails
#    sleep(rand(10) + 1)
#    if @empty
#      @fails = []
#    else
#      @fails = %w{foo bar bazz}
#    end
#    @empty = !@empty
#  end
end
