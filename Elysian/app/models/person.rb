class Person < ActiveRecord::Base

  has_many :emails
  has_many :phone_numbers
  has_and_belongs_to_many :homes
  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :phone_numbers
  accepts_nested_attributes_for :homes
=begin
    delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Person.count,
      iTotalDisplayRecords: people.total_entries,
      aaData: data
    }
  end

private

  def data
    people.map do |person|
      [
        link_to(person.name, person),
        h(person.category),
        h(person.released_on.strftime("%B %e, %Y")),
        number_to_currency(person.price)
      ]
    end
  end

  def people
    @people ||= fetch_people
  end

  def fetch_people
    people = Person.order("#{sort_column} #{sort_direction}")
    people = people.page(page).per_page(per_page)
    if params[:sSearch].present?
      people = people.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    people
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
=end
end
