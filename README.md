# Canadanfp
Employee Database

# Employee Skills Intelligence Dashboard

## Run
Run `Run Dashboard.bat` to start a local web server and open the dashboard in Edge or Chrome. The dashboard automatically loads the two workbooks and checks for updates every 30 seconds. Do not open `index.html` directly with a `file:///` URL because browsers block workbook requests from local HTML files.

## Hosted refresh
Keep the two workbooks in the `data` folder:
- Personal Details - Updated.xlsx
- AON Canada - Your Skill matters.xlsx

When a new row is added to either workbook, the dashboard will include it after the next automatic check. Keep the workbook filenames unchanged.

## Structure
- `index.html`: page layout
- `assets/css/styles.css`: responsive corporate styling
- `assets/js/config.js`: filenames and thresholds
- `assets/js/app.js`: SheetJS parsing, Employee ID merge, employee details, filters, charts, tables, analysis, and export
- `data/`: sample Excel files

## Employee details
The Directory displays the personal and employment fields available in the employee workbook, including contact details, dates, age, emergency contact, and addresses.
