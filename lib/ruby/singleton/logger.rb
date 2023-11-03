# frozen_string_literal: true

class Logger
  attr_accessor :obj

  @@instance = nil

  private_class_method :new

  def self.instance
    @@instance ||= new
  end

  def initialize
    @obj = File.open('log.txt', 'a')
  end

  def log(message)
    @obj.puts(message)
  end

  def close
    @obj.close
  end
end