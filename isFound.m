function [found, ind] = isFound(city, Data)
%function [found, ind] = isFound(name, Data)
%Inputs:
    %name: name of city to be searched
    %Data: data of info about ~7500 cities
%Outputs:
    %found: whether the city was found or not (case insensitive)
    %ind: if the case was found it returns its index. Otherwise returns
    %length(Data.s)
    
%Iterating through all entries
for ind = 1:length(Data.city)
    
    %if we find the name matching one of the entries, we confirm
    if strcmpi(Data.city{ind}, city)
        s = sprintf('Do you mean: %s, %s?(y/n)\n',Data.city{ind},...
            Data.country{ind});
        inp = inputdlg(s);
        
        %if it is confirmed, we return that it was found and the city name
        if strcmpi(inp,'yes') || strcmpi(inp, 'y')
            found = true;
            return;
        end
        
        %else we continue searching
    end
end

%if not found, we print so and return false
fprintf('Unfortunately, %s could not be found :(\n', city{1});
found = false;
