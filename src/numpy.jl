module numpy

using Base, Statistics

struct NDArray{T}
    x::T
end

function wrapper(func, x; axis)
    if axis isa Int
        axis += 1
    end
    out = func(x, dims=axis)
    if ndims(out) > 1
        out = array(out)
    end
    out
end

function Base.getproperty(a::NDArray, s::Symbol) 
    x = Base.getfield(a, :x)
    if s == :x x
    elseif s == :sum return (;axis=:)->wrapper(sum, x; axis)
    elseif s == :min return (;axis=:)->wrapper(minimum, x; axis)
    elseif s == :max return (;axis=:)->wrapper(maximum, x; axis)
    elseif s == :mean return (;axis=:)->wrapper(mean, x; axis)
    elseif s == :std return (;axis=:)->wrapper(std, x; axis)
    elseif s == :T return NDArray(x')
    else error("not implemented")
    end
end

function Base.show(io::IO, a::NDArray)
    if ndims(a.x) == 1
        print(io, "array(")
        print(io, a.x)
        print(io, ")")
    else
        lines = split(repr(MIME"text/plain"(), a.x), '\n')[2:end]
        print(io, "array([")
        for (i,line) in enumerate(lines)
            i == 1 ? print(io, line) : print(io, "       " * line)
            i == length(lines) ?  print(io, "])") : println(io)
        end
    end
end

array(a) = NDArray(collect(a))

end
