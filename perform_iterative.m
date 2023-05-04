function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

   % TODO: perform_iterative implementation
   
   steps = 1;
   
   x = G * x0 + c;
   
   %calculeaza eroarea
   k = x - x0;
   err = norm(k);
   %disp(err);
   
   aux = x;
   
   while (steps <= max_steps && err >= tol)
     
      x = G * aux + c;
      %calculeaza eroarea
      k = x - aux;
      err = norm(k);
      
      aux = x;
      steps ++;
      
     endwhile
     
      
   
endfunction
