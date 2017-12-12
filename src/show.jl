# rawview
AAFixed{T<:FixedPoint,N} = AbstractArray{T,N}
function Base.showarg(io::IO, A::MappedArray{T,N,AA,typeof(reinterpret)}, toplevel=false) where {T<:Integer,N,AA<:AAFixed}
    print(io, "rawview(")
    showarg(io, parent(A))
    print(io, ')')
    toplevel && print(io, " with eltype ", T)
end

Base.summary(A::MappedArray{T,N,AA,typeof(reinterpret)}) where {T<:Integer,N,AA} = summary_build(A)

# normedview
AAInteger{T<:Integer,N} = AbstractArray{T,N}
function Base.showarg(io::IO, A::MappedArray{T,N,AA,F,typeof(reinterpret)}, toplevel=false) where {T<:FixedPoint,N,AA<:AAInteger,F}
    print(io, "normedview(")
    ColorTypes.showcoloranttype(io, T)
    print(io, ", ")
    showarg(io, parent(A))
    print(io, ')')
    toplevel && print(io, " with eltype ", T)
end

Base.summary(A::MappedArray{T,N,AA,F,typeof(reinterpret)}) where {T<:FixedPoint,N,AA,F} = summary_build(A)

function Base.showarg(io::IO, r::Base.ReinterpretArray{T}, toplevel) where {T<:Colorant}
    print(io, "reinterpret(")
    ColorTypes.colorant_string_with_eltype(io, T)
    print(io, ", ")
    showarg(io, parent(r), false)
    print(io, ')')
end

function Base.showarg(io::IO, r::Base.ReinterpretArray{T}, toplevel) where {T<:FixedPoint}
    print(io, "reinterpret(")
    ColorTypes.showcoloranttype(io, T)
    print(io, ", ")
    showarg(io, parent(r), false)
    print(io, ')')
end
