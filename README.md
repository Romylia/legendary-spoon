Репозиторий под гем для Руби. В этом репозитории содержится 4 блока, связанные с теорией вероятности и математической статистикой. 
Три блока:
1) Формулы из комбинаторики
2) Формулы из теории вероятностей
3) Аналитическая математическая статистика
4) Графическая математическая статистика


Блок 1. Формулы из комбинаторики
1. factorial(n)
  Описание:
  Функция для расчета факториала целого числа.
  Входные параметры:
    n (int): Целое число, для которого необходимо вычислить факториал.
  Выход:
    Возвращает целое число — факториал числа n.

2. permutations_without_repetitions(n)
  Описание:
   Функция для расчета количества перестановок без повторений.
  Входные параметры:
    n (int): Количество элементов.
  Выход:
    Возвращает целое число — количество перестановок заданного числа элементов без повторений.

3. permutations_with_repetitions(n, counts)
  Описание:
  Функция для расчета количества перестановок с неограниченными повторениями.
  Входные параметры:
    n (int): Количество позиций в расстановке.
    counts (list of int): Массив, представляющий мощность алфавита.
  Выход:
    Возвращает целое число — количество перестановок заданного количества элементов с неограниченными повторениями.

4. arrangements_without_repetitions(n, k)
  Описание:
  Функция для расчета количества перестановок с ограниченными повторениями.
  Входные параметры:
    n (int): Количество позиций в расстановке.
    counts (list of int): Массив целых чисел, представляющий допустимое количество повторений каждого элемента алфавита.
  Выход:
    Возвращает целое число — количество возможных перестановок.

5. placements_without_repetitions(n, k)
  Описание:
  Функция для расчета количества размещений без повторений.
  Входные параметры:
     n (int): Количество позиций в размещении.
     k (int): Мощность алфавита.
   Выход:
     Возвращает целое число — количество размещений без повторений.

7. arrangements_with_repetitions(n, k)
  Описание:
  Функция для расчета количества размещений с повторениями.
  Входные параметры:
    n (int): Количество позиций в расстановке.
    k (int): Мощность алфавита.
  Выход:
    Возвращает целое число — количество размещений заданного количества элементов с неограниченными повторениями.

8. combinations_without_repetitions(n, k)
  Описание:
  Функция для расчета количества сочетаний без повторений.
  Входные параметры:
    n (int): Количество позиций в расстановке.
    k (int): Мощность алфавита.
  Выход:
    Возвращает целое число — количество сочетаний заданного количества элементов без повторений.

9. combinations_with_repetitions(n, k)
  Описание:
  Функция для расчета количества сочетаний с повторениями.
  Входные параметры:
    n (int): Количество позиций в расстановке.
    k (int): Мощность алфавита.
  Выход:
    Возвращает целое число — количество сочетаний заданного количества элементов с неограниченными повторениями.

Блок 2

1. bernoulli_probability(n, k, p)
  Описание:
  Функция для вычисления вероятности по формуле Бернулли.
  Входные параметры:
    n (Integer): Общее количество испытаний.
    k (Integer): Количество успешных испытаний.
    p (Float): Вероятность успеха в одном испытании.
  Выход:
    Возвращает Float — вероятность получения ровно k успехов в n испытаниях.

2. poisson_probability(n, k, p)
  Описание:
  Функция для вычисления вероятности по формуле Пуассона.
  Входные параметры:
    n (Integer): Общее количество испытаний.
    k (Integer): Количество событий.
    p (Float): Вероятность события в одном испытании.
  Выход:
    Возвращает Float — вероятность получения ровно k событий в n испытаниях.

3. gaussian_function(x)
  Описание:
  Функция для вычисления значения функции Гаусса.
  Входные параметры:
    x (Numeric): Значение, для которого необходимо вычислить функцию Гаусса.
  Выход:
    Возвращает Float — значение функции Гаусса для заданного x.

4. moivre_laplace_probability(n, k, p)
  Описание:
  Функция для вычисления вероятности по формуле Муавра-Лапласа.
  Входные параметры:
    n (Integer): Общее количество испытаний.
    k (Integer): Количество успешных испытаний.
    p (Float): Вероятность успеха в одном испытании.
  Выход:
    Возвращает Float — вероятность получения ровно k успехов в n испытаниях с использованием аппроксимации Муавра-Лапласа.

Блок 3.

Аналитическая математическая статистика
1. DiscreteVariationSeries
  Описание:
  Класс для работы с дискретными вариационными рядами. Позволяет инициализировать ряды на основе вероятностей или частот.
  Конструктор:  DiscreteVariationSeries.new(initialization_type, values)
  Параметры:
    1) initialization_type (String, Integer): Тип инициализации.
    Допустимые значения: "probability", "grouped frequency", "ungrouped frequency", "p", "gf", "uf", 1, 2, 3.
    2) values (Array): Массив значений случайной величины и соответствующих вероятностей или частот.

Методы
  1) mathExpectation()
  Описание: Вычисляет математическое ожидание.
  Выход:
    Возвращает Float — значение математического ожидания.
  2) variance()
  Описание: Вычисляет дисперсию.
  Выход:
    Возвращает Float — значение дисперсии.
  3) aSD()
  Описание: Вычисляет стандартное отклонение.
  Выход:
    Возвращает Float — значение стандартного отклонения.
  4) distributionFunction(x)
  Описание: Вычисляет функцию распределения для заданного значения x.
  Параметры:
    x (Numeric): Значение для вычисления функции распределения.
  Выход:
    Возвращает Float — значение функции распределения.

2. IntervalVariationSeries
  Описание:
  Класс для работы с интервалами вариационных рядов. Наследует от класса DiscreteVariationSeries.

Конструктор: IntervalVariationSeries.new(initialization_type, values)
Параметры:
1) initialization_type (String, Integer): Тип инициализации.
   Допустимые значения: 1, 2, 3, "probability", "grouped frequency", "ungrouped frequency".
2) values (Array): Массив значений интервалов и соответствующих частот или вероятностей.

Блок 4.
1. DiscreteVariationSeries
  Описание:
  Класс для работы с дискретными вариационными рядами. Позволяет инициализировать ряды на основе вероятностей или частот и строить графики распределений.
  Конструктор: DiscreteVariationSeries.new(initialization_type, values)
  Параметры:
    1) initialization_type (String, Integer): Тип инициализации.
     Допустимые значения: "probability", "grouped frequency", "ungrouped frequency", "p", "gf", "uf", 1, 2, 3.
    2) values (Array): Массив значений случайной величины и соответствующих вероятностей или частот.

Методы
  1) mathExpectation()
  Описание: Вычисляет математическое ожидание.
  Выход:
    Возвращает Float — значение математического ожидания.
  2) variance()
  Описание: Вычисляет дисперсию.
  Выход:
    Возвращает Float — значение дисперсии.
  3) aSD()
  Описание: Вычисляет стандартное отклонение.
  Выход:
    Возвращает Float — значение стандартного отклонения.
  4) distributionFunction(x)
  Описание: Вычисляет функцию распределения для заданного значения x.
  Параметры:
    x (Numeric): Значение для вычисления функции распределения.
  Выход:
    Возвращает Float — значение функции распределения.
  5) plot_distribution_polygon
  Описание: Строит многоугольник распределения и сохраняет его в файл distribution_polygon.png.
  6) plot_frequency_polygon
  Описание: Строит полигон частот и сохраняет его в файл frequency_polygon.png.
  7)plot_distribution_function
  Описание: Строит график функции распределения и сохраняет его в файл distribution_function.png.

2. IntervalVariationSeries
Описание:
Класс для работы с интервалами вариационных рядов. Наследует от класса DiscreteVariationSeries и добавляет методы для построения гистограмм и полигонов частот.

Конструктор: IntervalVariationSeries.new(initialization_type, values)
Параметры:
  1) initialization_type (String, Integer): Тип инициализации. 
    Допустимые значения: 1, 2, 3, "probability", "grouped frequency", "ungrouped frequency".
  2) values (Array): Массив значений интервалов и соответствующих частот или вероятностей.

Методы
  1) plot_histogram(frequency_type = :absolute)
    Описание: Строит гистограмму частот (абсолютных или относительных) и сохраняет её в файл.
  2) plot_frequency_polygon(frequency_type = :absolute)
    Описание: Строит полигон частот (абсолютных или относительных) и сохраняет его в файл.
  3) plot_distribution_function
    Описание: Строит график функции распределения для интервалов и сохраняет его в файл distribution_function.png.
  4) plot_cumulative_distribution_graph
    Описание: Строит график кумулятивной функции распределения и сохраняет его в файл cumulative_distribution_graph.png.
