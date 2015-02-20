require 'spec_helper'

describe Logger do

  before :all do
    @logger = Logger.new('service1sample', '127.0.0.1', 'logging')
  end

  describe "#new" do
    it "takes 3 params- (<service/process>,<redis host>,<channel>)" do
        @logger.should be_an_instance_of Logger
    end
  end

end
