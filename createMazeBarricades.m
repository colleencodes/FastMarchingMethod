%This function allows barricades to be set up to create a maze
function [U, V] = createMazeBarricades(U, V)

    %Run on 50 x 50

    for j = 1
        for i=1:size(U)
            U(i, j) = 1;
        end
    end

    for j = size(U)
        for i=1:size(U)
            U(i, j) = 1;
        end
    end

    for i = 1
        for j=1:size(U)
            U(i, j) = 1;
        end
    end

    for i = size(U)
        for j=1:size(U)
            U(i, j) = 1;
        end
    end

    for j = 6
        for i=26:51
            U(i, j) = 1;
        end
    end
    
    for j = 11
        for i=1:11
            U(i, j) = 1;
        end
    end
    
    for j = 11
        for i=16:36
            U(i, j) = 1;
        end
    end
    
    for i = 11
        for j=11:24
        U(i, j) = 1;
        end
    end
    
    for i = 16
        for j=11:24
        U(i, j) = 1;
        end
    end
    
    for i = 36
        for j = 11:16
        U(i, j) = 1;
        end
    end
    
    for j = 16
        for i = 26:36
            U(i, j) = 1;
        end
    end
    
    for j = 21
        for i = 11:16
            U(i, j) = 1;
        end
    end
    
    for j = 21
        for i = 26:46
            U(i, j) = 1;
        end
    end
    
    for i = 46
        for j=21:26
U(i, j) = 1;
        end
    end
    
    for j = 26
        for i = 16:46
            U(i, j) = 1;
        end
    end
    
    for i =11
        for j=31:46
            U(i, j) = 1;
        end
    end
    
    for i=16
        for j=31:41
        U(i, j) = 1;
        end
    end
    
    for i=21
        for j=31:36
            U(i, j) = 1;
        end
    end
    
    for j=36
        for i=21:31
            U(i, j) = 1;
        end
    end
    
    for j=36
        for i=36:51
        U(i, j) = 1;
        end
    end
    
    for i=36
        for j=36:46
        U(i, j) = 1;
        end
    end
    
    for j=41
        for i=16:26
        U(i, j) = 1;
        end
    end
    
    for i=31
        for j=36:46
        U(i, j) = 1;
        end
    end
    
    for i=36
        for j=41:46
        U(i, j) = 1;
        end
    end
    
    for j=46
        for i=1:31
        U(i, j) = 1;
        end
    end
    
    for j=46
        for i=36:51
        U(i, j) = 1;
        end
    end
end

