require_relative 'character'

class Wizard < Character
  attr_accessor :warrior

  def can_cast_spell?
    true
  end

  def introduce
    # It is implied but you can be explicit about it
    "Hello my name is #{self.name}, and I have total health of #{self.health}"
  end

  def self.spells
    ['Fireballs', 'Magic Missile', 'Expensive Petroleum']
  end

  def self.spell_details(spell)
    case spell
    when 'Fireball' then 'Fireball crisps the competition'
    when 'Lightning Bolt' then 'Lightning Bolt has shocking power'
    when 'Magic Missile' then 'Magic Missile never misses its target'
    else raise Exception.new("No details for #{spell}")
    end
  end
end
