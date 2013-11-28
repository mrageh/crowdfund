require 'crowdfund/fundrequest'

module CrowdFund
  describe FundRequest do
    before do
      @fundrequest = FundRequest.new('adam')
      $stdout = StringIO.new
      @initial_funds = 250
      @project = Project.new('rvm', @initial_funds, 50000)

      @fundrequest.add_project(@project)
    end

    it "name of event is capitalized" do
      @fundrequest.name.should == 'ADAM'
    end

    it "the funds increase if a even number is rolled" do
      Die.any_instance.stub(:roll).and_return(6)
      @fundrequest.show_projects(2)
      @project.fund.should == @initial_funds + 50
    end

    it "the funds decrease if a odd number is rolled" do
      Die.any_instance.stub(:roll).and_return(5)
      @fundrequest.show_projects(2)
      @project.fund.should == @initial_funds - 30
    end


  end
end
