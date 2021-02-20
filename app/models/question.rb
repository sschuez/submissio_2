class Question < ApplicationRecord
  belongs_to :section, dependent: :destroy_async
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
end
