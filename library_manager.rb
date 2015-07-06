require 'active_support/all'
require 'pry'

require_relative 'author.rb'
require_relative 'book.rb'
require_relative 'published_book.rb'
require_relative 'reader.rb'
require_relative 'reader_with_book.rb'

class LibraryManager

  attr_accessor :readers, :books, :readers_with_books

  def initialize readers = [], books = [], readers_with_books = []
    @readers_with_books = readers_with_books
    @readers = readers
    @books = books
  end

  def new_book author, title, price, pages_quantity, published_at
    @books << PublishedBook.new (author, title, price, pages_quantity, published_at)
    @books.last
  end

  def new_reader  name, reading_speed
    @readers << Reader.new (name, reading_speed)
    @readers.last
  end

  def give_book_to_reader reader_name, book_title
    @readers_with_books << ReaderWithBook.new (reader_name, book_title, others)
    @readers_with_books.last
  end

  def read_the_book reader_name, duration    
    reader_name.read_the_book!(duration) #reader_name = readerwithbook ?
  end

  def reader_notification
    notification = "Dear #{reader_name}!

You should return a book #{title} authored by #{author} in #{time_left} hours.
Otherwise you will be charged $#{penalty_per_hour} per hour.
By the way, you are on #{current_page} page now and you need #{time_to_read} hours to finish reading #{title} "


  end

  def librarian_notification

  end

  def statistics_notification

  end

  private

  def reader_notification_params reader_with_book #какой аргумент принимает?
    r = reader_with_book.
    b = r.amazing_book
    reader_name = r.reader.name
    title = b.title
    author = b.author
    penalty_per_hour = b.penalty_per_hour
    time_left = r.return_date.to_time.to_i - Time.now.to_i
    time_to_read = r.time_to_finish
    

  end

  def librarian_notification_params

  end

  def statistics_notification_params

  end

end
