# Canadanfp
Employee Database

# Employee Skills Intelligence Dashboard

## Run
Run `Run Dashboard.bat` to start a local web server and open the dashboard in Edge or Chrome. The dashboard automatically loads the two workbooks and checks for updates every 30 seconds. Do not open `index.html` directly with a `file:///` URL because browsers block workbook requests from local HTML files.

## Workbook refresh
On localhost, the dashboard refreshes the configured workbooks every 30 seconds. On GitHub Pages, choose both files in the workbook bar and select **Load workbooks**; the files are read locally in your browser and are not uploaded. Re-select the files after receiving updated copies. Current sources are:
- `data/NFP - Employee Details.xlsx`: employee roster and employee-reported expertise.
- `data/NFP_Emp Skill-Set Matrix  Info.xlsx`: the `Process training Matrix` sheet, where employee names are columns and process/task status is recorded per employee.

The roster reader recognizes common header variations (for example `Emp ID` or `Employee ID`, `Emp Name` or `Employee Name`, and `Supervisor` or `Manager`). Matrix employees are joined to roster records by normalized name, including `Last, First` name order. `O` is shown as Training Pending and `P` as Training Completed. Unmatched names are skipped and reported in the dashboard status. Update `assets/js/config.js` if the source filenames change.

## Structure
- `index.html`: page layout
- `assets/css/styles.css`: responsive corporate styling
- `assets/js/config.js`: filenames and thresholds
- `assets/js/app.js`: SheetJS parsing, Employee ID merge, employee details, filters, charts, tables, analysis, and export
- `data/`: sample Excel files

## Employee details
The Directory displays the personal and employment fields available in the employee workbook, including contact details, dates, age, emergency contact, and addresses.
