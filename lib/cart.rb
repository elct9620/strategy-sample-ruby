# frozen_string_literal: true

require_relative './shipper'
require_relative './product'

class Cart
  def shipping_fee(shipper, product)
    Shipper[shipper]
      .new(product)
      .shipping_fee
  end
end
