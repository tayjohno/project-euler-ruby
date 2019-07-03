# frozen_string_literal: true

require './euler.rb'

RSpec.describe One do
  it 'should be defined' do
    expect(defined?(One)).to eq('constant')
    expect(One).to respond_to(:new)
    expect(One.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(One.new.solve).to eq(233_168)
  end
  it 'should calculate specific answer for provided parameter.' do
    expect(One.new(19).solve).to eq(78)
  end
  it 'should only include numbers less than (not equal to) provided parameter.' do
    expect(One.new(20).solve).to eq(78)
  end
end

RSpec.describe Two do
  it 'should be defined' do
    expect(defined?(Two)).to eq('constant')
    expect(Two).to respond_to(:new)
    expect(Two.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Two.new.solve).to eq(4_613_732)
  end
  it 'should calculate specific answer for provided parameter.' do
    expect(Two.new(50).solve).to eq(44)
  end
  it 'should only include numbers less than or equal to provided parameter.' do
    expect(Two.new(8).solve).to eq(10)
  end
end

RSpec.describe Three do
  it 'should be defined' do
    expect(defined?(Three)).to eq('constant')
    expect(Three).to respond_to(:new)
    expect(Three.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Three.new.solve).to eq(6857)
  end
  it 'should calculate specific answer for provided parameter.' do
    expect(Three.new(600_851_475_143).solve).to eq(6857)
  end
  it 'should work with primes.' do
    expect(Three.new(17).solve).to eq(17)
  end
  it 'should work with cubes.' do
    expect(Three.new(8).solve).to eq(2)
  end
end

RSpec.describe Four do
  it 'should be defined' do
    expect(defined?(Four)).to eq('constant')
    expect(Four).to respond_to(:new)
    expect(Four.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Four.new.solve).to eq(906_609)
  end
  it 'should calculate specific answer for provided parameter.' do
    expect(Four.new(99).solve).to eq(9009)
  end
  it 'should include the number given as a possibility.' do
    expect(Four.new(11).solve).to eq(121)
  end
  it 'should work with single digit numbers as well' do
    expect(Four.new(1).solve).to eq(1)
  end
end

RSpec.describe Five do
  it 'should be defined' do
    expect(defined?(Five)).to eq('constant')
    expect(Five).to respond_to(:new)
    expect(Five.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Five.new.solve).to eq(232_792_560)
  end
  it 'should calculate specific answer for provided parameter.' do
    expect(Five.new(10).solve).to eq(2520)
  end
end

RSpec.describe Six do
  it 'should be defined' do
    expect(defined?(Six)).to eq('constant')
    expect(Six).to respond_to(:new)
    expect(Six.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Six.new.solve).to eq(25_164_150)
  end
  it 'needs more tests'
end

RSpec.describe Seven do
  it 'should be defined' do
    expect(defined?(Seven)).to eq('constant')
    expect(Seven).to respond_to(:new)
    expect(Seven.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Seven.new.solve).to eq(104_743)
  end
  it 'needs more tests'
end

RSpec.describe Eight do
  it 'should be defined' do
    expect(defined?(Eight)).to eq('constant')
    expect(Eight).to respond_to(:new)
    expect(Eight.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Eight.new.solve).to eq(23_514_624_000)
  end
  it 'needs more tests'
end

RSpec.describe Nine do
  it 'should be defined' do
    expect(defined?(Nine)).to eq('constant')
    expect(Nine).to respond_to(:new)
    expect(Nine.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Nine.new.solve).to eq(31_875_000)
  end
  it 'needs more tests'
end

RSpec.describe Ten do
  it 'should be defined' do
    expect(defined?(Ten)).to eq('constant')
    expect(Ten).to respond_to(:new)
    expect(Ten.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Ten.new.solve).to eq(142_913_828_922)
  end
  it 'needs more tests'
end

RSpec.describe Eleven do
  it 'should be defined' do
    expect(defined?(Eleven)).to eq('constant')
    expect(Eleven).to respond_to(:new)
    expect(Eleven.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Eleven.new.solve).to eq(70_600_674)
  end
  it 'needs more tests'
end

RSpec.describe Twelve do
  it 'should be defined' do
    expect(defined?(Twelve)).to eq('constant')
    expect(Twelve).to respond_to(:new)
    expect(Twelve.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Twelve.new.solve).to eq(76_576_500)
  end
  it 'needs more tests'
end

RSpec.describe Thirteen do
  it 'should be defined' do
    expect(defined?(Thirteen)).to eq('constant')
    expect(Thirteen).to respond_to(:new)
    expect(Thirteen.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Thirteen.new.solve).to eq(5_537_376_230)
  end
  it 'needs more tests'
end

RSpec.describe Fourteen do
  it 'should be defined' do
    expect(defined?(Fourteen)).to eq('constant')
    expect(Fourteen).to respond_to(:new)
    expect(Fourteen.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Fourteen.new.solve).to eq(837_799)
  end
  it 'needs more tests'
end

RSpec.describe Fifteen do
  it 'should be defined' do
    expect(defined?(Fifteen)).to eq('constant')
    expect(Fifteen).to respond_to(:new)
    expect(Fifteen.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Fifteen.new.solve).to eq(137_846_528_820)
  end
  it 'needs more tests'
end

RSpec.describe Sixteen do
  it 'should be defined' do
    expect(defined?(Sixteen)).to eq('constant')
    expect(Sixteen).to respond_to(:new)
    expect(Sixteen.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Sixteen.new.solve).to eq(1366)
  end
  it 'needs more tests'
end

RSpec.describe Seventeen do
  it 'should be defined' do
    expect(defined?(Seventeen)).to eq('constant')
    expect(Seventeen).to respond_to(:new)
    expect(Seventeen.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Seventeen.new.solve).to eq(21_124)
  end
  it 'needs more tests'
end

RSpec.describe Eighteen do
  it 'should be defined' do
    expect(defined?(Eighteen)).to eq('constant')
    expect(Eighteen).to respond_to(:new)
    expect(Eighteen.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Eighteen.new.solve).to eq(1074)
  end
  it 'needs more tests'
end

RSpec.describe Nineteen do
  it 'should be defined' do
    expect(defined?(Nineteen)).to eq('constant')
    expect(Nineteen).to respond_to(:new)
    expect(Nineteen.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Nineteen.new.solve).to eq(171)
  end
  it 'needs more tests'
end

RSpec.describe Twenty do
  it 'should be defined' do
    expect(defined?(Twenty)).to eq('constant')
    expect(Twenty).to respond_to(:new)
    expect(Twenty.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(Twenty.new.solve).to eq(648)
  end
  it 'needs more tests'
end

RSpec.describe TwentyOne do
  it 'should be defined' do
    expect(defined?(TwentyOne)).to eq('constant')
    expect(TwentyOne).to respond_to(:new)
    expect(TwentyOne.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentyOne.new.solve).to eq(31_626)
  end
  it 'needs more tests'
end

RSpec.describe TwentyTwo do
  it 'should be defined' do
    expect(defined?(TwentyTwo)).to eq('constant')
    expect(TwentyTwo).to respond_to(:new)
    expect(TwentyTwo.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentyTwo.new.solve).to eq(871_198_282)
  end
  it 'needs more tests'
end

RSpec.describe TwentyThree do
  it 'should be defined' do
    expect(defined?(TwentyThree)).to eq('constant')
    expect(TwentyThree).to respond_to(:new)
    expect(TwentyThree.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentyThree.new.solve).to eq(4_179_871)
  end
  it 'needs more tests'
end

RSpec.describe TwentyFour do
  it 'should be defined' do
    expect(defined?(TwentyFour)).to eq('constant')
    expect(TwentyFour).to respond_to(:new)
    expect(TwentyFour.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentyFour.new.solve).to eq('2783915460')
  end
  it 'needs more tests'
end

RSpec.describe TwentyFive do
  it 'should be defined' do
    expect(defined?(TwentyFive)).to eq('constant')
    expect(TwentyFive).to respond_to(:new)
    expect(TwentyFive.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentyFive.new.solve).to eq(4782)
  end
  it 'needs more tests'
end

RSpec.describe TwentySix do
  it 'should be defined' do
    expect(defined?(TwentySix)).to eq('constant')
    expect(TwentySix).to respond_to(:new)
    expect(TwentySix.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentySix.new.solve).to eq(983)
  end
  it 'needs more tests'
end

RSpec.describe TwentySeven do
  it 'should be defined' do
    expect(defined?(TwentySeven)).to eq('constant')
    expect(TwentySeven).to respond_to(:new)
    expect(TwentySeven.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentySeven.new.solve).to eq(-59_231)
  end
  it 'needs more tests'
end

RSpec.describe TwentyEight do
  it 'should be defined' do
    expect(defined?(TwentyEight)).to eq('constant')
    expect(TwentyEight).to respond_to(:new)
    expect(TwentyEight.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentyEight.new.solve).to eq(669_171_001)
  end
  it 'should provide the answer with a given parameter.' do
    expect(TwentyEight.new(5).solve).to eq(101)
  end
end

RSpec.describe TwentyNine do
  it 'should be defined' do
    expect(defined?(TwentyNine)).to eq('constant')
    expect(TwentyNine).to respond_to(:new)
    expect(TwentyNine.new).to respond_to(:solve)
  end
  it 'should provide the answer with no parameters.' do
    expect(TwentyNine.new.solve).to eq(9183)
  end
  it 'should provide the answer with a given parameter.' do
    expect(TwentyNine.new(5, 5).solve).to eq(15)
  end
end

# RSpec.describe Template do
#   it 'should be defined' do
#     expect(defined?(Template)).to eq('constant')
#     expect(Template).to respond_to(:new)
#     expect(Template.new).to respond_to(:solve)
#   end
#   it 'should provide the answer with no parameters.' do
#     expect(Template.new.solve).to eq(0)
#   end
#   it 'needs more tests'
# end
