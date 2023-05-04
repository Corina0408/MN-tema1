function [Adj] = get_adjacency_matrix (Labyrinth)
  
  
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % TODO: get_adjacency_matrix implementation
  
 % Adj = sparse(size(Labyrinth));

 %n = size(Labyrinth, 1);
%nzmax = nnz(P); % count non-zero entries in P
%i = zeros(nzmax, 1);
%j = zeros(nzmax, 1);
%s = ones(nzmax, 1);
%idx = 1;
%for row = 1:n
 %   for col = 1:n
  %      prob1 = bitget(Labyrinth(row,col), 8:-1:5) * [8;4;2;1]' / 15; % extract upper 4 bits
   %     if prob1 > 0
    %        i(idx) = row;
     %       j(idx) = col;
      %      idx = idx + 1;
       % end
        %prob2 = bitget(Labyrinth(row,col), 4:-1:1) * [8;4;2;1]' / 15; % extract lower 4 bits
        %if prob2 > 0
            %i(idx) = row;
            %j(idx) = col;
            %idx = idx + 1;
        %end
    %end
%end
%Adj = sparse(i, j, s, n, n);

%end

%vezi sa o declari si pt marimea labirintului + 2 (win si lose)
[nrows, ncols] = size(Labyrinth);
Adj = sparse(nrows*ncols+2);

index = 1;

for i = 1:nrows   % iterate over rows
  for j = 1:ncols  % iterate over columns
    
    bit3 = bitget(Labyrinth(i,j), 4);   % extract the first bit B3 NORD
    bit2 = bitget(Labyrinth(i,j), 3);   % extract the second bit B2 SUD
    bit1 = bitget(Labyrinth(i,j), 2);   % extract the third bit B1 EST
    bit0 = bitget(Labyrinth(i,j), 1);   % extract the fourth bit B0 VEST
    
    if (i == 1 && bit3 == 0)
      %if (bit3 == 0)
        Adj(index, nrows*ncols + 1) = 1;
      
    else 
      if (bit3 == 0)
      Adj(index, index - ncols) = 1;
    endif
  endif
  %endif
    
    
    if (i == nrows && bit2 == 0)
      %if (bit2 == 0)
        Adj(index, nrows*ncols + 1) = 1;
    else 
      if (bit2 == 0)
        Adj(index, index + ncols) = 1;
    endif
   endif
  % endif
    
    if (j == ncols && bit1 == 0)
     % if (bit1 == 0)
        Adj(index, nrows*ncols +2) = 1;
  
    else 
      if (bit1 == 0)
        Adj(index, index + 1) = 1;
        Adj(index + 1, index) = 1;
      endif
        endif
        %endif
    
    if (j == 1 && bit0 == 0)
      %if (bit0 == 0)
        Adj(index, nrows*ncols + 2) = 1;
   
      else 
      if (bit0 == 0)
        Adj(index, index - 1) = 1;
    endif
     endif
     %endif
    
    index ++;
      
  endfor
endfor

%tratatrea separata a ultimelor 2 randuri din Adj, adica cele corespunzatoare WIN si LOSE 

Adj(nrows*ncols + 1, nrows*ncols + 1) = 1;
Adj(nrows*ncols + 2, nrows*ncols + 2) = 1;
Adj(1,1) = 0;


%traversare eficienta

%for k = 1:numel(C)  % iterate over each element in column-major order
 % disp(C(k));       % display the current element
%endfor


%alta traversare mai eficienta
% generate a vector of indices for each element in the matrix
%indices = 1:numel(A);
% use indexing to extract the values corresponding to each index
%values = A(indices);


  
endfunction
