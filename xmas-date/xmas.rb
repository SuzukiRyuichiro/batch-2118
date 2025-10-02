require 'date'

def xmas
  # TODO: calculate how many days until the next christmas
  # get today's date in Date object
  today = Date.today

  # get the next xmas date in Date object
  this_year_xmas_date = Date.new(today.year, 12, 25)

  # if today is passed 12/25, set the year to the next year
  xmas_date = if this_year_xmas_date < today
                Date.new(today.year + 1, 12, 25)
              else
                Date.new(today.year, 12, 25)
              end
  # else get today.year

  # subtract the today's date from xmas date (Rational)
  # convert the days in rational into integer
  (xmas_date - today).to_i
end
