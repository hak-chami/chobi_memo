class Word < ApplicationRecord
  belongs_to :user
  validates :word, presence: true
  validates :kana, presence: true
  validates :content, presence: true
  validates :content_replace, presence: true

  def self.text_conversion(content_text)
    content_text.gsub(/\[.+\]\(http.+\)/) do |text|
      url_title = text.slice(/\[.+\]/).delete('[').delete(']')
      url_address = text.slice(/\(http.+\)/).delete('(').delete(')')
      "<a href=\"#{url_address}\" target=\"_blank\">#{url_title}</a>"
    end
  end
  
end
