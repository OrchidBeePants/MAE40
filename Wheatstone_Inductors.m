% script for Wheatstone_Inductors
% Computes the currents and intermediate nodal voltages of a Wheatstone Bridge with two inductors.
% based on Renaissance Robotics codebase, Chapter 10, https://github.com/tbewley/RR

syms L2 L5 s V0; R1=1e3; R4=1e3; R3=1e5;
A=[1 -1 -1 0 0 0 0 0; 0 1 0 -1 -1 0 0 0; 0 0 1 1 0 -1 0 0; 0 R1 0 0 0 0 1 0; ...
   0 0 1 0 0 0 0 1/(L2*s); 0 0 0 R3 0 0 -1 1; 0 0 0 0 R4 0 -1 0; 0 0 0 0 0 1 0 1/(-L5*s)];
b=[0; 0; 0; V0; V0/(L2*s); 0; 0; 0]; x=A\b

% output x = [I0; I1; I2; I3; I4; I5; Va; Vb]
