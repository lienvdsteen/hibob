# frozen_string_literal: true

require 'net/sftp'

module Bob
  class Reports < API
    def self.all
      get('company/reports')
    end

    def self.read(report_id, params = {})
      params = {format: 'csv'}.merge(params)

      get("company/reports/#{report_id}/download", params, csv_response: true)
    end

    def self.read_table_report(report_id)
      get("people/custom-tables/metadata/#{report_id}")
    end

    def self.sftp_upload(sftp_details:, report_id:)
      file_name = read(report_id)
      uri = URI.parse("sftp://#{sftp_details[:host]}")

      Net::SFTP.start(uri.host, sftp_details[:user], password: sftp_details[:password]) do |sftp|
        sftp.upload!(file_name, sftp_details[:remote_file_path])
      end

      File.delete(file_name)

      true
    end
  end
end
