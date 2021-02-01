# frozen_string_literal: true

class Cart
  def shipping_fee(shipper, length, width, height, weight)
    shipper_method = "shipper_#{shipper}"
    raise ArgumentError, 'shipper does not exist' unless respond_to?(shipper_method, true)

    send(shipper_method, length, width, height, weight)
  end

  protected

  def shipper_black_cat(length, width, height, weight)
    if weight > 20
      500
    else
      100 + weight * 10
    end
  end

  def shipper_hsinchu(length, width, height, weight)
    size = length * width * height
    if length > 100 or width > 100 or height > 100
      size * 0.00002 * 1100 + 500
    else
      size * 0.00002 * 1200
    end
  end

  def shipper_post_office(length, width, height, weight)
    fee_by_weight = 80 + weight * 10
    size = length * width * height
    fee_by_size = size * 0.00002 * 1100
    return fee_by_weight if fee_by_weight < fee_by_size

    fee_by_size
  end
end
