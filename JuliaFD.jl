# ---
# jupyter:
#   jupytext:
#     formats: ipynb,jl
#     text_representation:
#       extension: .jl
#       format_name: light
#       format_version: '1.3'
#       jupytext_version: 1.0.2
#   kernelspec:
#     display_name: Julia 1.1.0
#     language: julia
#     name: julia-1.1
# ---

# ## Algorithm to find all subsets that define functionallyan attribute in Julia

# +
using Combinatorics
using DataFrames
using Formatting
using CSV

df = CSV.read("InfoNeza/Delitos/Delitos_cleaned.csv")
f = [:Delitos]
findex = findfirst(names(df) .== f[1])

for alpha in collect(powerset(deleteat!(names(df), findex)))
    if alpha != []
        df_filtered = df[alpha]
        
        assumed_tuples = []
        flag = true
        
        for index in 1:nrow(df);
            print()
            found = false
            for tuple_index in assumed_tuples
                if df_filtered[index, :] == df_filtered[tuple_index, :]
                    found = true
                    flag = df[index, f[1]] == df[tuple_index, f[1]]
                    #print("index=")
                    #print(index)
                    #println(df[index,f[1]])
                    #print(" ")
                    #print("tuple index=")
                    #print(df[tuple_index,f[1]])
                end
            end
            
            #print(found)
            if found == false
               push!(assumed_tuples, index) 
            end
        end
        
        if flag
            fe = FormatExpr("{1} \U027F6 {2}")
            printfmtln(fe, alpha, f)
        end
    #println(assumed_tuples)
    end
end
# -


# ## Algorithm to find the minimal subsets that define functionallyan attribute in Julia

# +
using Combinatorics
using DataFrames
using Formatting
using CSV

df = CSV.read("test.csv")
f = [:B]
findex = findfirst(names(df) .== f[1])

min = typemax(Int64)
for alpha in collect(powerset(deleteat!(names(df), findex)))
    if alpha != []
        df_filtered = df[alpha]
        
        assumed_tuples = []
        flag = true
        
        for index in 1:nrow(df);
            print()
            found = false
            for tuple_index in assumed_tuples
                if df_filtered[index, :] == df_filtered[tuple_index, :]
                    found = true
                    flag = df[index, f[1]] == df[tuple_index, f[1]]
                    #print("index=")
                    #print(index)
                    #println(df[index,f[1]])
                    #print(" ")
                    #print("tuple index=")
                    #print(df[tuple_index,f[1]])
                end
            end
            
            #print(found)
            if found == false
               push!(assumed_tuples, index) 
            end
        end
        
        if flag
            if length(alpha) <= min
                fe = FormatExpr("{1} \U027F6 {2}")
                printfmtln(fe, alpha, f)
                min = length(alpha)
            else
                break
            end
        end
    #println(assumed_tuples)
    end
end
# -