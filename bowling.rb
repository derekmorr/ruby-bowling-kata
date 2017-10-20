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

    frames.inject(Frame.new(0, false)) do |accumulator, throws|
      this_frame = Score.new(throws).process_frame
      # if previous frame was a spare, add extra points
      if accumulator.spare
        new_score = 10 + throws[0] + this_frame.score + accumulator.tally
        Frame.new(new_score, this_frame.spare)
      else
        new_score = this_frame.score + accumulator.tally
        Frame.new(new_score, this_frame.spare)
      end
    end.tally
  end

end

class Score
  attr_reader :throws

  def initialize(throws)
    @throws = throws
  end

  def process_frame
    Frame.new(tally, spare?)
  end

  def tally
    throws.sum
  end

  def spare?
    tally == 10
  end
end

class Frame
  attr_reader :tally, :spare

  def initialize(tally, spare)
    @tally = tally
    @spare = spare
  end

  def score
    # if we got a spare, we collect the points on the next throw
    if spare
      0
    else
      tally
    end
  end
end