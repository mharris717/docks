require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Docks" do
  it "smoke" do
    2.should == 2
  end

  it 'basic' do
    file = File.dirname(__FILE__)+"/data/Basic.dock"
    Docks.parsed(file).should =~ /gem install bundler/
  end
end
