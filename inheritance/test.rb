require_relative 'wizard'
require_relative 'warrior'

hisham = Wizard.new('Hisham', 3500)
# puts hisham.introduce

# puts hisham.total_power
# puts "#{hisham.name} #{hisham.can_cast_spell? ? 'can cast spell' : 'cannot cast spell'}"

renato = Warrior.new('Renato', 10_000)

# puts renato.total_power
# puts "#{renato.name} #{renato.can_cast_spell? ? 'can cast spell' : 'cannot cast spell'}"

# puts Wizard.spells
# # puts hisham.spells -> this now throws an undefined error

# puts Wizard.spell_details('Fireball')

# Join forces
renato.join_forces(hisham)
p renato
p hisham
