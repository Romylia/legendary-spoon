require 'gruff'
require_relative 'Block3'

class DiscreteVariationSeries
  # Построение многоугольника распределения
  def plot_distribution_polygon
    x_values = @series.map { |el| el[0] }
    y_values = @series.map { |el| el[1] }

    graph = Gruff::Line.new
    graph.title = "Многоугольник распределения"
    graph.labels = x_values.each_with_index.to_h { |x, i| [i, x.to_s] }
    graph.data(:Probability, y_values)
    graph.write('distribution_polygon.png')
  end

  # Построение полигона частот
  def plot_frequency_polygon
    x_values = @series.map { |el| el[0] }
    y_values = @series.map { |el| el[2] }

    graph = Gruff::Line.new
    graph.title = "Полигон частот"
    graph.labels = x_values.each_with_index.to_h { |x, i| [i, x.to_s] }
    graph.data(:Frequency, y_values)
    graph.write('frequency_polygon.png')
  end

  # Построение графика функции распределения
  def plot_distribution_function
    x_values = []
    y_values = []
    cumulative_sum = 0

    @series.each do |el|
      x_values << el[0]
      cumulative_sum += el[1]
      y_values << cumulative_sum
    end

    graph = Gruff::Line.new
    graph.title = "Функция распределения"
    graph.labels = x_values.each_with_index.to_h { |x, i| [i, x.to_s] }
    graph.data(:Cumulative_Probability, y_values)
    graph.write('distribution_function.png')
  end
end

class IntervalVariationSeries
  # Построение гистограммы частот
  def plot_histogram(frequency_type = :absolute)
    intervals = @series.map { |el| el[0] }
    frequencies = frequency_type == :absolute ? @series.map { |el| el[2] } : @series.map { |el| el[1] }

    graph = Gruff::Bar.new
    graph.title = frequency_type == :absolute ? "Гистограмма частот" : "Гистограмма относительных частот"
    graph.labels = intervals.each_with_index.to_h { |interval, i| [i, "#{interval.first}-#{interval.last}"] }
    graph.data(:Frequencies, frequencies)
    graph.write("histogram_#{frequency_type}.png")
  end

  # Построение полигона частот
  def plot_frequency_polygon(frequency_type = :absolute)
    midpoints = @series.map { |el| (el[0].first + el[0].last) / 2.0 }
    frequencies = frequency_type == :absolute ? @series.map { |el| el[2] } : @series.map { |el| el[1] }

    graph = Gruff::Line.new
    graph.title = frequency_type == :absolute ? "Полигон частот" : "Полигон относительных частот"
    graph.labels = midpoints.each_with_index.to_h { |x, i| [i, x.to_s] }
    graph.data(:Frequencies, frequencies)
    graph.write("frequency_polygon_#{frequency_type}.png")
  end

  # Построение функции распределения случайной величины
  def plot_distribution_function
    x_values = []
    y_values = []
    cumulative_sum = 0

    @series.each do |el|
      x_values << el[0].last
      cumulative_sum += el[1]
      y_values << cumulative_sum
    end

    graph = Gruff::Line.new
    graph.title = "Функция распределения"
    graph.labels = x_values.each_with_index.to_h { |x, i| [i, x.to_s] }
    graph.data(:Cumulative_Probability, y_values)
    graph.write('distribution_function.png')
  end

  # Построение графика функции распределения случайной величины
  def plot_cumulative_distribution_graph
    x_values = []
    y_values = []
    cumulative_sum = 0

    @series.each do |el|
      x_values << el[0].last
      cumulative_sum += el[1]
      y_values << cumulative_sum
    end

    graph = Gruff::Line.new
    graph.title = "График функции распределения"
    graph.labels = x_values.each_with_index.to_h { |x, i| [i, x.to_s] }
    graph.data(:Cumulative_Probability, y_values)
    graph.write('cumulative_distribution_graph.png')
  end
end