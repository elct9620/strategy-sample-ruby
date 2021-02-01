# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/cart.rb'

class CartTest < Minitest::Test
  def setup
    super
    @cart = Cart.new
  end

  def test_black_cat_with_light_weight
    product = Product.new(30, 20, 10, 5)
    shipping_fee = calculate_shipping_fee(:black_cat, product)
    fee_should_be(150, shipping_fee)
  end

  def test_black_cat_with_heavy_weight
    product = Product.new(30, 20, 10, 50)
    shipping_fee = calculate_shipping_fee(:black_cat, product)
    fee_should_be(500, shipping_fee)
  end

  def test_hsinchu_with_small_size
    product = Product.new(30, 20, 10, 50)
    shipping_fee = calculate_shipping_fee(:hsinchu, product)
    fee_should_be(144, shipping_fee)
  end

  def test_hsinchu_with_huge_size
    product = Product.new(100, 20, 10, 50)
    shipping_fee = calculate_shipping_fee(:hsinchu, product)
    fee_should_be(480, shipping_fee)
  end

  def test_post_office_by_weight
    product = Product.new(100, 20, 10, 3)
    shipping_fee = calculate_shipping_fee(:post_office, product)
    fee_should_be(110, shipping_fee)
  end

  def test_post_office_by_size
    product = Product.new(100, 20, 10, 300)
    shipping_fee = calculate_shipping_fee(:post_office, product)
    fee_should_be(440, shipping_fee)
  end

  private

  def calculate_shipping_fee(shipper, product)
    @cart.shipping_fee(shipper, product)
  end

  def fee_should_be(expected, shipping_fee)
    assert_equal expected, shipping_fee
  end
end
