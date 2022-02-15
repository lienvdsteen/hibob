# frozen_string_literal: true

module Bob
  class Webhooks
    def self.calculate_signature(body:, key: ENV['BOB_WEBHOOK_SECRET'])
      digest = OpenSSL::Digest.new('sha512')
      Base64.strict_encode64(OpenSSL::HMAC.digest(digest, key, body))
    end
  end
end
