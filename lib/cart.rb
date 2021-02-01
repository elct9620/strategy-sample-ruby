# frozen_string_literal: true

require_relative './shipper'

class Cart
  def shipping_fee(shipper, length, width, height, weight)
    Shipper[shipper]
      .new(length, width, height, weight)
      .shipping_fee
  end
end
