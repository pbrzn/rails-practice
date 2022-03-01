class Post < ApplicationRecord
  belongs_to :user

  scope :order_by_date, -> {order("date DESC")}
  scope :alphabetical_order, -> {order("title ASC")}
  scope :created_before, -> (date) {where("created_at < ?", date)}
end
