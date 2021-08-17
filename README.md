# numpy.jl

First: sorry.

For those times when Python muscle memory kicks in, or
when you paste code into the wrong REPL...

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

julia> a = np.array(rand(4,4))
array([ 0.221871  0.560007  0.122403  0.610974
        0.422056  0.690388  0.885317  0.917003
        0.770121  0.082031  0.843426  0.642187
        0.571325  0.675552  0.434466  0.0472529])

julia> a.mean(axis=0)
array([ 0.475998  0.503286  0.557251  0.514633])

julia> a.sum()
2.051168
```


