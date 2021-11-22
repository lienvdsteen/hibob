# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bob::Employees do
  let(:url) { 'https://api.hibob.com/v1/people' }
  let(:response) { double(body: '[{"test":"test"}]') }

  before do
    allow(RestClient).to receive(:get).with(url, { Authorization: 'Basic Og==' }).and_return(response)
    allow(Bob).to receive(:configuration).and_return({ access_token: 'access-token', api_version: 'v1' })
  end

  describe '.all' do
    it 'fetches a response' do
      result = described_class.all
      expect(result).to eq(['test' => 'test'])
    end

    it 'performs request' do
      described_class.all
      expect(RestClient).to have_received(:get).with(url, { Authorization: 'Basic Og==' }).once
    end

    context 'when it is a request with query params' do
      let(:url) { 'https://api.hibob.com/v1/people?showInactive=true' }

      it 'performs request with params' do
        described_class.all(showInactive: true)
        expect(RestClient).to have_received(:get).with(url, { Authorization: 'Basic Og==' }).once
      end
    end
  end

  describe '.find' do
    let(:url) { 'https://api.hibob.com/v1/people/1' }

    it 'fetches a response' do
      result = described_class.find(1)
      expect(result).to eq(['test' => 'test'])
    end

    it 'performs request' do
      described_class.find(1)
      expect(RestClient).to have_received(:get).with(url, { Authorization: 'Basic Og==' }).once
    end
  end
end
