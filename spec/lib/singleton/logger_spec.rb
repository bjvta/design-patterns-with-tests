# frozen_string_literal: true

require 'byebug'
require_relative '../../../lib/ruby/singleton/logger'

RSpec.describe Logger do
  let(:logger) { Logger.instance }
  let(:log_file_path) { 'log.txt' }

  before do
    File.delete(log_file_path) if File.exists?(log_file_path)
  end

  after do
    logger.close
    File.delete(log_file_path) if File.exists?(log_file_path)
  end

  it 'writes log messages in the log file' do
    logger.log('Message 1')
    logger.log('Message 2')
    logger.close

    log_content = File.read(log_file_path)
    expect(log_content).to include('Message 1')
    expect(log_content).to include('Message 2')
  end

  it 'prevents instantiation of new instances' do
    expect { Logger.new }.to raise_error(NoMethodError)
  end

  it 'should return the same instance' do
    logger1 = Logger.instance
    logger2 = Logger.instance

    expect(logger1).to eq(logger2)
  end
end