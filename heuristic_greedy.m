function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  
  % TODO: heuristic_greedy implementation
  
  visited = sparse(1, size(Adj, 1));
   path = [start_position];
  visited(start_position) = 1;
  %numel(path)
  idx = path(end);
  while idx
    position = path(end);
    %trebuie sa mai schimb size(visited, 2) - 1 cu ceva
    if (position == size(visited, 2) - 1)
      %path = path';
      return;
    endif
    unvisited_neighbours = find(Adj(position,:) & !visited);
    % !numel(unvisited_neighbours)
    if (!size(unvisited_neighbours))
      path = path(1:end-1);
      %idx --;
    else
      [max_pos, max_prob_neigh] = max(probabilities(unvisited_neighbours));
      neighbours = unvisited_neighbours(max_prob_neigh);
      visited(neighbours) = 1;
      path = [path, neighbours];
  endif
  %idx --;
  idx = path(end);
endwhile
  

endfunction
