class User < ApplicationRecord
  has_many :relationships_a, class_name: 'Relationship', foreign_key: 'user_1_id'
  has_many :relationships_b, class_name: 'Relationship', foreign_key: 'user_2_id'

  validates :email, uniqueness: { case_insensitive: false}

  has_secure_password

  def relationships
    (self.relationships_a + self.relationships_b).uniq
  end

  def relationships_with_messages
    payload = self.relationships.map {|rel|
      puts "*********current_user id**************"
      puts self.id
      puts "*********user 2**************"
      puts rel.user_2.id
      puts "*********user 1**************"
      puts rel.user_1.id
      {receiver: rel.user_2, requester: rel.user_1, relationship_id: rel.id, pending: rel.pending, messages: rel.messages, created_at: rel.created_at}
    }

    payload
  end

end
