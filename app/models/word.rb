class Word < ApplicationRecord
  belongs_to :user
  validates :word, presence: true
  validates :kana, presence: true
  validates :content, presence: true
end
