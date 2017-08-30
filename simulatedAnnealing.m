function [path, dist] = simulatedAnnealing(table, len)
%function [path, dist] = simulatedAnnealing(table, len)
%Inputs:
    %table: matrix of distances between any two destinations
    %len: length of that matrix (not necessary but makes the code cleaner)
%Outputs:
    %path: vector of the indices of the shortest(approximately) path
        %starting and ending from starting point
    %dist: total distance of path

%temperature: the more the system cools, the lower the probability of an
%unoptimal alternation (look rand < exp... inequality below)
Temp = 100000;     

%amount of alternations before each temperature drop (this is an estimated
%optimal by me, keeping the time below 1 s for my large experimental set
%(42 destinations) and maximizing efficiency
L = 45*len;       

%a resonable amount of minimum temperature for the system to have time to
%stabilize to a near-optimal state, without volatile changes
minT = 1e-9;   

%starting with a random permutation of destinations
bestpath = randperm(len);
dist = getDistance(table, bestpath);

%as the system is cooling, changes are constantly made
while Temp > minT
    for i = 1:L
        
        %a random swap is decided
        ind1 = ceil(rand*len);
        ind2 = ceil(rand*len);
        
        while ind1 == ind2
            ind1 = ceil(rand*len);
        end
        
        %swapping an element
        alternative = bestpath;
        swap1 = alternative(ind1);
        alternative(ind1) = alternative(ind2);
        alternative(ind2) = swap1;
        
        altpath = getDistance(table,alternative);
        
        %comparing the new path with the old one
        if altpath < dist
            
            %if the new path is better we adopt it
            bestpath = alternative;
            dist = altpath;
            
        elseif rand < exp(-(altpath - dist)/Temp)
                
            %if the new path is not better, the higher the temperature, the
            %most likely we are to still make the change
            bestpath = alternative;
            dist = altpath;
            
        end
    end

    %cooling after each iteration
    Temp = 0.9*Temp;
end

%ensuring the path stars and ends from point 1
path = zeros(1, len);
ind = find(bestpath == 1,1);

for k = 1:len+1
    path(k) = bestpath(mod(ind+k-2, len)+1);
end

