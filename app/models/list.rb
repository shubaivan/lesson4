class List < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  has_and_belongs_to_many :users
  belongs_to :user

  scope :for, lambda { |user|
    joins('LEFT JOIN lists_users ON lists.id = lists_users.list_id')
      .where('lists_users.user_id = :user OR lists.user_id = :user', user: user)
  }
end
