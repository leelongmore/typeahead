class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  def self.named_like(term)
    term = "%#{term.strip}%"
    self.where('name LIKE ?', term)
  end
end
