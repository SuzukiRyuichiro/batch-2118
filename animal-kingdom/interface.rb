require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

simba = Lion.new('Simba')
nala = Lion.new('Nala')
timone = Meerkat.new('Timone')
pumba = Warthog.new('Pumba')

animals = [simba, timone, pumba, nala]

animals.each do |animal|
  puts animal.talk
end
