# frozen_string_literal: true

RSpec.describe Bob do
  it 'has a version number' do
    expect(Bob::VERSION).not_to be_nil
  end
end
