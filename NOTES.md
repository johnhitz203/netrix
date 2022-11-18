# Notes from 11/18/2022

## Overview
Discussed comprehensions and how to use them to create a string representation of our shapes.

## Comprehensions
Comprehensions are syntactic sugar for looping over an *enumerable* and individually processing each value into a *collectable*. They use the `for` special form which consists of *generators*, optionally *filters*, and *collectables*.

```
iex> for n <- [1, 2, 3], do: n + 1
[2, 3, 4]
```

### Generators
Generators take the form (`lhs <- rhs`) where the `lhs` is an intermediate pattern that holds each value for processing into a new collectable ([2, 3, 4] in the example above) as the enumerable is iterated over. The `rhs` is the enumerable.

A comprehension can have multiple generators. This allows you to create every permutation of combining the generators together.

```
iex> for x <- 1..4, y <- 1..4, do: {x, y}
{1, 1}, {1, 2}, {1, 3}, {1, 4}, {2, 1}, {2, 2}, {2, 3}, {2, 4}, {3, 1}, {3, 2}, {3, 3}, {3, 4}, {4, 1}, {4, 2}, {4, 3}, {4, 4}]
```
### Filters(aside)
Filters discard all elements of the enumerable that return a false or nil value.

```
iex> for x <- 1..4, y <- 1..4, rem(x, 2) === 0 do
  {x, y}
end
[{2, 1}, {2, 2}, {2, 3}, {2, 4}, {4, 1}, {4, 2}, {4, 3}, {4, 4}]
```

### :into option
Allow the result of the comprehension to be inserted into a new data structure.

```
iex> for x <- [1, 2, 3], do: to_string(x)
"123"
```

### Takeaways for Netrix
By nesting our comprehensions we can achieve a useful representation of our shapes

That is, if we take one of our shapes and assign it as
```
z = [
      {2, 2}, {3, 2},
              {3, 3}, {4, 3}
] 
```
then by assigning our comprehension to a variable 

```
iex(12)> output = for x <- 1..4 do            
...(12)>            for y <- 1..4 do
...(12)>              if {x, y} in z do
...(12)>                "$"            
...(12)>              else             
...(12)>                "."
...(12)>              end
...(12)>            end
...(12)>          end
[
  [".", ".", ".", "."],
  [".", "$", ".", "."],
  [".", "$", "$", "."],
  [".", ".", "$", "."]
]
```
which is comparable  with
```
iex(13)> output = Enum.map(1..4, fn(x) ->  
...(13)>            Enum.map(1..4, fn(y) ->
...(13)>              if {x, y} in z do    
...(13)>                "$"                
...(13)>              else                 
...(13)>                "."                
...(13)>              end
...(13)>            end)
...(13)>          end)
[
  [".", ".", ".", "."],
  [".", "$", ".", "."],
  [".", "$", "$", "."],
  [".", ".", "$", "."]
]
```
we can do the following
```
iex> Enum.each(output, fn(row) ->
       Enum.join(row, "") |> IO.puts
       end
     )
....
.$..
.$$.
..$.
```

### Next Step
Implement the to string method for our shapes.




