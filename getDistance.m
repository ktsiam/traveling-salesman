function [dist] = getDistance(table, path)
%function [dist] = getDistance(table, path)
%Inputs: 
    %table: matrix of distances between any two destinations
    %path: vector of the indices of the shortest(approximately) path
        %starting and ending from destination 1
%Outputs:
    %dist: total distance of path
    
%initializing distance
dist = 0;

%adding each individual subPath
for i = 1:length(path)-1
    dist = dist + table(path(i),path(i+1));
end

%adding the last path, back to the start
dist = dist + table(path(1), path(end));
