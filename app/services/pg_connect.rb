require "pg"
class PgConnect
  LIMIT = 10
  attr_reader :table, :page

  def initialize(table: "vic_lga", page: nil, **options)
    @table = table
    @page = page.to_i || 1
  end
  
  def find_by(id: nil)
    database.exec("SELECT * FROM #{table} WHERE gid = #{id} ORDER BY gid").to_a.first
  end

  def query_all
    database.exec("SELECT * FROM #{table} ORDER BY gid LIMIT #{LIMIT} OFFSET #{page * 10}").to_a
  end

  def query_count
    database.exec("SELECT COUNT(*) FROM #{table}").values.flatten.first.to_i
  end

  def db_exist?
    database.present?
  end

  private
    def database
      PG.connect(dbname: ActiveRecord::Base.connection.current_database)
    end
end