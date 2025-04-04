def factorial(n)
  raise ArgumentError, "Input must be a non-negative integer." unless n.is_a?(Integer) && n >= 0

  fact = 1
  for i in 1..n
    fact *= i
  end
  return fact 
end 

def permutations_without_repetitions(n)
  raise ArgumentError, "Input must be a non-negative integer." unless n.is_a?(Integer) && n >= 0
  
  return factorial(n)
end

def permutations_with_repetitions(n, counts)
  raise ArgumentError, "Input must be a non-negative integer." unless n.is_a?(Integer) && n >= 0
  raise ArgumentError, "Counts must be an array of non-negative integers." unless counts.is_a?(Array) && counts.all? { |c| c.is_a?(Integer) && c >= 0 }
  
  result = factorial(n)
  
  for element in counts do
    result = result / factorial(element)
  end
  
  return result
end

def arrangements_without_repetitions(n, k)
  raise ArgumentError, "Input must be a non-negative integer." unless k.is_a?(Integer) && k >= 0
  raise ArgumentError, "Input must be a non-negative integer." unless n.is_a?(Integer) && n >= 0
  raise ArgumentError, "k must be less than or equal to n." unless k <= n
  
  return factorial(n) / factorial(n - k)
end

def arrangements_with_repetitions(n, k)
  raise ArgumentError, "Input must be a non-negative integer." unless k.is_a?(Integer) && k >= 0
  raise ArgumentError, "Input must be a non-negative integer." unless n.is_a?(Integer) && n >= 0
  
  return n**k
end

def combinations_without_repetitions(n, k)
  raise ArgumentError, "Input must be a non-negative integer." unless k.is_a?(Integer) && k >= 0
  raise ArgumentError, "Input must be a non-negative integer." unless n.is_a?(Integer) && n >= 0
  raise ArgumentError, "k must be less than or equal to n." unless k <= n

  return factorial(n) / (factorial(k) * factorial(n - k))
end

def combinations_with_repetitions(n, k)
  raise ArgumentError, "Input must be a non-negative integer." unless k.is_a?(Integer) && k >= 0
  raise ArgumentError, "Input must be a non-negative integer." unless n.is_a?(Integer) && n >= 0
  
  return factorial(n + k - 1) / (factorial(k) * factorial(n - 1))
end
