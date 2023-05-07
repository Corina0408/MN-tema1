function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> number of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

  path(end) = [];  %pt a nu lua pozitia de WIN de la sfarsit
  row = ceil(path / cols);
    col = mod(path - 1, cols) + 1;
    decoded_path = [row', col'];
    %decoded_path(end,:) = []; 
   

endfunction