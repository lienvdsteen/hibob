# frozen_string_literal: true

module Bob
  class Webhooks
    def self.calculate_signature(body:, key: ENV.fetch('BOB_WEBHOOK_SECRET', nil))
      digest = OpenSSL::Digest.new('sha512')
      Base64.strict_encode64(OpenSSL::HMAC.digest(digest, key, body))
    end
  end
end
