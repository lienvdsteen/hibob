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
      human_readable.work.custom_columns&.column_1629151319875
    end

    def team
      human_readable.work.custom_columns&.column_1642024758438
    end

    def entity
      human_readable.work.custom_columns&.column_1633980105047
    end

    def city
      address.city
    end

    def country
      address.country
    end

    def role_level
      human_readable.work.custom_columns.column_1629151373898
    end

    def has_manager?
      manager.present?
    end

    def manager
      work&.reports_to
    end

    def has_second_level_manager?
      work&.second_level_manager.present?
    end

    def second_level_manager
      @second_level_manager ||= Bob::Employees.find(work&.second_level_manager)
    end

    def has_third_level_manager?
      third_level_manager.present?
    end

    def third_level_manager
      second_level_manager&.manager
    end

    def has_fourth_level_manager?
      second_level_manager.work&.second_level_manager.present?
    end

    def fourth_level_manager
      second_level_manager&.second_level_manager
    end

    def cost_center
      human_readable.payroll&.custom&.field_1634476091511
    end

    def personal_email
      home.private_email
    end

    def linkedin_profile
      human_readable.about.social_data&.linkedin
    end
  end
end
