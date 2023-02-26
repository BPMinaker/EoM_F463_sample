using EoM_F463, DelimitedFiles

list = readdir("students") # read in the list of input files in the student folder
names = [] # student names
nums = [] # student numbers
groups = [] # group names
laptime = [] # empty variable to store laptime

# for each team
for file in list
    println("Running ", file,"...")
    # read student chosen params
    include(joinpath("students", file))
    include("fixed_specs.jl")

    front = susp(front_ubj, front_lbj, front_uaapf, front_uaapr, front_laapf, front_laapr, front_itre, front_otre, front_sue, front_sle, front_k, front_c,front_kr, mu, kt, t)

    rear = susp(rear_ubj, rear_lbj, rear_uaapf, rear_uaapr, rear_laapf, rear_laapr, rear_itre, rear_otre, rear_sue, rear_sle, rear_k, rear_c, rear_kr, mu, kt, t)

    params = props(;mass,Ix,Iy,Iz,hg,wb,fwf,cod,farea,front,rear,drive,engine_type,e,ex,fbf,acc_max)

    # set engine data, compute shift speeds, p is plot of performance map
    p = prelim!(params, true)
    # load track, and compute target velocity around it for driver
    track!(params)
    # build equations of motion
    build_model!(params)

    # call solver to run
    sol, yout = solver(params)
    # print solver stats
    # println(sol.destats)

    # record name, numbers, laptime
    push!(names, student_names)
    push!(nums, student_numbers)
    push!(groups, group_name)
    push!(laptime, sol.t[end])
    println("Laptime is $(round(sol.t[end], digits = 2)) seconds!")

    # plot results in timestamped folder, name saved in "out"
    out = plot_results(sol, yout, p, group_name, params, disp = false)
    # save the input file there too
    cp(joinpath("students", file), joinpath(out, "my_specs.jl"),force = true)
end 

# write animation of top three fastest vehicles
F463_animate(laptime, groups)

# write the results
writedlm("results.out", [laptime groups names nums])

println("Done.")

