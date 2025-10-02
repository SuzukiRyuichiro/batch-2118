require 'date'

def xmas
  # TODO: calculate how many days until the next christmas
  # get today's date in Date object
  today = Date.today

  # get the this year's xmas date in Date object
  this_year_xmas_date = Date.new(today.year, 12, 25)

  # if today is past 12/25, set the year to the next year's xmas
  xmas_date = if this_year_xmas_date < today
                Date.new(today.year + 1, 12, 25)
              else
                # else get this year's xmas
                Date.new(today.year, 12, 25)
              end

  # subtract the today's date from xmas date (we get Rational)
  # convert the days in rational into integer
  (xmas_date - today).to_i
end
