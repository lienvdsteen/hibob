# frozen_string_literal: true

require_relative 'employee/invites'
require_relative 'employee/trainings'
require_relative 'employee/salaries'
require_relative 'employee/equity_grants'
require_relative 'employee/documents'
require_relative 'employee/variable_payments'
require_relative 'employee/work_history'
require_relative 'employee/lifecycle_history'
require_relative 'employee/time_off'
require_relative 'employee/employment_history'
require_relative 'employee/custom_tables'

module Bob
  class Employees < API
    DEFAULT_FIELDS = ['root.id', 'root.email', 'work.startDate', 'root.secondName', 'root.fullName',
                      'root.displayName', 'work.title', 'home.privateEmail', 'work.reportsToIdInCompany', 'address.city',
                      'work.reportsTo.email', 'work.manager', 'work.secondLevelManager', 'work.employeeIdInCompany',
                      'payroll.employment.type', 'address.country', 'address.usaState', 'internal.lifecycleStatus',
                      'work.department', 'work.customColumns.column_1642024758438', 'work.customColumns.column_1629151319875',
                      'about.socialData.linkedin', 'root.custom.field_1716448572063', 'root.custom.field_1716448596128',
                      'work.customColumns.column_1716304180219'].freeze

    def self.search( params = { humanReadable: 'replace' })
      params[:fields] = DEFAULT_FIELDS unless params[:fields]

      response = post('people/search', params)
      EmployeeParser.new(JSON.parse(response)).employees
    end

    def self.find(employee_id_or_email, params = { humanReadable: 'replace' })
      params[:fields] = (DEFAULT_FIELDS + params[:fields]).uniq if params[:fields]
      params[:fields] = DEFAULT_FIELDS unless params[:fields]

      response = post("people/#{employee_id_or_email}", params)
      EmployeeParser.new(JSON.parse(response)).employee
    end

    def self.all_leavers(start_date:, end_date:)
      fields = ['internal.terminationDate', 'internal.status', 'root.id', 'root.displayName', 'work.title', 'work.reportsTo.email', 'root.email']
      search({humanReadable: 'replace', showInactive: true, fields:}).select do |employee|

        next unless employee.internal.status == 'Inactive' && employee.internal.termination_date.present?

        # Don't process employees that left before the period we are looking into
        internal_term_date = Date.parse(employee.internal.termination_date)
        next if internal_term_date.before?(start_date)

        # Need to fetch lifecycle statuses, as garden leavers have left before the actual internal term date
        lifecycle_statuses = Bob::Employee::LifecycleHistory.all(employee.id)
        garden_leave_status = lifecycle_statuses.find { |status| status.status == 'garden leave' }

        if garden_leave_status
          lifecycle_statuses = Bob::Employee::LifecycleHistory.all(employee.id)
          garden_leave_status = lifecycle_statuses.find { |status| status.status == 'garden leave' }
          termination_date = Date.parse(garden_leave_status.effective_date)
        end

        termination_date ||= Date.parse(employee.internal.termination_date)
        (start_date..end_date).include?(termination_date)
      end
    end

    def self.starts_on(date = Date.current, params = { humanReadable: 'replace' })
      params[:fields] = (DEFAULT_FIELDS + params[:fields]).uniq if params[:fields]
      params[:fields] = DEFAULT_FIELDS unless params[:fields]

      response = post('people/search', params)
      EmployeeParser.new(JSON.parse(response)).starters_on(date)
    end

    def self.find_by(field:, value:, params: { humanReadable: 'replace' })
      params[:fields] = (DEFAULT_FIELDS + params[:fields]).uniq if params[:fields]
      params[:fields] = DEFAULT_FIELDS unless params[:fields]

      search(params).find do |employee|
        employee.send(field) == value
      end
    end

    def self.update(employee_id:, params:)
      put("people/#{employee_id}", params)
    end

    # start date needs to be in ISO format
    def self.update_start_date(employee_id, start_date)
      post("employees/#{employee_id}", { startDate: start_date })
    end

    def self.update_email(employee_id, email)
      put("people/#{employee_id}/email", { email: email })
    end
  end
end
