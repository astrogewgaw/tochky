import Pkg
let
    pkgs = [
        "Revise",
        "IJulia",
        "OhMyREPL",
        "StaticLint",
        "SymbolServer",
        "PkgTemplates",
        "JuliaFormatter",
        "LanguageServer",
        "BenchmarkTools",
    ]
    for pkg in pkgs
    if Base.find_package(pkg) === nothing
        Pkg.add(pkg)
    end
    end
end

using Revise
using OhMyREPL
using BenchmarkTools
