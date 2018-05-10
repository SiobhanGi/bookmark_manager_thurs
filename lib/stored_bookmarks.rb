require 'pg'
require_relative './database_connection'

class StoredBookmarks

  VALID_URL = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  def self.all
    connect = DatabaseConnection.enviroment
    result = connect.exec "SELECT * FROM bookmarks"
    result.map{ |row| row['url']  }
  end

  def self.add(new_bookmark)
    if new_bookmark =~ VALID_URL
      connect = DatabaseConnection.enviroment
      connect.exec("INSERT INTO bookmarks VALUES(DEFAULT, '#{new_bookmark}');")
    else
      false
    end
  end

end
