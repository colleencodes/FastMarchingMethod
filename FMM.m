%Colleen Stock

%This algorithm implements the Fast Marching Method (FMM) on the 
%eikonal equation

%Definition of variables
%gridSize: a square domain for the graph
%exit_set_x: the x value of the exit set
%exit_set_y: the y value of the exit set
%Q: the exit set
%V: solution to the equations (speeds)
%L: considered list (points to look at)
%Accepted: keeps track of which points have been accepted
%Updated: keeps track of which points have been updated
%F: input speed values

%Get user input and error check
prompt1 = 'Enter the number of the simulation you want to run \n (1) no barricades \n (2) outer barricades \n (3) spiral \n (4) maze \n (5) checkerboard \n';
simulation_type = input(prompt1);

while simulation_type <= 0 || simulation_type > 5
    prompt1 = 'Sorry that is not a simulation type. Please enter the number of the simulation you want to run \n (1) no barricades \n (2) outer barricades \n (3) spiral \n (4) maze \n (5) checkerboard \n';
    simulation_type = input(prompt1);
end

if simulation_type == 1
    prompt2 = 'Input the size of the grid: ';
    gridSize = input(prompt2);

     prompt3 = 'Define the x value of your exit set: ';
    exit_set_x = input(prompt3);
    
    while exit_set_x > gridSize || exit_set_x <= 0
        prompt3 = 'That is outside of your grid size. Please redefine the x value of your exit set: ';
        exit_set_x = input(prompt3);
    end
    
    prompt4 = 'Define the y value of your exit set: ';
    exit_set_y = input(prompt4);
    
    while exit_set_y > gridSize || exit_set_y <= 0
        prompt4 = 'That is outside of your grid size. Please redefine the y value of your exit set: ';
        exit_set_y = input(prompt4);
    end
    
    V = inf(gridSize);          
    L = inf(gridSize);          
    Accepted = zeros(gridSize); 
    Updated = zeros(gridSize);   
    
    V(exit_set_x, exit_set_y) = 0;
    Q = V(exit_set_x, exit_set_y);
    
    prompt5 = '(1) Split domain or (2) constant domain: ';
    split_const = input(prompt5);
    
    if split_const == 1
        prompt6 = 'Enter F1 value: ';
        F1 = input(prompt6);
        
        prompt7 = 'Enter F2 value: ';
        F2 = input(prompt7);
        
        F = [F1 F2];
    else
        prompt8 = 'Enter F value: ';
        F_const = input(prompt8);
        
        F = [F_const F_const];
    end
    
elseif simulation_type == 2
    prompt2 = 'Input the size of the grid: ';
    gridSize = input(prompt2);

    prompt3 = 'Define the x value of your exit set: ';
    exit_set_x = input(prompt3);
    
    while exit_set_x <= 1 || exit_set_x >= gridSize
        prompt3 = 'Error: that value is on your boundary or not on your grid. Please redefine the x value of your exit set: ';
        exit_set_x = input(prompt3);
    end
    
    prompt4 = 'Define the y value of your exit set: ';
    exit_set_y = input(prompt4);
    
    while exit_set_y <= 1 || exit_set_y >= gridSize
        prompt4 = 'Error: that value is on your boundary or not on your grid. Please redefine the y value of your exit set: ';
        exit_set_y = input(prompt4);
    end
    
    V = inf(gridSize);          
    L = inf(gridSize);           
    Accepted = zeros(gridSize);  
    Updated = zeros(gridSize);   
    
    V(exit_set_x, exit_set_y) = 0;
    Q = V(exit_set_x, exit_set_y);
    
    %run on any size
    [Updated V] = createBarricades(Updated, V);
    
    prompt5 = '(1) Split domain or (2) constant domain: ';
    split_const = input(prompt5);
    
    if split_const == 1
        prompt6 = 'Enter F1 value: ';
        F1 = input(prompt6);
        
        prompt7 = 'Enter F2 value: ';
        F2 = input(prompt7);
        
        F = [F1 F2];
    else
        prompt8 = 'Enter F value: ';
        F_const = input(prompt8);
        
        F = [F_const F_const];
    end
    
elseif simulation_type == 3

    F = 1;
    gridSize = 40; 
    
    V = inf(gridSize);         
    L = inf(gridSize);            
    Accepted = zeros(gridSize);    
    Updated = zeros(gridSize);  
    
    V(2, 2) = 0;
    Q = V(2, 2);
    %run on 40 x 40
    [Updated V] = createSpiralBarricades(Updated, V);
    
    prompt8 = 'Enter F value: ';
        F_const = input(prompt8);
        
        F = [F_const F_const];
elseif simulation_type == 4

    gridSize = 50; 
    
    F = 1;
    V = inf(gridSize);          
    L = inf(gridSize);            
    Accepted = zeros(gridSize);    
    Updated = zeros(gridSize);  
    
    V(2, 2) = 0;
    Q = V(2, 2);
    
    %run on a 50 x 50
    [Updated V] = createMazeBarricades(Updated, V);
    
    prompt8 = 'Enter F value: ';
    F_const = input(prompt8);
        
    F = [F_const F_const];
else
   
    
    gridSize = 100;
    
    V = inf(gridSize);          
    L = inf(gridSize);             
    Accepted = zeros(gridSize);    
    Updated = zeros(gridSize);     
    
    %Set up exit set
    V(50, 50) = 0;
    Q = V(50, 50);
    
    prompt6 = 'Enter F1 value: ';
    F1 = input(prompt6);

    prompt7 = 'Enter F2 value: ';
    F2 = input(prompt7);
    
    F = [F1 F2];
    
end

%Step size
h = 0.1;

%Introduce running_time which keeps track of how long the algorithm runs
running_time = cputime;

%Introduce the exit set to the grid
for i=1:gridSize
    for j=1:gridSize
        if V(i, j) == Q
            V(i, j) = 0;
            Accepted(i, j) = 1;
        else
            V(i, j) = inf;
        end %if    
    end %for
end %for

%Initial march on the grid
for i=1:size(V)
    for j=1:size(V)
        %If V(i, j) ~= inf then it is part of the exit set so we want
        %to start there and propagate
        if V(i, j) ~= inf 
            %If V(i, j) ~= inf and the point (i, j) has been updated 
            %then we do not want to consider that point
            if V(i, j) ~= inf & Updated(i, j) == 1
                
            else
                %This means the neighbors of V(i, j) have not been 
                %updated yet
                L = neighbors(V, L, Updated, i, j);
            
                %Iterate through L to perform upwind discretization
                %on all neighbors of V(i, j) which are the points near the
                %exit set
                for k=1:size(L)
                    for m=1:size(L)
                        if L(k, m) ~= inf
                            
                            U = upwindDiscretization(V, k, m, h, F, simulation_type);

                            %If the temporary speed value is less than
                            %that of the current value update the 
                            %current value to the temporary one
                            if U < V(k, m)
                                V(k, m) = U;
                                L(k, m) = V(k, m); 
                                Updated (k, m) = 1;                    
                            end %if
                        end %if
                    end %for
                end %for
            end %if
        end %if       
    end %for
end %for

%---------------------------------------------------------------------
%End Initialization
%---------------------------------------------------------------------

%For the rest of the points, start with the smallest value and 
%propagate by looking at the neighbors of each point
while min(L(:)) ~= inf 
    
   %Get the index of the smallest point
   [minval, ind] = min(L(:)); 
   [I_curr, J_curr] = ind2sub([size(L)], ind);
   
   %Removes it from the Considered list by setting the value equal to 
   %infinity
   L(I_curr, J_curr) = inf;

   %This gets the value of each neighbor to the point (I_curr, J_curr)
   [U_E U_W U_N U_S] = computeNeighbors(I_curr, J_curr, V, h, F, simulation_type);
   
   %The following statements update the current neighbor against the 
   %temporary neighbor as long as it has not already been updated
   
   if U_E ~= Inf
        if U_E < V(I_curr + 1, J_curr) & Updated(I_curr + 1, J_curr) ~= 1
            V(I_curr + 1, J_curr) = U_E;
            L(I_curr + 1, J_curr) = V(I_curr + 1, J_curr);
            Updated(I_curr + 1, J_curr) = 1;
        end
   end
   
   if U_W ~= inf
        if U_W < V(I_curr - 1, J_curr) & Updated(I_curr - 1, J_curr) ~= 1
            V(I_curr - 1, J_curr) = U_W;
            L(I_curr - 1, J_curr) = V(I_curr - 1, J_curr);
            Updated(I_curr - 1, J_curr) = 1;
        end
   end
   
   if U_N ~= Inf
         if U_N < V(I_curr, J_curr - 1) & Updated(I_curr, J_curr - 1) ~= 1
            V(I_curr, J_curr - 1) = U_N;
            L(I_curr, J_curr - 1) = V(I_curr, J_curr - 1);
            Updated(I_curr, J_curr - 1) = 1;
       end
   end

   if U_S ~= inf
        if U_S < V(I_curr, J_curr + 1) & Updated(I_curr, J_curr + 1) ~= 1
            V(I_curr, J_curr + 1) = U_S;
            L(I_curr, J_curr + 1) = V(I_curr, J_curr + 1);
            Updated(I_curr, J_curr + 1) = 1;
       end
   end
end

running_time = cputime-running_time;

%The following code converts it to an rgb map to display
soln_copy = V;
ind = find(soln_copy == Inf);
soln_copy(ind) = 1;
maxval = max(soln_copy(:));
map = jet(128);
soln_copy = floor((soln_copy./maxval)*length(map));
soln_copy = ind2rgb(soln_copy, map);
[x, y] = ind2sub(size(soln_copy), ind);

for i = 1:length(x)
    soln_copy(x(i), y(i), :) = [0 0 0];
end

%Output
imagesc(soln_copy);
colorbar;