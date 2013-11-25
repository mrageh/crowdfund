require_relative 'project'

describe Project do
  before do
    $stdout = StringIO.new
    @project = Project.new('xyz', 25, 75)
  end

  it "has an initial target funding amount" do
    @project.fund.should == 25
  end

  it "computes the total funding outstanding as the target funding amount minus the funding amount" do
    @project.outstanding_funds.should == (75 - 25)
  end

  it "increases funds by 25 when funds are added" do
    @project.got_funds.should == (25 + 25)
  end

  it "decreases funds by 15 when funds are removed" do
    @project.lost_funds.should == (25 - 15)
  end
  context "description" do
    before do
      @project = Project.new('xyz')
    end

    it "has a default value of 0 for funding amount" do
      @project.fund.should == 0
    end

    it "has a default value of 3000 for target amount" do
      @project.goal.should == 3000
    end

  end

end
