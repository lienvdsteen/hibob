## [Unreleased]

## [0.3.2]

- Add endpoints for reporting: 
  - `Reports.all`: returns all the reports available to the service account
  - `Reports.read(report_id)`: returns the report in CSV format

## [0.3.1]

- Add endpoint for a specific time off event for an employee `TimeOff.find_for_employee(employee_id, time_off_event_id)`

## [0.3.0]

- Change return in `TimeOff.all_changed_since`

## [0.2.0]

- Change return in `Employees.all`
- Add `Employees.find_by`

## [0.1.2]
Fix the need to require the gem in Rails applications.

## [0.1.1]
- Add several endpoints

## [0.1.0] - 2021-11-16

- Initial release
