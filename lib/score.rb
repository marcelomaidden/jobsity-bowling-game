class Score
  def initialize(player, pinfalls)
    @player = player
    @pinfalls = pinfalls
    @frames = []
    create_frames
    p @frames
  end

  private

  def create_frames
    until @pinfalls.empty?
      if @pinfalls[0] == '10'
        @frames.push([@pinfalls.shift])
      else
        frame = []
        2.times { frame.push(@pinfalls.shift) }
        @frames.push(frame)
      end
    end
  end
end
