# numpy.jl

First: sorry.

## Pop quiz
### Question
```python
import numpy as np
np.random.seed(42)
a = np.random.normal(0, 1, (4,4))
a.mean(axis=0).sum()
```
Is this python code or julia code?
### Answer
Yes

## Installation

```
]add https://github.com/aminnj/numpy.jl
```

## Usage

```julia
julia> import numpy as np

julia> a = np.array([1,2,3,4])
array([1, 2, 3, 4])

julia> a.mean()
2.5

julia> np.random.seed(42)

julia> a = np.random.normal(0, 1, (4,4))
array([ -0.556027    1.77786   -2.64199    0.518149
        -0.444383   -1.1449     1.00331    1.49138
         0.0271553  -0.468606   1.08238    0.367563
        -0.299484    0.156143   0.187028  -0.886205])

julia> a.mean(axis=0)
array([ -0.318185  0.0801243  -0.092318  0.372721])

julia> a.sum()
0.16937152233464714
```

Note that even without this package, you can do
```julia
julia> import Base as np

julia> np.sum([1,2,3,4])
10
```
