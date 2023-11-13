# frozen_string_literal: true

module Models
  class Employee < Models::Base
    attr_reader :currency

    def manager?
      work.is_manager
    end

    def job_title
      work.title
    end

    def start_date
      work.start_date
    end

    def department
      work.department
    end

    def division
      work.custom_columns&.column_1629151319875
    end

    def team
      work.custom_columns&.column_1642024758438
    end

    def entity
      work.custom_columns&.column_1633980105047
    end

    def city
      address.city
    end

    def country
      address&.country
    end

    def role_level
      work.custom_columns.column_1629151373898
    end

    def has_manager?
      manager.present?
    end

    def manager
      work&.manager
    end

    def manager_email
      work&.reports_to&.email
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
      payroll&.custom&.field_1634476091511
    end

    def personal_email
      home.private_email
    end

    def linkedin_profile
      about.social_data&.linkedin
    end

    def base_pay
      @currency, part_two = payroll.salary.payment.slice!(0..0), payroll.salary.payment
      part_two.to_f
    end

    def variable_pay
      return 0.0 unless payroll.variable&.field_255298499&.amount

      _part_one, part_two = payroll.variable.field_255298499.amount.slice!(0..0), payroll.variable.field_255298499.amount
      part_two.to_f
    end

    def job_role_id
      custom.category_1645574919835.field_1657052825123
    end
  end
end
