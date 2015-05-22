require "spec_helper"

using XProc

describe XProc do
  it "has a version number" do
    expect(XProc::VERSION).not_to be nil
  end

  it "can be used to cast an expression to a proc" do
    result = ["foo", "bar", "quox"].map(&x.gsub("oo", "aa")).select(&x.length <= 3)
    expect(result).to eq(["faa", "bar"])
  end

  it "can use positional arguments" do
    result = [1,2,3,4,5].reduce(&x1 * x2)
    expect(result).to eq(120)
  end

  it "can chain stuff" do
    result = [1,2,3,4,5].map(&x * 2 + 1)
    expect(result).to eq([3, 5, 7, 9, 11])
  end

  it "can use ==" do
    result = { 1 => 1, 2 => 3 }.select(&x[0] == x[1])
    expect(result).to eq({ 1 => 1 })
  end

  it "can use !=" do
    result = { 1 => 1, 2 => 3 }.select(&x[0] != x[1])
    expect(result).to eq({ 2 => 3 })
  end

  it "can use unary !" do
    result = [true, false].select(&!x)
    expect(result).to eq([false])
  end
end
