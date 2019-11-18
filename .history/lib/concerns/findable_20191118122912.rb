module Concerns::Findable
  # def find_by_name(name)
  #   self.all.detect {|a| a.name == name}
  # end

  # def find_or_create_by_name(name)
  #   self.all.detect {|artist| artist.find_by_name(name) || self.create(name)} # Finds or creates instance
  # end
  def find_by_name(name)
    self.all.detect {|a| a.name == name} # Iterated through @@all to find name
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name) # Finds or creates instance
  end
end 