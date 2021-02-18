class Question < ApplicationRecord
  belongs_to :section
  has_many :answers, dependent: :nullify
  accepts_nested_attributes_for :answers
end
