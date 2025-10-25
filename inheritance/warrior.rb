require_relative 'character'

class Warrior < Character
  attr_reader :wizard

  def can_cast_spell?
    false
  end

  def total_power
    super * 2
    # Do extra stuff on top of it
  end

  def join_forces(wizard) # argument is an Wizard instance
    @wizard = wizard
    # wizard instance, your warrior is me!
    @wizard.warrior = self
  end
end
