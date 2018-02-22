class Contact < ApplicationRecord
  has_many :notes
  has_one :address

  #VALIDATION

  # Confirmation, repeating entry
  validates :email, confirmation: true

  # Inclusion
  validates :state, inclusion: {
    in: %w(Utah Idaho California)
    message "%{value} is not a vaild state"
  }

  #Length
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum 50 }
  validates :email, length: { in: 6..20 }
  validates :phone, length: { is: 10 }

  #Numericality
  validates :age, numericality: true
  validates :age, numericality: { only_integer: true }
  validates :age, numericality: { less_than_or_equal: 100, greater_than_or_equal: 2 }

  #Presence
  validates :name, :phone, :email, presence :true

  #Uniqueness
  validates :email, uniqueness: true

  #


end
