function [table] = setGraph(lat, long)
%function table = setTable(long, lat)
%Inputs,
    %lat: vector of latitudes in degrees
    %long: vector of longitudes in degrees(lengths should match)
%Outputs:
    %dist: table of surface distances from each point to another (km)
    
size = length(long);
R = 6371; %km

%checking for correct dimensions
if (size ~= length(lat))
    table = NaN;
    return;
end

%converting degrees to radiants
lat = deg2rad(lat);
long = deg2rad(long);

%Initializing dist matrix
table = zeros(size, size);

for i = 1:size
    
    for k = 1:size
        
        % we can then derive the other ones
        if (i < k)
           
            %Calculating distance
            Dlat = lat(i) - lat(k); 
            Dlong = long(i) - long(k);
            
            a = sin(Dlat/2)^2 + cos(lat(i)) * cos(lat(k)) * sin(Dlong/2)^2;
            
            x = sqrt(1-a);
            y = sqrt(a);
            
            c = 2 * atan(y/x);           
            d = R * c;
            
            table(i, k) = d;
            table(k, i) = d; %copy symetrically and leave diagonal zero
            
        end
        
    end
    
end
