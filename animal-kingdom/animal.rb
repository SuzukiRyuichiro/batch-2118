class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.phyla
    %w[Porifera Cnidaria Platyhelminthes Nematoda Annelida Arthropoda Mollusca Echinodermata
       Chordata]
  end

  def eat(food)
    "#{name} eats a #{food}."
  end
end
