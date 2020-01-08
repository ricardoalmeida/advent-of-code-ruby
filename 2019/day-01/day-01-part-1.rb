def spacial_modules
  Array(File.readlines(File.expand_path("../day-01-input.txt", __FILE__)))
end

def calc_fuel(mass)
  (mass.to_i / 3) - 2
end

def calc_fuel_plus_mass(mass)
  return 0 if (fuel = calc_fuel(mass)) <= 0
  fuel + calc_fuel_plus_mass(fuel)
end

def part01(input: spacial_modules)
  input.map{|m| calc_fuel(m) }.sum
end

def part02(input: spacial_modules)
  input.map{|m| calc_fuel_plus_mass(m) }.sum
end

RSpec.describe "day 01" do
  it "part 1" do
    expect(part01).to eq(3297626)
  end

  it "part 2" do
    expect(part02(input: [14])).to eq(2)
    expect(part02(input: [1969])).to eq(966)
    expect(part02(input: [100756])).to eq(50346)
    expect(part02).to eq(4943578)
  end
end
