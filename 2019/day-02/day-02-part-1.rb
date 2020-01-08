class Day02
  def file_input
    File.read(File.expand_path("../day-02-input.txt", __FILE__)).split(',').map &:to_i
  end

  def opcodes
    {1 => :+, 2 => :*, 99 => "ok"}
  end

  def part01(input: file_input)
    result = nil
    finish = input.size - 1
    (0..finish).step(4) do |i|
      value, pos1, pos2, replace = input[i..i+3]
      action = opcodes[value]

      break if action == "ok"
      raise "Something went wrong, value: #{value}, index: #{i}" if action == nil

      op1 = input[pos1]
      op2 = input[pos2]

      result = op1.send(action, op2)
      input[replace] = result
      input[1] = 12
      input[2] = 2
    end
    result
  end
end

RSpec.describe Day02 do
  it "part 1" do
    expect(subject.part01(input: [1,0,0,0,99])).to eq(2)
    expect(subject.part01(input: [2,3,0,3,99])).to eq(6)
    expect(subject.part01(input: [2,4,4,5,99,0])).to eq(9801)
    expect(subject.part01(input: [1,1,1,4,99,5,6,0,99])).to eq(30)
    expect(subject.part01).to eq(4330636)
  end

  it "part 2"
end
