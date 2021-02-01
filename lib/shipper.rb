# frozen_string_literal: true

require 'forwardable'

module Shipper
  class Base
    extend Forwardable

    delegate %i[length width height weight size] => :product

    attr_reader :product

    def initialize(product)
      @product = product
    end

    def shipping_fee
      0
    end
  end

  require_relative './shipper/black_cat'
  require_relative './shipper/hsinchu'
  require_relative './shipper/post_office'

  module_function

  def [](name)
    name = name.to_s.split('_').map(&:capitalize).join
    Shipper.const_get(name)
  rescue NameError
    raise ArgumentError, "shipper #{name} does not exist"
  end
end
