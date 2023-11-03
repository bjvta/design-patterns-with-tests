# frozen_string_literal: true

class Connection
  attr_accessor :is_connected

  @@instance = nil

  private_class_method :new

  def self.instance
    @@instance ||= new
  end

  def connect
    self.is_connected = true
  end

  def disconnect
    self.is_connected = false
  end
end