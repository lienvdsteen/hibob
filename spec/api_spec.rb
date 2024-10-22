# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bob::API do
  let(:url) { 'https://api.hibob.com/v1/test' }
  let(:response) { double(body: '[{"test":"test"}]') }

  describe '.get' do
    before do
      allow(RestClient).to receive(:get).with(url,
                                              { Accept: 'application/json', Authorization: 'Basic Og==',
                                                'Content-Type': 'application/json' }).and_return(response)
      allow(Bob).to receive(:configuration).and_return({ access_token: 'access-token', api_version: 'v1' })
    end

    it 'performs request' do
      result = described_class.get('test')
      expect(result).to eq(['test' => 'test'])
      expect(RestClient).to have_received(:get).with(url,
                                                     { Accept: 'application/json', Authorization: 'Basic Og==',
                                                       'Content-Type': 'application/json' }).once
    end
  end
end
