# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'uri'
require 'base64'
require 'csv'

module Bob
  class API
    BASE_URL = 'https://api.hibob.com'

    def self.get(endpoint, params = {}, csv_response = false)
      url = build_url(endpoint, params)
      response = RestClient.get(url, headers)
      return create_csv(response.body) if csv_response

      JSON.parse(response.body)
    end

    def self.post(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.post(url, params.to_json, headers.merge(content_headers))
      response.code
    end

    def self.delete(endpoint)
      url = build_url(endpoint)
      response = RestClient.delete(url)
      response.code
    end

    def self.put(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.put(url, params.to_json, headers.merge(content_headers))
      response.code
    end

    def self.headers
      {
        Authorization: "Basic #{Base64.strict_encode64("#{Bob.access_user_name}:#{Bob.access_token}")}"
      }
    end

    def self.content_headers
      {
        Accept: 'application/json',
        'Content-Type': 'application/json'
      }
    end

    def self.build_url(endpoint, params = {})
      url = "#{BASE_URL}/#{Bob.api_version}/#{endpoint}"
      url += "?#{URI.encode_www_form(params)}" unless params.empty?

      url
    end

    private

    def self.create_csv(content)
      content.gsub!("\r", '').gsub!("﻿", '')
      splitted = content.split("\n")
      CSV.open("response.csv", "wb") do |csv|
        csv << splitted.shift.split(',')
        splitted.each do |row|
          csv << row.split(',')
        end
      end
    end
  end
end
