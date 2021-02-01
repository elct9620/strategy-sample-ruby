# frozen_string_literal: true

module Shipper
  class Base
    attr_reader :length, :width, :height, :weight

    def initialize(length, width, height, weight)
      @length = length
      @width = width
      @height = height
      @weight = weight
    end

    def shipping_fee
      0
    end

    def size
      @size ||= length * width * height
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
