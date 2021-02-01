# frozen_string_literal: true

module Shipper
  class Hsinchu < Base
    def shipping_fee
      if length > 100 || width > 100 || height > 100
        size * 0.00002 * 1100 + 500
      else
        size * 0.00002 * 1200
      end
    end
  end
end
