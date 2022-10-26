
## [Unreleased]

## [0.5.21]
- Add new API endpoint to update an employee: `Employees.update(employee_id:, params:)`

## [0.5.20]

- Change the output for the cost center so it's the human readable field

## [0.5.18]

- Add several missing endpoints. 

## [0.5.17]

- Add `Employee::TimeOff.balance(employee_id:, policy_type:, date:)` endpoint. Returns the balance for that employee in the policy type until the given date.

## [0.5.16]

- Add `Employees.all_leavers(start_date:, end_date)`. Returns all the employees that left the company between the start and end date.

## [0.5.15]

- Bug fix for previous fix when the field is a symbol.

## [0.5.14]

- Bug fix when the field from Bob is numeric only.

## [0.5.13]

- Add `Employee::Documents.upload_public_document` to add the endpoint to upload a document to the employee's shared file

## [0.5.12]
- Small change in the `TimeOff#employee` method to look at either email or employee_id to fetch the employee linked with the event. 
- Fixes in `Employee` methods related to fetching the different levels of managers. To account for a case when they don't have a (second level) manager.

## [0.5.11]
- Add `LifecycleHistory.all` to fetch the rows in the lifecycle table.

## [0.5.10]
- Fix for OnboardingWizardParser. It was trying to access a wrong key in the hash. 

## [0.5.9]
- Add `Employees.starts_on` to get a list of employees that started on a certain date. By default it will fall back on today's date. Note the date needs to be in the following string format `YYYY-MM-DD`
- Add `Employee#linkedin_profile` and `Employee.country` to the Employee model.

## [0.5.8]
- Rework usage of `use_api_key` for the endpoints that only allow employee based requests vs Service user
- Add `WorkHistory.all` and `WorkHistory.update` so you can fetch the work table rows and update the row data if needed.

## [0.5.7]

- Add `Employee#personal_email` 
- Add `api_key` to the configuration hash. Some API endpoints can only be executed as an employee (not as a Service User).
- Fix `Documents.add_public_document` and `Documents.add_private_document` to use the api key.

## [0.5.6]

- Add `Employee#cost_center` to more easily fetch the cost center for an employee

## [0.5.5]

Add extra methods to `Models::Employee` related to the reporting line of an employee:
- `#has_manager?`
- `#has_second_level_manager?`
- `#second_level_manager`
- `#has_third_level_manager?`
- `#third_level_manager`
- `#has_fourth_level_manager?`
- `#fourth_level_manager`

## [0.5.4]

- Add `Employees.all_people_managers`. This is introduced so we first filter out the managers and then create objects.

## [0.5.3]

- Remove temporary file in `Reports.sftp_upload` after uploading to the SFTP server.

## [0.5.2]

- Small fix to `Util.underscore` to also replace a space with an underscore (`word.tr!(' ', '_')`).

## [0.5.1]

- Add `TimeOff#multiple_days?` and `TimeOff#total_days_off` to return more details about a time off event.

## [0.5.0]
Rework all GET requests to return an object response instead of the parsed JSON. This is a breaking change as the return
values for all the endpoints with GET requests will be different in this version.

## [0.4.1]

- Fix bug in `API.create_csv` when the value contains a comma. Moved to using `CVS.parse_line` to avoid bugs with the content of a row.
- Rework `Report.sftp_upload` slightly. 

## [0.4.0]

- Change `Reports.read(report_id)` return value. Instead of returning the raw data it will return the file name.
- Add `Report.sftp_upload(report_id:, sftp_details:)`. This will upload a report_id to any SFPT server you'd like.

## [0.3.4]
- Add `Webhooks.calculate_signature(body:)` so you can use the gem to validate if the webhooks are coming from Bob itself.

## [0.3.3]
- Fix bug in `0.3.2` with `Reports.read(report_id)`. 

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
