class Webinar < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    validates :price, presence: true
    validates :startdate, presence: true

    after_create do
        # Create Stripe IDs for the product and its pricing
        product = Stripe::Product.create(name: title)
        price = Stripe::Price.create(product: product, unit_amount: self.price, currency: "usd")
        update(stripe_product_id: product.id)
    end
end
