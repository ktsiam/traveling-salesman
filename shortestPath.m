function [path, dist] = shortestPath(table)
%function path = shortestPath(table)
%Inputs:
    %table: (size x size) matrix containing all distances between
    %destinations
%Outputs:
    %path: a vector containing indices of destinations in the fastest way
    %one can traverse them.

len = length(table);

%if the length is lower than 10, we use the bruteForce method (t ~ 1.6s)
if len < 10
    [path, dist] = bruteForce(table, len);
    
%else we approximate using the simulated Annealing probabilistic method
else
    [path, dist] = simulatedAnnealing(table, len);
end