# frozen_string_literal: true

module Models
  class Employee < Models::Base
    def last_name
      custom.field_1716448596128
    end

    def first_name
      custom.field_1716448572063
    end

    def full_name
      "#{first_name} #{last_name}"
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
      work.department
    end

    def division
      work.custom_columns&.column_1629151319875
    end

    def team
      work.custom_columns.try(:column_1642024758438)
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
      work&.second_level_manager.present?
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
      payroll&.custom&.field_1634476091511
    end

    def personal_email
      home.private_email
    end

    def linkedin_profile
      about.social_data&.linkedin
    end

    def currency
      payroll.salary.payment.split(/\d/).first
    end

    def base_pay
      # split on first occurence of a digit
      payroll.salary.payment.sub(currency, "").to_f
    end

    def variable_pay
      return 0.0 unless payroll.try(:variable)&.field_255298499&.amount

      payroll.variable.field_255298499.amount.sub(currency, "").to_f
    end

    def job_role_row
      @job_role_row ||= Bob::Employee::CustomTables.rows(id, 'category_1645574919835__table_1716392607454')&.first
    end

    def job_grade
      job_role_row.column_1716393584611
    end

    def job_role_id
      bob_job_role_ids = Bob::MetaData::CompanyLists.find('category_1645574919835__table_1716392607454.column_1716393584611')
      bob_job_role_ids.find { |role_id| role_id.id == job_role_row.column_1716393584611 }.value
    end
  end
end
