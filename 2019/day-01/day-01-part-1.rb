def part01
  spacial_modules = Array(File.readlines(File.expand_path("../day-01-input.txt", __FILE__)))
  spacial_modules.map{|m| (m.to_i / 3) - 2 }.reduce(:+)
end

def part02
end

RSpec.describe "day 01" do
  it "part 1" do
    expect(part01).to eq(3297626)
  end
end
