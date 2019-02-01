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

-- configs {{{2
set delimiter to ";, "

set theStartDate to current date
set hours of theStartDate to 0
set minutes of theStartDate to 0
set seconds of theStartDate to 0
set theEndDate to theStartDate + (10 * days)
set calendarName to "house"
-- }}}

tell application "Calendar"
  tell calendar calendarName
    set theEvent to first event where its start date is greater than or equal to theStartDate and end date is less than or equal to theEndDate
  end tell

  tell theEvent
      start date as string & delimiter & end date as string & delimiter & summary & delimiter & description & delimiter & location & delimiter & url
  end tell
end tell


-- functions {{{2
-- join each words using _delimiter
on joinEach( _delimiter as string, _words)
  set ret to ""
  repeat with _word in _words
    set ret to ret & _word & _delimiter
  end repeat
  return ret
end joinEach

-- format date string
on formatDate(theDate as date)
  set ret to year of theDate & "-" & month of theDate & "-" & day of theDate & " " & hours of theDate & ":" & minutes of theDate
  return ret
end formatDate

-- }}}
