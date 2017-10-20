require 'spec_helper.rb'
require './bowling.rb'

describe Bowling do

  it "should score gutter balls" do
    throws = [0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]
    expect(Bowling.score(throws)).to eq(0)
  end

  it "should score all threes" do
    throws = [3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3],[3,3]
    expect(Bowling.score(throws)).to eq(60)
  end

  it "should score all spares with first ball a 4" do
    throws = [4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6],[4,6,4]
    expect(Bowling.score(throws)).to eq(140)
  end

  it "should score Nine Strikes followed by a gutter ball" do
    throws = [10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[0,0]    
    expect(Bowling.score(throws)).to eq(240)
  end

  it "should score a perfect game" do
    throws = [10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,0],[10,10,10]
    expect(Bowling.score(throws)).to eq(300)
  end

end