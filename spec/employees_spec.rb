# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bob::Employees do
  before do
    allow(RestClient).to receive(:get).with(url, { Authorization: 'Basic Og==' }).and_return(response)
    allow(RestClient).to receive(:post).with(url, anything, anything).and_return(response)
    allow(Bob).to receive(:configuration).and_return({ access_token: 'access-token', api_version: 'v1' })
  end

  describe '.all' do
    let(:url) { 'https://api.hibob.com/v1/people/search' }
    let(:response) { { employees: [{ 'id' => 123 }] }.to_json }

    it 'fetches a response' do
      result = described_class.search
      expect(result.first.id).to eq(123)
    end

    it 'performs request' do
      described_class.search
      expect(RestClient).to have_received(:post).with(url, anything, anything).once
    end

    context 'when it is a request with query params' do
      it 'performs request with params' do
        described_class.search(showInactive: true)
        expect(RestClient).to have_received(:post).with(url, anything, anything).once
      end
    end
  end

  describe '.find' do
    let(:url) { 'https://api.hibob.com/v1/people/1' }
    let(:response) { { id: 123 }.to_json }

    it 'fetches a response' do
      result = described_class.find(1)
      expect(result.id).to eq(123)
    end

    it 'performs request' do
      described_class.find(1)
      expect(RestClient).to have_received(:post).with(url, anything, anything).once
    end
  end
end
