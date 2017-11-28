%This function determines which direction for x and y the upwind
%scheme should consider while making sure the boundary conditions
%are not violated
function [U_x U_y east west north south] = chooseDirs(V, i, j)

%x and y directions are intially set to infinity
U_x = inf;
U_y = inf;

%A flag for which direction is chosen is set to false at the beginning
east = false;
west = false;
north = false;
south = false;

%This if statement checks all the boundary conditions to determine
%how U_x and U_y should be choosen
    if i == 1 & j == 1
        if V(i + 1, j) == inf
            U_x = 0;
        else
            U_x = V(i + 1, j);
            east = true;
        end

        if V(i, j + 1) == inf
            U_y = 0;
        else
           U_y = V(i, j + 1);
           south = true;
        end
    elseif i == size(V) & j == 1
        if V(i - 1, j) == inf
            U_x = 0;
        else
           U_x = V(i - 1, j); 
           west = true;
        end

        if V(i, j + 1) == inf
            U_y = 0;
        else
            U_y = V(i, j + 1);
            south = true;
        end
    elseif i == 1 & j == size(V)
        if V(i + 1, j) == inf
            U_x = 0;
        else
           U_x = V(i + 1, j); 
           east = true;
        end

        if V(i, j - 1) == inf
            U_y = 0;
        else
            U_y = V(i, j - 1);
            north = true;
        end
    elseif i == size(V) & j == size(V)
        if V(i - 1, j) == inf
            U_x = 0;
        else
           U_x = V(i - 1, j); 
           west = true;
        end

        if V(i, j - 1) == inf
            U_y = 0;
        else
            U_y = V(i, j - 1);
            north = true;
        end
    elseif i == 1
        if V(i + 1, j) == inf
            U_x = 0;
        else
            U_x = V(i + 1, j);
            east = true;
        end

        if V(i, j - 1) > V(i, j + 1)
            if V(i, j + 1) > 0
               U_y = V(i, j + 1);
               south = true;
            else
                U_y = 0;
            end
        elseif V(i, j - 1) < V(i, j + 1)
            if V(i, j - 1) > 0
               U_y = V(i, j - 1);
               north = true;
            else
                U_y = 0;
            end
        elseif V(i, j - 1) == V(i, j + 1) & V(i, j + 1) > 0
            U_y = 0;
        end
    elseif i == size(V)
        if V(i - 1, j) == inf
            U_x = 0;
        else
            U_x = V(i - 1, j);
            west = true;
        end

        if V(i, j - 1) > V(i, j + 1)
                if V(i, j + 1) > 0
                   U_y = V(i, j + 1);
                   south = true;
                else
                    U_y = 0;
                end
            elseif V(i, j - 1) < V(i, j + 1)
                if V(i, j - 1) > 0
                   U_y = V(i, j - 1);
                   north = true;
                else
                    U_y = 0;
                end
            elseif V(i, j - 1) == V(i, j + 1) & V(i, j + 1) > 0
                U_y = 0;
        end
    elseif j == 1
        if V(i, j + 1) == inf
            U_y = 0;
        else
            U_y = V(i, j + 1);
            south = true;
        end

        if V(i - 1, j) > V(i + 1, j)
            if V(i + 1, j) > 0
               U_x = V(i + 1, j);
               east = true;
            else
                U_x = 0;
            end
        elseif V(i - 1, j) < V(i + 1, j)
            if V(i - 1, j) > 0
               U_x = V(i - 1, j);
               west = true;
            else
                U_x = 0;
            end
        elseif V(i - 1, j) == V(i + 1, j) & V(i + 1, j) > 0
            U_x = 0;
        end 
    elseif j == size(V)
        if V(i, j - 1) == inf
            U_y = 0;
        else
            U_y = V(i, j - 1);
            north = true;
        end

        if V(i - 1, j) > V(i + 1, j)
            if V(i + 1, j) > 0
               U_x = V(i + 1, j);
               east = true;
            else
                U_x = 0;
            end
        elseif V(i - 1, j) < V(i + 1, j)
            if V(i - 1, j) > 0
               U_x = V(i - 1, j);
               west = true;
            else
                U_x = 0;
            end
        elseif V(i - 1, j) == V(i + 1, j) & V(i + 1, j) > 0
            U_x = 0;
        end
    else
        if V(i - 1, j) > V(i + 1, j)
            if V(i + 1, j) > 0
               U_x = V(i + 1, j);
               east = true;
            else
                U_x = 0;
            end
        elseif V(i - 1, j) < V(i + 1, j)
            if V(i - 1, j) > 0
               U_x = V(i - 1, j);
               west = true;
            else
                U_x = 0;
            end
        elseif V(i - 1, j) == V(i + 1, j) & V(i + 1, j) > 0
            U_x = 0;
        end

        if V(i, j - 1) > V(i, j + 1)
            if V(i, j + 1) > 0
               U_y = V(i, j + 1);
               south = true;
            else
                U_y = 0;
            end
        elseif V(i, j - 1) < V(i, j + 1)
            if V(i, j - 1) > 0
               U_y = V(i, j - 1);
               north = true;
            else
                U_y = 0;
            end
        elseif V(i, j - 1) == V(i, j + 1) & V(i, j + 1) > 0
            U_y = 0;
        end
    end

end

