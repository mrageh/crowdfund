require './fundrequest'

describe FundRequest do
  before do
    @fundrequest = FundRequest.new('adam')
    $stdout = StringIO.new
    @initial_funds = 250
    @project = Project.new('rvm', @initial_funds, 50000)

    @fundrequest.add_project(@project)
  end

  it "the funds increase if a even number is rolled" do
    Die.any_instance.stub(:roll).and_return(6)
    @fundrequest.show_projects
    @project.fund.should == @initial_funds + 25
  end

  it "the funds decrease if a odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)
    @fundrequest.show_projects
    @project.fund.should == @initial_funds - 15
  end


end
