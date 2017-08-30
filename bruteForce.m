function [path, dist] = bruteForce(table, len)
%function [path, dist] = bruteForce(table, len)
%Inputs:
    %table: matrix of distances between any two destinations
    %len: length of that matrix (not necessary but makes the code cleaner)
%Outputs:
    %path: vector of the indices of the shortest path starting and ending 
        %from starting point
    %dist: total distance of path

%calculating all possible paths
per = perms(1:len);
siz = length(per);

%initializing distance as infinite
dist = inf;

%we iterate through each path, and we keep the shortest
for i = 1:siz
    
    %possible path
    apath = per(i, :);
    adist = getDistance(table, apath);  
    
    if adist < dist
        dist = adist;
        bestpath = apath;
    end    
    
end

%ensuring the path stars and ends from point 1
path = zeros(1, len);
ind = find(bestpath == 1,1);

for k = 1:len+1
    path(k) = bestpath(mod(ind+k-2, len)+1);
end


