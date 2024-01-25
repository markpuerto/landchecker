class Pagination
  include Rails.application.routes.url_helpers

  attr_reader :page, :total
  LIMIT = 10

  def initialize(page:, total: 0)
    @page = page.to_i || 1
    @total = total
  end

  def call
    obj = { total:, pages: { current: page }, url: {} }

    if page == 1
      obj[:url][:next] = locations_url(page: page + 1)
      obj[:pages][:next] = page + 1
    elsif total < ((page + 1) * LIMIT)
      obj[:url][:prev] = locations_url(page: page - 1)
      obj[:pages][:prev] = page - 1
    else
      obj[:url][:prev] = locations_url(page: page - 1)
      obj[:url][:next] = locations_url(page: page + 1)
      obj[:pages][:prev] = page - 1
      obj[:pages][:next] = page + 1
    end

    obj[:total] = total

    return obj
  end
end