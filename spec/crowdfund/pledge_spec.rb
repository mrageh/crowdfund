require 'crowdfund/pledge_list'

module CrowdFund
  describe Pledge do
    before do
      @pledge = Pledge.new(:testing, 200)
    end

    it "has a name" do
      @pledge.name.should == :testing
    end

    it "has an amount" do
      @pledge.amount.should == 200
    end
  end

  describe PledgeList do
    before do
      @pledges = PledgeList::PLEDGES
    end

    it "has 3 in total" do
      @pledges.size.should == 3
    end

    it "has bronze with a price of 50" do
      @pledges[0].should == Pledge.new(:bronze, 50)
    end

    it "has silver with a price of 100" do
      @pledges[1].should == Pledge.new(:silver, 75)
    end

    it "has gold with a price of 100" do
      @pledges[2].should == Pledge.new(:gold, 100)
    end
  end
end
