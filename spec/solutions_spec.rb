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

RSpec.describe 'eight' do
  it 'should be defined' do
    expect(defined?(eight)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(eight).to eq(23_514_624_000)
  end
  it 'needs more tests'
end

RSpec.describe 'nine' do
  it 'should be defined' do
    expect(defined?(nine)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(nine).to eq(31_875_000)
  end
  it 'needs more tests'
end

RSpec.describe 'ten' do
  it 'should be defined' do
    expect(defined?(ten)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(ten).to eq(142_913_828_922)
  end
  it 'needs more tests'
end

RSpec.describe 'eleven' do
  it 'should be defined' do
    expect(defined?(eleven)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(eleven).to eq(70_600_674)
  end
  it 'needs more tests'
end

RSpec.describe 'twelve' do
  it 'should be defined' do
    expect(defined?(twelve)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twelve).to eq(76_576_500)
  end
  it 'needs more tests'
end

RSpec.describe 'thirteen' do
  it 'should be defined' do
    expect(defined?(thirteen)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(thirteen).to eq(5_537_376_230)
  end
  it 'needs more tests'
end

RSpec.describe 'fourteen' do
  it 'should be defined' do
    expect(defined?(fourteen)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(fourteen).to eq(837_799)
  end
  it 'needs more tests'
end

RSpec.describe 'fifteen' do
  it 'should be defined' do
    expect(defined?(fifteen)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(fifteen).to eq(137_846_528_820)
  end
  it 'needs more tests'
end

RSpec.describe 'sixteen' do
  it 'should be defined' do
    expect(defined?(sixteen)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(sixteen).to eq(1366)
  end
  it 'needs more tests'
end

RSpec.describe 'seventeen' do
  it 'should be defined' do
    expect(defined?(seventeen)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(seventeen).to eq(21_124)
  end
  it 'needs more tests'
end

RSpec.describe 'eighteen' do
  it 'should be defined' do
    expect(defined?(eighteen)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(eighteen).to eq(1074)
  end
  it 'needs more tests'
end

RSpec.describe 'nineteen' do
  it 'should be defined' do
    expect(defined?(nineteen)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(nineteen).to eq(171)
  end
  it 'needs more tests'
end

RSpec.describe 'twenty' do
  it 'should be defined' do
    expect(defined?(twenty)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twenty).to eq(648)
  end
  it 'needs more tests'
end

RSpec.describe 'twentyone' do
  it 'should be defined' do
    expect(defined?(twentyone)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twentyone).to eq(31_626)
  end
  it 'needs more tests'
end

RSpec.describe 'twentytwo' do
  it 'should be defined' do
    expect(defined?(twentytwo)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twentytwo).to eq(871_198_282)
  end
  it 'needs more tests'
end

RSpec.describe 'twentythree' do
  it 'should be defined' do
    expect(defined?(twentythree)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twentythree).to eq(4_179_871)
  end
  it 'needs more tests'
end

RSpec.describe 'twentyfour' do
  it 'should be defined' do
    expect(defined?(twentyfour)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twentyfour).to eq('2783915460')
  end
  it 'needs more tests'
end

RSpec.describe 'twentyfive' do
  it 'should be defined' do
    expect(defined?(twentyfive)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twentyfive).to eq(4782)
  end
  it 'needs more tests'
end

RSpec.describe 'twentysix' do
  it 'should be defined' do
    expect(defined?(twentysix)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twentysix).to eq(983)
  end
  it 'needs more tests'
end

RSpec.describe 'twentyseven' do
  it 'should be defined' do
    expect(defined?(twentyseven)).to eq('method')
  end
  it 'should provide the answer with no parameters.' do
    expect(twentyseven).to eq(-59_231)
  end
  it 'needs more tests'
end

# RSpec.describe 'template' do
#   it 'should be defined' do
#     expect(defined?(template)).to eq('method')
#   end
#   it 'should provide the answer with no parameters.' do
#     expect(template).to eq(0)
#   end
#   it 'needs more tests'
# end
