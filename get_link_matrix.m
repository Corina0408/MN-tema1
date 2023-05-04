function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  % TODO: get_link_matrix implementation
  
  [nrows, ncols] = size(Labyrinth);
Link = sparse(nrows*ncols+2);

index = 1;
p = 1;

for i = 1:nrows   % iterate over rows
  for j = 1:ncols  % iterate over columns
    
    possibilities = 0;
    
    bit3 = bitget(Labyrinth(i,j), 4);   % extract the first bit B3 NORD
    if (bit3 == 0)
      possibilities ++;
    endif
    
    bit2 = bitget(Labyrinth(i,j), 3);   % extract the second bit B2 SUD
     if (bit2 == 0)
      possibilities ++;
    endif
    
    bit1 = bitget(Labyrinth(i,j), 2);   % extract the third bit B1 EST
     if (bit1 == 0)
      possibilities ++;
    endif
    
    bit0 = bitget(Labyrinth(i,j), 1);   % extract the fourth bit B0 VEST
     if (bit0 == 0)
      possibilities ++;
    endif
    
    if (i == 1 && bit3 == 0)
      %if (bit3 == 0)
        Link(index, nrows*ncols + 1) = p/possibilities;
      
    else 
      if (bit3 == 0)
      Link(index, index - ncols) = p/possibilities;
    endif
  endif
  %endif
    
    
    if (i == nrows && bit2 == 0)
      %if (bit2 == 0)
        Link(index, nrows*ncols + 1) = p/possibilities;
    else 
      if (bit2 == 0)
        Link(index, index + ncols) = p/possibilities;
    endif
   endif
  % endif
    
    if (j == ncols && bit1 == 0)
     % if (bit1 == 0)
        Link(index, nrows*ncols +2) = p/possibilities;
  
    else 
      if (bit1 == 0)
        Link(index, index + 1) = p/possibilities;
        Link(index + 1, index) = p/possibilities;
      endif
        endif
        %endif
    
    if (j == 1 && bit0 == 0)
      %if (bit0 == 0)
        Link(index, nrows*ncols + 2) = p/possibilities;
   
      else 
      if (bit0 == 0)
        Link(index, index - 1) = p/possibilities;
    endif
     endif
     %endif
    
    index ++;
      
  endfor
endfor

%tratatrea separata a ultimelor 2 randuri din Link, adica cele corespunzatoare WIN si LOSE 

Link(nrows*ncols + 1, nrows*ncols + 1) = 1;
Link(nrows*ncols + 2, nrows*ncols + 2) = 1;
Link(1,1) = 0;
  
endfunction
