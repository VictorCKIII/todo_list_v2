class List < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :title, presence: { message: "Não pode ficar em branco" }
end
