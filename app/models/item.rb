class Item < ApplicationRecord
  belongs_to :list
  validates :content, presence: { message: "Adicione um item válido" }
end
