# Модуль для работы с формулами Бернулли, Пуассона, Гаусса и Муавра-Лапласа
module Probability
  # Функция для вычисления формулы Бернулли
  def self.bernoulli_probability(n, k, p)
    # Проверка входных данных
    validate_input(n, k, p)

    # Вычисление числа сочетаний C(n, k)
    combinations = calculate_combinations(n, k)

    # Вычисление вероятности по формуле Бернулли
    probability = combinations * (p**k) * ((1 - p)**(n - k))
    probability
  end

  # Функция для вычисления формулы Пуассона
  def self.poisson_probability(n, k, p)
    # Проверка входных данных
    validate_input(n, k, p)

    # Проверка на малость вероятности p (опционально)
    warn "Предупреждение: Аппроксимация Пуассона более точна для малых значений p (p < 0.1)." if p >= 0.1

    # Вычисление параметра λ (лямбда)
    lambda_value = n * p

    # Вычисление вероятности по формуле Пуассона
    probability = (lambda_value**k) * Math.exp(-lambda_value) / factorial(k)
    probability
  end

  # Функция для вычисления значения функции Гаусса
  def self.gaussian_function(x)
    # Проверка, что x - вещественное число
    raise ArgumentError, "x должен быть числовым значением." unless x.is_a?(Numeric)

    # Вычисление значения функции Гаусса
    coefficient = 1 / Math.sqrt(2 * Math::PI)
    exponent = Math.exp(-0.5 * x**2)
    coefficient * exponent
  end

  # Функция для вычисления формулы локальной теоремы Муавра-Лапласа
  def self.moivre_laplace_probability(n, k, p)
    # Проверка входных данных
    validate_input(n, k, p)

    # Проверка дополнительных условий для Муавра-Лапласа
    raise ArgumentError, "n * p * (1 - p) должно быть больше 0 для аппроксимации Муавра-Лапласа." unless n * p * (1 - p) > 0

    # Предупреждение для малых значений n
    warn "Предупреждение: Аппроксимация Муавра-Лапласа более точна для больших значений n (n > 30)." if n <= 30

    # Вычисление параметров
    q = 1 - p
    mean = n * p
    variance = n * p * q

    # Вычисление вероятности по формуле Муавра-Лапласа
    coefficient = 1 / Math.sqrt(2 * Math::PI * variance)
    exponent = Math.exp(-((k - mean)**2) / (2 * variance))
    coefficient * exponent
  end

  private

  # Вспомогательная функция для вычисления факториала числа
  def self.factorial(num)
    raise ArgumentError, "Входное значение должно быть неотрицательным целым числом." unless num.is_a?(Integer) && num >= 0

    fact = 1
    (1..num).each { |i| fact *= i }
    fact
  end

  # Вспомогательная функция для вычисления числа сочетаний C(n, k) (мультипликативная формула)
  def self.calculate_combinations(n, k)
    return 1 if k == 0 || k == n

    numerator = (n - k + 1..n).reduce(1, :*)
    denominator = (1..k).reduce(1, :*)
    numerator / denominator
  end

  # Общая функция для проверки входных данных
  def self.validate_input(n, k, p)
    # Проверка на то, что n - целое неотрицательное число
    raise ArgumentError, "n должно быть неотрицательным целым числом." unless n.is_a?(Integer) && n >= 0

    # Проверка на то, что k - целое неотрицательное число
    raise ArgumentError, "k должно быть неотрицательным целым числом." unless k.is_a?(Integer) && k >= 0

    # Проверка на то, что k <= n (только для формулы Бернулли)
    raise ArgumentError, "k должно быть меньше или равно n." unless k <= n

    # Проверка на то, что p - вещественное число в диапазоне [0, 1]
    raise ArgumentError, "p должно быть числовым значением в диапазоне [0, 1]." unless p.is_a?(Numeric) && (0..1).include?(p)
  end
end