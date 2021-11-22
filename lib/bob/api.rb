# frozen_string_literal: true

require 'rest-client'
require 'json'
require 'uri'
require 'base64'

module Bob
  class API
    BASE_URL = 'https://api.hibob.com'

    def self.get(endpoint, params = {})
      url = build_url(endpoint, params)
      response = RestClient.get(url, headers)
      JSON.parse(response.body)
    end

    def self.post(endpoint, params = {})
      url = build_url(endpoint)
      response = RestClient.post(url, params.to_json, headers.merge(content_headers))
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
  end
end
