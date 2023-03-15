# Edit this file to enter your team info and vehicle specs
# Do not alter the format of this file!!!

student_names = ["Newton" "Euler"]
student_numbers = ["000000001" "000000002"]
group_name = "Laws of Motion"

engine_type = 1 # Enter your engine choice here
# 1 means engine 1 (higher redline)
# 2 means engine 2 (more torque)

e = [5,4,3,2,1] # Enter your 5 or 6 gear ratios here, starting from _first_ gear, i.e., in the default values, 1st gear is 5.0:1, note that the defaults are a poor choice
ex = 3.5 # Enter your axle final drive ratio here

# centre of mass location
fwf = 0.45 # front weight fraction, from 0.05 to 0.95
# 0 means all weight on rear axle
# 1 means all weight on front axle
# 0.5 means equal weight on both axles

# suspension spring stiffness [N/m], each corner; note that this is _not_ the same as the wheel rate (stiffness measured at the wheel), but the two are related by the motion ratio effect, i.e., where you choose the location of the upper and lower ends of the spring below will have an influence on the effective stiffness at the wheel
front_k = 18000
rear_k = 20000

# suspension damping [Ns/m], each corner; again measured at the spring and not the wheel
front_c = 2000
rear_c = 2000

# roll bar stiffness [Nm/rad], with bending arm length fixed at 0.25 m, so the equivalent vertical linear spring is k/(0.25^2), i.e., a 1000 Nm/rad spring is equivalent to a 16000 N/m vertical linear spring; this can be related to physical dimensions using k = GJ/L, so a 1 m steel bar of diameter 20 mm has kr about 1200 Nm/rad
front_kr = 500
rear_kr = 250

# suspension geometry is measured using an origin on the ground at the tire contact point, with x pointing forward, y pointing to the left, z up
# define the left side only, right is mirrored, so y values should all be -ve, z all +ve

# front suspension geometry of the left front wheel [m]
front_ubj= [0,-0.15,0.45] # upper ball joint
front_lbj = [0,-0.1,0.15] # lower ball joint
front_uaapf = [0.15,-0.4,0.45] # upper a-arm pivot, front
front_uaapr = [-0.15,-0.4,0.45] # upper a-arm pivot, rear
front_laapf = [0.15,-0.5,0.15] # lower a-arm pivot, front
front_laapr = [-0.15,-0.5,0.15] # lower a-arm pivot, rear
front_itre = [-0.1,-0.45,0.3] # inner tie rod end
front_otre = [-0.1,-0.12,0.3] # outer tie rod end
# front spring geometry, lower end is fixed to the lower A-arm, and the upper end is fixed to the chassis; as the spring becomes more vertical, it becomes effectively stiffer at the wheel; similarly, as it moves outward closer to the wheel, it also becomes effectively stiffer at the wheel
front_sle = [0,-0.2,0.15] # spring lower end
front_sue = [0,-0.3,0.5]  # spring upper end


# rear suspension geometry, of the left rear wheel, with origin at the left front wheel contact point
rear_ubj= [0,-0.15,0.45] # upper ball joint
rear_lbj = [0,-0.1,0.15] # lower ball joint
rear_uaapf = [0.15,-0.5,0.45] # upper a-arm pivot, front
rear_uaapr = [-0.15,-0.5,0.45] # upper a-arm pivot, rear
rear_laapf = [0.15,-0.6,0.15] # lower a-arm pivot, front
rear_laapr = [-0.15,-0.6,0.15] # lower a-arm pivot, rear
rear_itre = [-0.1,-0.45,0.3] # inner tie rod end
rear_otre = [-0.1,-0.12,0.3] # outer tie rod end

rear_sle = [0,-0.2,0.15] # spring lower end
rear_sue = [0,-0.3,0.5]  # spring upper end


# braking system parameters
fbf = 0.7 # front brake fraction, from 0 to 1
# 0 means rear brakes only
# 1 means front brakes only
# 0.5 equal brake torques on both axles

# driver model
acc_max = 0.4 # [g's] maximum acceleration, used to compute target speeds based on track curvature
