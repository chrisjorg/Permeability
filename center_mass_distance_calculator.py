#! /usr/bin/env python

# load the MDAnalysis module
import MDAnalysis
import numpy
import numpy as np

# load trajectory
u = MDAnalysis.Universe("../equ.gro","../traj.xtc")

# open a file for writing the data to
OUTPUT = open("center_mass_distance_between_each_drug_molecules_and_membrane.dat",'w')

# loop over all frames
for frame in u.trajectory:

    # identify the membrane
    membrane = u.select_atoms("bynum 661:11820")
    # find out the z coordinate of the centre of mass of the bilayer
    membranez = membrane.center_of_mass()[2]
    #find out the box z size
    box_z=u.dimensions[2]
    
    DD=np.zeros((20,1))
    
    for i in range(1,20):
     
     # identify the caffeines
     
     caff=u.select_atoms("resname ibupr and resid "+str(i))
     
     # find out the z coordinate of the centre of mass of the caffeine
     caffz=caff.center_of_mass()[2]
        
     if abs(caffz-membranez)<(box_z/2):
      DD[i]=caffz-membranez
     else:
      if caffz > membranez:
       DD[i]=caffz-(membranez+box_z)
      else:
       DD[i]=caffz-(membranez-box_z)
    
    # find out what frame we are on
    frame = u.trajectory.frame
    # print frame,DD[1],DD[10],DD[19]
    print >> OUTPUT, "%7i %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f %7.5f" % (frame,DD[0],DD[1],DD[2],DD[3],DD[4],DD[5],DD[6],DD[7],DD[8],DD[9],DD[10],DD[11],DD[12],DD[13],DD[14],DD[15],DD[16],DD[17],DD[18],DD[19])

# close the file    
OUTPUT.close   
