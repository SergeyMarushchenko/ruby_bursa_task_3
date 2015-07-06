class ReaderWithBook
  attr_accessor :amazing_book, :current_page, :reader, :return_date

  def initialize  amazing_book, reader, current_page = 0, return_date = (Time.now + 2.weeks)
    @amazing_book = amazing_book
    @reader = reader
    @return_date = return_date
    @current_page = current_page
  end

  def time_to_finish
    ((@amazing_book.pages_quantity - current_page) / @reader.reading_speed.to_f).round(2) 
  end

  def penalty
    amazing_book.penalty_per_hour * hours_overdue #penalty_per_hour - значение флоат
  end

  def hours_overdue
    ((Time.now.to_i - issue_datetime.to_time.to_i) / 3600.0).round(2)
  end

  def days_to_buy
    penalty_per_day = @amazing_book.penalty_per_hour*24
    (@mazing_book.price/(@amazing_book.penalty_per_hour*24.0)).round

  end

  def read_the_book! duration # в чем задается duration ?
    @current_page += duration*reader.reading_speed.round(0)

  end

  def penalty_to_finish
    time_to_finish*amazing_book.penalty_per_hour
  end

end
