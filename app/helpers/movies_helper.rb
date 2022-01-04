module MoviesHelper
  def price_range_name(price_range)
    if price_range[0].to_i == Movie::PRICE_RANGES.first[0]
      "#{number_to_currency price_range[1], precision: 0, unit: "€", delimiter: ""} & Below"
    elsif price_range[1].to_i == Movie::PRICE_RANGES.last[1]
      "#{number_to_currency price_range[0], precision: 0, unit: "€", delimiter: ""} & Above"
    else
      "#{number_to_currency price_range[0], precision: 0, unit: "€", delimiter: ""}
      -
      #{number_to_currency price_range[1], precision: 0, unit: "€", delimiter: ""}"
    end
  end
end
