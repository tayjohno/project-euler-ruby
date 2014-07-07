require './LoadLibraries.rb'

RSpec.describe "one" do
  it "should provide the answer with no parameters." do
    expect( one ).to eq( 233168 )
  end
  it "should calculate specific answer for provided parameter." do
    expect( one 19 ).to eq( 78 )
  end
  it "should only include numbers less than (not equal to) provided parameter." do
    expect( one 20 ).to eq( 78 )
  end
end

RSpec.describe "two" do
  it "should provide the answer with no parameters." do
    expect( two ).to eq( 4613732 )
  end
  it "should calculate specific answer for provided parameter." do
    expect( two 50 ).to eq( 44 )
  end
  it "should only include numbers less than or equal to provided parameter." do
    expect( two 8 ).to eq( 10 )
  end
end