# frozen_string_literal: true

module Shipper
  class PostOffice < Base
    def shipping_fee
      return fee_by_weight if fee_by_weight < fee_by_size

      fee_by_size
    end

    def fee_by_weight
      80 + weight * 10
    end

    def fee_by_size
      size * 0.00002 * 1100
    end
  end
end
