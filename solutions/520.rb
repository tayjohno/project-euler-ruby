require './lib/taylor_math.rb'

######################################
# Problem 520                        #
# ---------------------------------- #
# Sum of Multiples of Three and Five #
######################################

# NOTE: This solution is still VERY MUCH a work in progress. I'm having trouble remembering what I
# I was working on when I first went through this, but I'm remembering that I had a naiive solution
# which worked OK for smaller problems, but not nearly fast enough for the size of set we're working
# on here. The solution I was trying to come up with was one based off of valid counts for each type
# combined with a combinatorix equation (How many different numbers could those have been?/How many
# ways could those numbers have been aranged?). I figured by using simple equations for the
# combinatorix piece (e.g. how many different numbers are made from 3 distinct odd integers, etc.)
# then the only large-complexity piece would be creating all of the permutations for the original
# sets.

def five_hundred_and_twenty(_max_number = 1000)
  # Initialize values
  all_number_sets = [
    { 'o1' => 1, 'o2' => 1, 'o3' => 1 },
    { 'o1' => 1, 'e1' => 2 },
    { 'o1' => 3 }
  ]
  all_number_sets = [
    { 'o1' => 1, 'o2' => 1, 'o3' => 1, 'o4' => 1 },
    { 'o1' => 1, 'o2' => 1, 'e1' => 2 },
    { 'o1' => 3, 'o2' => 1 },
    { 'e1' => 2, 'e2' => 2 },
    { 'e1' => 4 }
  ]
  all_number_sets = [
    { 'o1' => 1, 'o2' => 1, 'o3' => 1, 'o4' => 1, 'o5' => 1 },
    { 'o1' => 1, 'o2' => 1, 'o3' => 1, 'e1' => 2 },
    { 'o1' => 1, 'e1' => 2, 'e2' => 2 },
    { 'o1' => 1, 'e1' => 4 }
  ]
  all_number_sets.each do |set|
    all_permutations = TaylorMath::Probability.npr(set.length, set.reduce(&:*))
    no_duplicate_permutations = all_permutations / TaylorMath::Probability.objects_factor(set)
    comb_with_zero = nil # TODO: Correct this value
    comb_without_zero = nil # TODO: Correct this value
  end
end

# NAIIVE approach, this will work, but takes about a minute to process even for Q(7),
# the final problem requires Q(549755813888), which would be essentially impossible
# for this particular algorithm.
def simber_count(n)
  lower_range = 10**(n - 1)
  upper_range = (10**n) - 1
  count = 0
  (lower_range..upper_range).each do |i|
    count += 1 if simber_check(i)
  end
  count
end

def simber_check(number)
  number_string = number.to_s
  number_totals = number_string.split('').inject(Hash.new(0)) { |total, e| total[e] += 1; total }
  number_totals.each do |integer, count|
    return false if integer.to_i.odd? && count.even? ||
                    integer.to_i.even? && count.odd?
  end
  true
end

def simber_sum_naiive(n)
  TaylorMath::Array.sum((1..n).map { |i| simber_count(i) })
end

def simber_sum(n)
  all_number_sets = all_number_sets(n)
  all_number_sets.each do |set|
    total_numbers = TaylorMath.sum(set['even']) + TaylorMath.sum(set['odd'])
    even_symbols = set['even'].count { |i| i != 0 }
    odd_symbols = set['odd'].count { |i| i != 0 }
    total_symbols = even_symbols + odd_symbols
    total_permutations = TaylorMath::Probability.npr(total_numbers, total_numbers) / TaylorMath::Probability.objects_factor(set)
  end
end

def all_number_sets(i, set = { 'odd' => [0, 0, 0, 0, 0], 'even' => [0, 0, 0, 0, 0] }, odd = true)
  return [] unless valid_set(set)
  if i == 0
    # puts set
    return [set]
  end
  sets = []
  if odd # If we haven't started even yet
    first_odd_zero = set['odd'].find_index { |i| i == 0 }
    if first_odd_zero
      sets += all_number_sets(i - 1, 'odd' => set['odd'].dup.tap { |s| s[first_odd_zero] += 1 }, 'even' => set['even'])
    end
    first_odd_zero ||= 5
    if first_odd_zero != 0 && i >= 2
      sets += all_number_sets(i - 2, 'odd' => set['odd'].dup.tap { |s| s[first_odd_zero - 1] += 2 }, 'even' => set['even'])
    end
  end
  if i >= 2 && i.even?
    first_even_zero = set['even'].find_index { |i| i == 0 }
    if first_even_zero
      sets += all_number_sets(i - 2, { 'odd' => set['odd'], 'even' => set['even'].dup.tap { |s| s[first_even_zero] += 2 } }, false)
    end
    first_even_zero = (first_even_zero || 5)
    if first_even_zero != 0
      sets += all_number_sets(i - 2, { 'odd' => set['odd'], 'even' => set['even'].dup.tap { |s| s[first_even_zero - 1] += 2 } }, false)
    end
  end
  sets
end

def valid_set(set)
  set['odd'].each do |i|
    return false if i.even? && i != 0
  end
  return false if set['odd'][1] > set['odd'][0]
  return false if set['odd'][2] > set['odd'][1]
  return false if set['odd'][3] > set['odd'][2]
  return false if set['odd'][4] > set['odd'][3]
  set['even'].each do |i|
    return false if i.odd?
  end
  return false if set['even'][1] > set['even'][0]
  return false if set['even'][2] > set['even'][1]
  return false if set['even'][3] > set['even'][2]
  return false if set['even'][4] > set['even'][3]
  true
end
