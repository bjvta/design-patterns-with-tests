# frozen_string_literal: true

class Connection
  attr_accessor :value

  @@instance = nil

  private_class_method :new

  def self.instance
    @@instance ||= new
  end
end