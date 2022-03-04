# frozen_string_literal: true

module Models
  class Employee < Models::Base
    def manager?
      work.is_manager
    end

    def job_title
      human_readable.work.title
    end

    def start_date
      work.start_date
    end

    def department
      work.department
    end

    def division
      human_readable.work.custom_columns.column_1629151319875
    end

    def team
      human_readable.work.custom_columns.column_1642024758438
    end

    def entity
      human_readable.work.custom_columns.column_1633980105047
    end

    def city
      address.site_city || address.city
    end

    def role_level
      human_readable.work.custom_columns.column_1629151373898
    end

    def manager
      work.reports_to
    end
  end
end

# employee = Bob::Employees.find(2641841023604491091)
