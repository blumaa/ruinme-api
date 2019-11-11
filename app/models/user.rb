class User < ApplicationRecord
  has_many :relationships_a
  has_many :relationships_b

  validates :email, uniqueness: { case_insensitive: false} 

  has_secure_password

  def relationships
    self.relationships_a + self.relationships_b
  end

end
