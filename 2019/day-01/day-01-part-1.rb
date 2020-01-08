class Day01
  def file_input
    Array(File.readlines(File.expand_path("../day-01-input.txt", __FILE__)))
  end

  def calc_fuel(mass)
    (mass.to_i / 3) - 2
  end

  def calc_fuel_plus_mass(mass)
    return 0 if (fuel = calc_fuel(mass)) <= 0
    fuel + calc_fuel_plus_mass(fuel)
  end

  def part01(input: file_input)
    input.map{|m| calc_fuel(m) }.sum
  end

  def part02(input: file_input)
    input.map{|m| calc_fuel_plus_mass(m) }.sum
  end
end

RSpec.describe Day01 do
  it "part 1" do
    expect(subject.part01).to eq(3297626)
  end

  it "part 2" do
    expect(subject.part02(input: [14])).to eq(2)
    expect(subject.part02(input: [1969])).to eq(966)
    expect(subject.part02(input: [100756])).to eq(50346)
    expect(subject.part02).to eq(4943578)
  end
end
