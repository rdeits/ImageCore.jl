module ImageCoreTests

using ImageCore, Base.Test

@test isempty(detect_ambiguities(ImageCore, Base, Core))

include("colorchannels.jl")
include("views.jl")
include("convert_reinterpret.jl")
include("traits.jl")
include("map.jl")
include("functions.jl")
include("show.jl")

# run these last
isCI = haskey(ENV, "CI") || get(ENV, "JULIA_PKGEVAL", false)
if Base.JLOptions().can_inline == 1 && !isCI
    info("running benchmarks")
    include("benchmarks.jl")  # these fail if inlining is off
end

end
