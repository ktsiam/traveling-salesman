clear
%loading data from 7300 cities (customized to remove unnecessary info)
load('cityData.mat');
size = length(Data);

while true
    %asking for the amount of cities one wants to visit
    num = input('\n\n\n\n\n\nHow many cities would you like to visit?\n');
    if num < 1
        %loops for invalid input
        fprintfdlg('Sorry, %d is not a valid number of cities', num);
    else
        break;
    end
end
   
cities = zeros(num+1, 1);
curr = '';
while true
    %asking for initial position
    curr = inputdlg('Which city do you want to start from?');
    [found, cities(1)] = isFound(curr, Data);
    if found
        break;
    end
end

for i = 1:num
    while true
        %asking for each of the following destinations
        s =sprintf('What is your next destination?(%d out of %d)\n',i,num);
        curr = inputdlg(s);
        [found, cities(i+1)] = isFound(curr, Data);
        if found
            break;
        end
    end
end

%making vectors of the corresponding citys' latitudes and longitudes from
%our database
lat = zeros(1, num+1);
long = zeros(1, num+1);
for i = 1:num+1
    lat(i)  = Data.lat(cities(i));
    long(i) = Data.long(cities(i));
end

%creating a graph(table) containing all the distances between any 2 cities
table = setGraph(lat, long);

%finding the shortest path and its distance (100% correct if input less
%than 10 cities, <10% off from optimal solution for more than 10
%cities)
[path, dist] = shortestPath(table);


%printing results
ID = fopen('output.txt', 'wb');
if ID~= -1
    fprintf(ID,'The route you should follow is:\n');
    fprintf(ID, '%s - ', Data.city{cities(path(1:end-1))});
    fprintf(ID,'%s\nDistance: %0.0f km\n', Data.city{cities(1)}, dist);
    fclose(ID);
    disp('output is in the output.txt file');
else
    disp('cannot open file');
end

