class Contact < ApplicationRecord
  validates :name, length: { minimum: 4 }
  validates :cpf_cnpj, numericality: { only_integer: true }
  validates :active, :birthday, :email, :mobile, :advertising, presence: true
end
