# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bob::Employees do
  before do
    allow(RestClient).to receive(:get).with(url, { Authorization: 'Basic Og==' }).and_return(response)
    allow(Bob).to receive(:configuration).and_return({ access_token: 'access-token', api_version: 'v1' })
  end

  describe '.all' do
    let(:url) { 'https://api.hibob.com/v1/people?includeHumanReadable=true' }

    let(:response) { instance_double(RestClient::Response, body: { employees: [{ 'id' => 123 }] }.to_json) }

    it 'fetches a response' do
      result = described_class.all
      expect(result.first.id).to eq(123)
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
    let(:url) { 'https://api.hibob.com/v1/people/1?includeHumanReadable=true' }
    let(:response) { instance_double(RestClient::Response, body: { id: 123 }.to_json) }

    it 'fetches a response' do
      result = described_class.find(1)
      expect(result.id).to eq(123)
    end

    it 'performs request' do
      described_class.find(1)
      expect(RestClient).to have_received(:get).with(url, { Authorization: 'Basic Og==' }).once
    end
  end
end
