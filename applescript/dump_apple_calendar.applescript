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
-- WARNING: DON'T USE THIS DIRECTOLY; Please use wrapper script in bin/ directory

on run argv

-- configs {{{2
  set delimiter to ";, "
  set output_file to item 1 of argv

  set theStartDate to current date - (5*days)
  set hours of theStartDate to 0
  set minutes of theStartDate to 0
  set seconds of theStartDate to 0
  set theEndDate to theStartDate + (10 * days)
  set calendarName to "house"
-- }}}


  tell application "Calendar"
    tell calendar calendarName
      set FoundEvents to every event where its start date is greater than or equal to theStartDate and end date is less than or equal to theEndDate
    end tell

    repeat with e in FoundEvents
      set _startDate to formatDate(start date of e) of me
      set _endDate to formatDate(end date of e)     of me
      set output to joinEach(delimiter, { _startDate, _endDate, summary of e, description of e, location of e, url of e }) of me
      do shell script "echo '" & output & "' >>" & output_file
    end repeat
  end tell

end run

  -- functions {{{
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
