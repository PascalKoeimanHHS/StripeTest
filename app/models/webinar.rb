class Webinar < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :price, presence: true
    validates :startdate, presence: true
end
