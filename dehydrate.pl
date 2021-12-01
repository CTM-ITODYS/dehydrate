#!/usr/bin/perl
# ******************
# *  dehydrate.pl  *
# ******************
#
# usage   dehydrate.pl parameter.prmtop trajectory.nc Y
#
# The goal of this soft is to remove water molecules from
# a molecular dynamics trajectory. This way, the trajectory
# requires less disk space. Beware, if you add the 'Y' tag at
# the end of the command file, the input trajectory file 
# will be removed, this procedure cannot be undone.
# At the end, you will get two new files (prmtop and nc)
# with the DRY prefix.
#
use strict;
use Math::Trig;
#-----------------------------------------------------------------------------------------------------------------------------
# Get the input file and declarations
#
my $prmtop=$ARGV[0];
my $trajec=$ARGV[1];
my $remove=$ARGV[2];
my $trajout="";
my $sizeinp=0;
my $sizeout=0;
my $save_space=0;
#-----------------------------------------------------------------------------------------------------------------------------
# Check input files
#
if ($prmtop eq ""){print "\n\n... You didn't provided the requested files. Bye"; exit(0);}
if ($trajec eq ""){print "\n\n... You didn't provided the requested files. Bye"; exit(0);}
if ($remove eq "Y")
{
  print "The $trajec file will be deleted at the end of the process\n";
} else
{
  print "All files are kept. If you want to remove the $trajec file, you must add Y to the previous command\n";
}
#-----------------------------------------------------------------------------------------------------------------------------
# Get the size and unit of the trajectory file
#
$sizeinp = -s $trajec;
$sizeinp = $sizeinp/(1024*1024);
if ($sizeinp <= 1000)
 {
   printf "Your input file, %s is of %.1f Mo\n",$trajec,$sizeinp;
 }else
 {
  printf "Your input file, %s is of %.1f Go\n",$trajec,($sizeinp/1024);
 }
#-----------------------------------------------------------------------------------------------------------------------------
# Write the cpptraj input file dehydrate.flo
#
$trajout="Dry"."."."$trajec";
open (FCPP, "> dehydrate.flo");
print FCPP "parm $prmtop\n"; 
print FCPP "trajin $trajec\n";
print FCPP "strip :WAT outprefix Dry\n";
print FCPP "trajout $trajout\n";
print FCPP "run\n";
print FCPP "quit\n";
close(FCPP);
#-----------------------------------------------------------------------------------------------------------------------------
# Execute the cpptraj file
#
system ("cpptraj < dehydrate.flo > dehydrate.out");
$sizeout= -s $trajout;
$sizeout = $sizeout/(1024*1024);
$save_space=100*($sizeinp-$sizeout)/$sizeinp;
if ($sizeinp <= 1000)
 {
   printf "Output file, %s is now of %.1f Mo you save %i %% of space\n",$trajout,$sizeout,$save_space;
 }else
 {
  printf "Output file, %s is now of %.1f Go you save %i %% of space\n",$trajout,($sizeout/1024),$save_space;
 }
#-----------------------------------------------------------------------------------------------------------------------------
# Remove file
#
if ($remove eq "Y")
{
 if ($sizeout > 1){ system("rm $trajec");}
}
#-----------------------------------------------------------------------------------------------------------------------------
