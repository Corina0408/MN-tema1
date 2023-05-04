function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  % TODO: get_Jacobi_parameters
  
[nrows, ncols] = size(Link);
G = sparse(nrows*ncols);

index = 1;

for i = 1:nrows-2   % iterate over rows
  for j = 1:ncols-2  % iterate over columns
    
    G(i, j) = Link(i, j);
      
  endfor
endfor

G(1,1) = 0;

%for i = 1:nrows-2
 % c(i) = Link(i, ncols - 1);
  %endfor
 
 c = Link(1 : nrows - 2, ncols - 1);

endfunction
