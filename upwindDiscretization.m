%This function performs an upwinding discretization scheme for the
%given point
function U = upwindDiscretization(V, i, j, h, F_arr, sN)

%Trying to find U
U = inf; 

%U_x and U_y denote which way (E or W, N or S) that we are going to go
%and are initalized to inf
U_x = inf;
U_y = inf;

U_NE = inf;
U_NW = inf;
U_SE = inf;
U_SW = inf;
multi_neighbor = false;

%Set up boolean to show which direction was choosen
%All start as false
north = false; 
south = false; 
east = false; 
west = false;

%This determines in which direction(s) we will be looking at and sets
%the values for U_x and U_y
[U_x U_y east west north south] = chooseDirs(V, i, j);

%This sets up F values if it is desired

if F_arr(1) == F_arr(2)
    F = F_arr(1);
elseif F_arr(1) ~= F_arr(2) & sN == 1
    if j <= length(V)/2
        F = F_arr(1);
    else
        F = F_arr(2);
    end
elseif F_arr(1) ~= F_arr(2) & sN == 2
    if j <= length(V)/2
        F = F_arr(1);
    else
        F = F_arr(2);
    end
elseif F_arr(1) ~= F_arr(2) & sN == 5
    if mod(floor(i/10), 2) == 0 & mod(floor(j/10), 2) == 0
        F = F_arr(1);
    elseif mod(floor(i/10), 2) == 0 & mod(floor(j/10), 2) == 1
        F = F_arr(2);
    elseif mod(floor(i/10), 2) == 1 & mod(floor(j/10), 2) == 0
        F = F_arr(2);
    elseif mod(floor(i/10), 2) == 1 & mod(floor(j/10), 2) == 1
        F = F_arr(1);
    end
end
        
%If one of the direction is choosen, the solution is simple
if U_x == 0
     U = h/F + U_y;
elseif U_y == 0
     U = h/F + U_x;
else 
    %If two directions are choosen, U needs to be determined as such
    multi_neighbor = true;
    if U_x ~= 0 & U_y ~= 0
       
        %Solve the upwind quadratic equation
        eqn = [1 -(U_x + U_y) ((U_y^2 + U_x^2 - (h^2/ F^2))/2)];
        solns = roots(eqn);
        
        U = max(solns);
       
        %Because we are looking at something that has multiple directions
        %we need to consider NE, SE, NW, and SW directions
        if U> max(U_x, U_y)
            if north == true
                if east == true
                    i = i + 1;
                    j = j - 1;
                    U_NE = U;
                elseif west == true
                    i = i - 1;
                    j = j - 1;
                    U_NW = U;
                end
            elseif south == true
                if east == true
                    i = i + 1;
                    j = j + 1;
                    U_SE = U;
                elseif west == true
                    i = i - 1;
                    j = j + 1;
                    U_SW = U;
                end
            end 
        else
        
            %This computes the value for NE, NW, SE, and SW
            if north == true
                if east == true
                    U_NE = h/F + min(V(i, j - 1), V(i + 1, j));
                    i = i + 1;
                    j = j - 1;
                elseif west == true
                    U_NW = h/F + min(V(i, j - 1), V(i - 1, j));
                    i = i - 1; 
                    j = j - 1;
                end
            elseif south == true
                if east == true
                    U_SE = h/F + min(V(i, j + 1), V(i + 1, j));
                    i = i + 1;
                    j = j + 1;
                elseif west == true
                    U_SW = h/F + min(V(i, j + 1), V(i - 1, j));
                    i = i - 1;
                    j = j + 1;
                end
            end 
        end
    end
end

%If we were looking at a situation where there were multiple neighbors
%U is choosen to be the minimum of NE, NW, SE, and SW directions
if multi_neighbor == true
    non_cardinal = [U_NE U_NW U_SE U_SW];
    U = min(non_cardinal);
end

end

