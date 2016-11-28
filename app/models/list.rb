class List < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  has_and_belongs_to_many :users
end
