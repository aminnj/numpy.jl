module numpy

using Base

struct NDArray{T}
    x::T
end

function Base.getproperty(a::NDArray, s::Symbol) 
    x = Base.getfield(a, :x)
    if s == :x x
    elseif s == :sum return ()->sum(x)
    elseif s == :min return ()->minimum(x)
    elseif s == :max return ()->maximum(x)
    elseif s == :mean return ()->sum(x)/length(x)
    else error("not implemented")
    end
end

function Base.show(io::IO, a::NDArray)
    print(io, "array(")
    print(io, a.x)
    print(io, ")")
end

array(a) = NDArray(collect(a))

end
