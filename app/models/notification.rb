class Notification < ApplicationRecord
  attr_accessor :title, :content

  validates :phone_number, presence: true, format: { with: /\A\+\d{10,15}\z/, message: "must be in E.164 format" }
  validates :content, presence: true, length: { maximum: 160 }
end
