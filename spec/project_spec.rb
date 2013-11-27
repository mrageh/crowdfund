require './project'

describe Project do
  before do
    $stdout = StringIO.new
    @project = Project.new('xyz', 25, 75)
  end

  it "has a capitalized name" do
    @project.name.should == 'XYZ'
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

  context "created with default value" do
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

  context "expensive value of project" do
    before do
      @project = Project.new('exp', 1000, 10000)
    end

    it "is a huge fund raising campaign" do
      @project.should be_expensive
    end
  end

  context "not expensive project" do
    before do
      @project = Project.new('chp', 999, 1000)
    end

    it "is not a cheap fund raising campaign" do
      @project.should_not be_expensive
    end
  end

  context "target amount has been reached" do
    before do
      @project = Project.new('finished', 1000, 1000)
    end

    it "the target funding amount has been reached" do
      @project.should be_target
    end

    it "the target funding amount has been exceed" do
      @project.got_funds
      @project.should be_target
    end
  end

  it "computes points as the sum of all treasure points" do
    @project.points.should == 0
    @project.pledge_total(Pledge.new(:bronze, 50))

    @project.points.should == 50

    @project.pledge_total(Pledge.new(:silver, 75))

    @project.points.should == 125

    @project.pledge_total(Pledge.new(:gold, 100))

    @project.points.should == 225
  end

end
