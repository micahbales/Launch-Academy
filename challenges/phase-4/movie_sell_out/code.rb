class Theater

  attr_reader :seats, :patrons

  def initialize(seats)
    @seats = seats
    @patrons = 0
  end

  def admit!(tickets = 1)
    if tickets + @patrons > @seats
      puts "We're all full, we can't admit #{tickets} more for this show."
    else
      @patrons += tickets
    end
  end

  def at_capacity?
    @seats == @patrons
  end

  def record_walk_outs(walk_outs = 1)
    @patrons -= walk_outs
end
