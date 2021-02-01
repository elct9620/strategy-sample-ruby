# frozen_string_literal: true

module Shipper
  class BlackCat < Base
    def shipping_fee
      return 500 if weight > 20

      100 + weight * 10
    end
  end
end
