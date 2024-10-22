# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'uri'
require 'base64'
require 'csv'

module Bob
  class API
    BASE_URL = 'https://api.hibob.com'
    SANDBOX_URL = 'https://api.sandbox.hibob.com'

    def self.get(endpoint, params = {}, csv_response: false)
      url = build_url(endpoint, params)
      response = RestClient.get(url, headers)
      return create_csv(response.body) if csv_response

      JSON.parse(response.body)
    end

    def self.post(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.post(
        url,
        params.to_json,
        headers
      )
    rescue RestClient::BadRequest => e
      p e
      response.code if response.try(:code)
    end

    def self.post_media(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.post(url, params.to_json, headers)
      response.code
    end

    def self.post_file(endpoint, file_path)
      url = build_url(endpoint)
      payload = {
        multipart: true,
        file: File.new(file_path)
      }

      response = RestClient.post(url, payload, headers.merge({ 'Content-Type': 'multipart/form-data' }))
      response.code
    end

    def self.delete(endpoint)
      url = build_url(endpoint)
      response = RestClient.delete(url, headers)
      response.code
    end

    def self.put(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.put(
        url,
        params.to_json,
        headers
      )
      response.code
    end

    def self.headers
      {
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Authorization: "Basic #{Base64.strict_encode64("#{Bob.access_user_name}:#{Bob.access_token}")}"
      }
    end

    def self.build_url(endpoint, params = {})
      url = "#{BASE_URL}/#{Bob.api_version}/#{endpoint}" unless Bob.use_sandbox
      url = "#{SANDBOX_URL}/#{Bob.api_version}/#{endpoint}" if Bob.use_sandbox
      url += "?#{URI.encode_www_form(params)}" unless params.empty?

      url
    end

    def self.create_csv(content)
      file_name = SecureRandom.alphanumeric(15)

      content.gsub!("\r", '').gsub!('﻿', '')
      splitted = content.split("\n")
      CSV.open("tmp/#{file_name}.csv", 'wb') do |csv|
        csv << splitted.shift.split(',')
        splitted.each do |row|
          csv << CSV.parse_line(row)
        end
      end

      "tmp/#{file_name}.csv"
    end
  end
end
