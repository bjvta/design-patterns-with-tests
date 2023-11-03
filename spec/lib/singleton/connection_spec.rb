# frozen_string_literal: true

require_relative '../../../lib/ruby/singleton/connection'

RSpec.describe Connection do
  it 'should return the same instance' do
    instance1 = Connection.instance
    instance1.value = 10

    instance2 = Connection.instance
    expect(instance1).to eq(instance2)
    expect(instance2.value).to eq(10)
  end

  it 'prevents instantiation of new instances' do
    expect { Connection.new }.to raise_error(NoMethodError)
  end
end