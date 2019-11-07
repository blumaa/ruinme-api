class User < ApplicationRecord
  has_many :relationships_a
  has_many :relationships_b

  def relationships
    self.relationships_a + self.relationships_b
  end

end
