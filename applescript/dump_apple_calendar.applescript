-- dump_apple_calendar
--
-- dump apple calendar events to stdout
--
--
-- copyright 2019 (c) cj-bc a.k.a Cj.BC_SD
--
-- Output format: modified CVS
-- Delimiter: `;,`
-- Detail: "{StartDate};, {EndDate};, {summary};, {description};, {location};, {url}"
--



set theStartDate to current date
set hours of theStartDate to 0
set minutes of theStartDate to 0
set seconds of theStartDate to 0
set theEndDate to theStartDate + (10 * days)

tell application "Calendar"
  tell calendar "house"
    set theEvent to first event where its start date is greater than or equal to theStartDate and end date is less than or equal to theEndDate
    summary of theEvent
  end tell
end tell

