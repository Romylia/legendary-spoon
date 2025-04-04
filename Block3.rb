class DiscreteVariationSeries
  def initialize(initialization_type, values)
    accepted_types = ["probability", "grouped frequency", "ungrouped frequency", "p", "gf". "uf", 1, 2, 3]

    begin
      if not(initialization_type in accepted_types) then
        raise "Недопустимый тип инициализации!"
      end

      if (initialization_type == "probability" or initialization_type = "p" or initialization_type == 1) then
        summ = 0
        
        for el in values
          if not(el[0].is?(Numeric)) then 
            raise "Недопустимое значение случайной величины!"
          end

          if not(el[1].is?(Numeric)) or el[1] < 0 or el[1] > 1 then 
            raise "Недопустимое значение вероятности!"
          end

          summ += el[1]
        end

        if (summ > 1) then 
          raise "Сумма всех вероятностей больше 1!"
        end

        probability_initializer(values)
      else
        for el in values
          if not(el[0].is?(Numeric)) then 
            raise "Недопустимое значение случайной величины!"
          end
          
          if not(el[1].is?(Integer)) or el[1] < 0 then 
            raise "Недопустимое значение частоты!"
          end
        end

        group_frequency_initializer(group_frequency(values))
      end

      @series = @series.sort_by(&:first)
      self
    rescue Exception => ex
      puts ex.message
      @series = nil
      self
    end
  end

  def mathExpectation()
    me = 0
    for i in [0..@series.length]
      me += @series[i][0] * @series[i][1]
    end
    me
  end

  def variance()
    me = self.mathExpectation
    v = 0
    for i in [0..@series.length]
      v = (@series[i][0] - me) * (@series[i][0] - me) * @series[i][1]
    end
    v
  end

  def aSD()
    Math::sqrt(self.variance)
  end

  def distributionFunction(x)
    summ = 0
    for i in [0..@series.length]
      if (x <= @series[i][0]) then
        return summ
      end
      summ += @series[i][1]
    end
    summ
  end
  private

  def probability_initializer(values)
    @series = Array.new
    summ = 0

    for el in values
      summ += el[1]
      @series += [[el[0], el[1], 0]]
    end

    

    @series
    @series = nil
  end

  def group(values) 

  end

  def group_frequency_initializer(values)
    begin
      @series = Array.new
      summ = 0

      for el in values
        
        summ += el[1]
        @series += [[el[0], 0, el[1]]]
      end

      for i in [0..(@series.length)]
        @series[i][1] = @series[i][2] / summ
      end

      @series
    rescue
        @series = nil
    end
  end
end

class IntervalVariationSeries < DiscreteVariationSeries
  def initialize(initialization_type, values)
    accepted_types = [1, 2, 3, "probability", "grouped frequency", "ungrouped frequency"]

    if not(initialization_type in accepted_types) then raise "Недопустимый тип инициализации!"
    end

    if (initialization_type == 1 or initialization_type == "probability") then
      for el in values
        # TO DO
      end
    else
      if (initialization_type == 2 or initialization_type == "grouped frequency") then
        # TO DO
      else
        # TO DO
      end
    end
    @series = @series.sort_by(&:first)
    self
  end
end
