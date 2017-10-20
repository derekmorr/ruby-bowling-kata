class Bowling

  def self.score_mutable(frames)
    score = 0
    frames.each do |throws|
      score += Score.new(throws).tally
    end
    score
  end

  def self.score(frames)
    # partial_totals = frames.map(&:sum) # makes a new array of numbers
    # partial_totals.sum # sums the numbers

    frames.inject(State.new(0, false)) do |state, throws|
      this_frame = Frame.new(throws)
      # if previous frame was a spare, add extra points
      if state.spare
        new_score = 10 + throws[0] + this_frame.score + state.score
        State.new(new_score, this_frame.spare?)
      else
        new_score = this_frame.score + state.score
        State.new(new_score, this_frame.spare?)
      end
    end.score
  end

end

class Frame
  attr_reader :throws

  def initialize(throws)
    @throws = throws
  end

  def tally
    throws.sum
  end

  def spare?
    tally == 10
  end

  def score
    # if we got a spare, we collect the points on the next throw
    if spare?
      0
    else
      tally
    end
  end
end

class State
  attr_reader :score, :spare

  def initialize(score, spare)
    @score = score
    @spare = spare
  end
end