using EoM, EoM_X3D, EoM_F463

# # set params to default values
# params = props()

# read student chosen params
include(joinpath("students", "my_specs_1.jl"))
include("fixed_specs.jl")

front = susp(front_ubj, front_lbj, front_uaapf, front_uaapr, front_laapf, front_laapr, front_itre, front_otre, front_sue, front_sle, front_k, front_c,front_kr, mu, kt, t)

rear = susp(rear_ubj, rear_lbj, rear_uaapf, rear_uaapr, rear_laapf, rear_laapr, rear_itre, rear_otre, rear_sue, rear_sle, rear_k, rear_c, rear_kr, mu, kt, t)

params = props(;mass,Ix,Iy,Iz,hg,wb,fwf,cod,farea,front,rear,drive,engine_type,e,ex,fbf,acc_max)

# build equation of motion, analyze
system = input_F463(u = 20, params)
output = run_eom!(system, true)
result = analyze(output, true)

# write results and animate mode shapes
summarize(system, result)
#write_html(system, result)

animate_modes(system, result)

# note that there will be one oscillatory roll mode,
# two oscillatory coupled bounce/pitch modes,
# if the suspension damping is really high, these may split
# into two overdamped roll modes modes, four overdamped bounce/pitch modes
# plus, depending on the oversteer/understeer configuration and speed there will be one oscillatory or two overdamped coupled lateral/yaw motion modes
# four oscillatory wheel hop modes:
# front in-phase, front out-of-phase, rear in-phase, rear out-of-phase
# four overdamped wheel rotation modes, much like wheel hop, i.e., in-phase, out-of-phase
# eight zero (or close to zero with round-off error) rigid body modes:
# each wheel rotation, lateral offset, yaw offset, forward offset, forward rolling
# rigid body modes occur for motions that will sustain themselves unchanged, i.e., no oscillation or decay

