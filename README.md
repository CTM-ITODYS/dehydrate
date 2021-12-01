# dehydrate
dehydrate water on a trajectory file with cpptraj


dehydrate.pl  

usage   dehydrate.pl parameter.prmtop trajectory.nc Y

The goal of this soft is to remove water molecules from
a molecular dynamics trajectory. This way, the trajectory
requires less disk space. Beware, if you add the 'Y' tag at
the end of the command file, the input trajectory file 
will be removed, this procedure cannot be undone.

At the end, you will get two new files (prmtop and nc)
with the DRY prefix.
