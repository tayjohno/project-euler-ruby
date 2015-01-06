require './euler.rb'

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

RSpec.describe "three" do
  it "should provide the answer with no parameters." do
    expect( three ).to eq( 6857 )
  end
  it "should calculate specific answer for provided parameter." do
    expect( three 600851475143 ).to eq( 6857 )
  end
  it "should work with primes." do
    expect( three 17 ).to eq( 17 )
  end
  it "should work with cubes." do
    expect( three 8 ).to eq( 2 )
  end
end

RSpec.describe "four" do
  it "should provide the answer with no parameters." do
    expect( four ).to eq( 906609 )
  end
  it "should calculate specific answer for provided parameter." do
    expect( four 99 ).to eq( 9009 )
  end
  it "should include the number given as a possibility." do
    expect( four 11 ).to eq( 121 )
  end
  it "should work with single digit numbers as well" do
    expect( four 1 ).to eq( 1 )
  end
end

RSpec.describe "five" do
  it "should provide the answer with no parameters." do
    expect( five ).to eq( 232792560 )
  end
  it "should calculate specific answer for provided parameter." do
    expect( five 10 ).to eq( 2520 )
  end
end

RSpec.describe "six" do
  it "should provide the answer with no parameters." do
    expect( six ).to eq( 25164150 )
  end
  it "needs more tests"
end

RSpec.describe "seven" do
  it "should provide the answer with no parameters." do
    expect( seven ).to eq( 104743 )
  end
  it "needs more tests"
end

RSpec.describe "eight" do
  it "should provide the answer with no parameters." do
    expect( eight ).to eq( 23514624000 )
  end
  it "needs more tests"
end

RSpec.describe "nine" do
  it "should provide the answer with no parameters." do
    expect( nine ).to eq( 31875000 )
  end
  it "needs more tests"
end

RSpec.describe "ten" do
  it "should provide the answer with no parameters." do
    expect( ten ).to eq( 142913828922 )
  end
  it "needs more tests"
end

RSpec.describe "eleven" do
  it "should provide the answer with no parameters." do
    expect( eleven ).to eq( 70600674 )
  end
  it "needs more tests"
end

RSpec.describe "twelve" do
  it "should provide the answer with no parameters." do
    expect( twelve ).to eq( 76576500 )
  end
  it "needs more tests"
end

RSpec.describe "thirteen" do
  it "should provide the answer with no parameters." do
    expect( thirteen ).to eq( 5537376230 )
  end
  it "needs more tests"
end

RSpec.describe "fourteen" do
  it "should provide the answer with no parameters." do
    expect( fourteen ).to eq( 837799 )
  end
  it "needs more tests"
end

RSpec.describe "fifteen" do
  it "should provide the answer with no parameters." do
    expect( fifteen ).to eq( 137846528820 )
  end
  it "needs more tests"
end

RSpec.describe "sixteen" do
  it "should provide the answer with no parameters." do
    expect( sixteen ).to eq( 1366 )
  end
  it "needs more tests"
end

RSpec.describe "seventeen" do
  it "should provide the answer with no parameters." do
    expect( seventeen ).to eq( 21124 )
  end
  it "needs more tests"
end

RSpec.describe "eighteen" do
  it "should provide the answer with no parameters." do
    expect( eighteen ).to eq( 1074 )
  end
  it "needs more tests"
end

RSpec.describe "nineteen" do
  it "should provide the answer with no parameters." do
    expect( nineteen ).to eq( 171 )
  end
  it "needs more tests"
end

RSpec.describe "twenty" do
  it "should provide the answer with no parameters." do
    expect( twenty ).to eq( 648 )
  end
  it "needs more tests"
end

RSpec.describe "twentyone" do
  it "should provide the answer with no parameters." do
    expect( twentyone ).to eq( 31626 )
  end
  it "needs more tests"
end

RSpec.describe "twentytwo" do
  it "should provide the answer with no parameters." do
    expect( twentytwo ).to eq( 871198282 )
  end
  it "needs more tests"
end

RSpec.describe "twentythree" do
  it "should provide the answer with no parameters." do
    expect( twentythree ).to eq( 4179871 )
  end
  it "needs more tests"
end

RSpec.describe "twentyfour" do
  it "should provide the answer with no parameters." do
    expect( twentyfour ).to eq( "2783915460" )
  end
  it "needs more tests"
end