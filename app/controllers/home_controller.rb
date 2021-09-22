class HomeController < ApplicationController
  def dashboard

    @sale_last_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group("strftime('%m-%Y', created_at)")
    .order(created_at: :asc)
    .sum(:amount)


    @quantity_last_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group("strftime('%m-%Y', created_at)")
    .order(created_at: :asc)
    .count

    @average_last_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group("strftime('%m-%Y', created_at)")
    .order(created_at: :asc)
    .average(:amount)

    @pie_chart_origin_12_months = Sale.where(:created_at => (Time.now.beginning_of_month - 12.months)..Time.now.end_of_month)
    .group(:origin)
    .count

    @pie_chart_origin_6_months = Sale.where(:created_at => (Time.now.beginning_of_month - 6.months)..Time.now.end_of_month)
    .group(:origin)
    .count

    @pie_chart_origin_3_months = Sale.where(:created_at => (Time.now.beginning_of_month - 3.months)..Time.now.end_of_month)
    .group(:origin)
    .count

    @pie_chart_origin_this_months = Sale.where(:created_at => (Time.now.beginning_of_month..Time.now.end_of_month))
    .group(:origin)
    .count

  end
end
