class User < ApplicationRecord
  has_many :relationships_a, class_name: 'Relationship', foreign_key: 'user_1_id'
  has_many :relationships_b, class_name: 'Relationship', foreign_key: 'user_1_id'

  validates :email, uniqueness: { case_insensitive: false}

  has_secure_password

  def relationships
    (self.relationships_a + self.relationships_b).uniq
  end

  def relationships_with_messages
    payload = self.relationships.map {|rel|
      if rel.user_1_id == self.id
        user = rel.user_2
      else
        user = rel.user_1
      end
      {user: user, relationship_id: rel.id, pending: rel.pending, messages: rel.messages, created_at: rel.created_at}
    }

    payload
  end

end
