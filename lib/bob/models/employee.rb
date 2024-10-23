# frozen_string_literal: true

module Models
  class Employee < Models::Base
    def preferred_last_name
      dig_custom_field('PREFERRED_LAST_NAME')
    end

    def preferred_first_name
      dig_custom_field('PREFERRED_FIRST_NAME')
    end

    def preferred_full_name
      "#{preferred_first_name} #{preferred_last_name}"
    end

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
      work.try(:department)
    end

    def division
      dig_custom_field('DIVISION')
    end

    def team
      dig_custom_field('SUB_DIVISION')
    end

    def entity
      dig_custom_field('EMPLOYER')
    end

    def city
      address.city
    end

    def country
      address&.country
    end

    def has_manager?
      manager.present?
    end

    def manager
      return unless manager_email # has no manager, prob CEO

      @manager ||= Bob::Employees.find(manager_email)
    end

    def manager_email
      try(:work).try(:reports_to).try(:email)
    end

    def has_second_level_manager?
      second_level_manager.present?
    end

    def second_level_manager
      return nil unless manager.manager_email

      @second_level_manager ||= Bob::Employees.find(manager.manager_email)
    end

    def has_third_level_manager?
      third_level_manager.present?
    end

    def third_level_manager
      return nil unless second_level_manager.manager_email

      @third_level_manager ||= Bob::Employees.find(second_level_manager.manager_email)
    end

    def has_fourth_level_manager?
      second_level_manager.work&.second_level_manager.present?
    end

    def fourth_level_manager
      return nil unless third_level_manager.manager_email

      Bob::Employees.find(third_level_manager.manager_email)
    end

    def cost_center
      dig_custom_field('COST_CENTER')
    end

    def personal_email
      home.private_email
    end

    def linkedin_profile
      about.social_data&.linkedin
    end

    def currency
      return nil unless payroll.try(:salary).try(:payment)

      payroll.salary.payment.split(/\d/).first
    end

    def base_pay
      return nil unless payroll.try(:salary).try(:payment)

      # split on first occurence of a digit
      payroll.salary.payment.sub(currency, '').to_f
    end

    def variable_pay
      return 0.0 unless payroll.try(:variable)&.field_255298499&.amount

      payroll.variable.field_255298499.amount.sub(currency, '').to_f
    end

    def job_role_row
      @job_role_row ||= Bob::Employee::CustomTables.rows(id,
                                                         'category_1645574919835__table_1716392607454').max_by do |row|
        Date.parse(row.column_1716392634939)
      end
    end

    def job_grade
      return nil if job_role_row.nil?

      job_role_row.human_readable.column_1716393179800
    end

    def job_role_id
      return nil if job_role_row.nil?

      job_role_row.human_readable.column_1716393584611
    end
  end
end
