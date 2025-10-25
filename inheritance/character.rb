class Character
  attr_reader :name, :health

  def initialize(name, health)
    # set attributes to the instance
    @name = name
    @health = health
  end

  def total_power
    puts 'hey im in total power method of Character'
    @health * 1.5
  end
end
