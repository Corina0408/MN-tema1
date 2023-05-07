function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  % TODO: parse_data_set_file implementation
  
  fid = fopen(file_path, 'r'); % open the file for reading
  
  % citeste si m si n

if (fid == -1)
  error('Failed to open file');
end

%line = fgets(fid); % read the first line of the file
m = fscanf(fid, "%d", 1);
n = fscanf(fid, "%d", 1);
c = fscanf(fid, "%c", 1);

InitialMatrix = cell(m, n); % initialize cell matrix to store the data

k = 1;
var = m;
line = fgets(fid);

while (var) % loop until end of file
  row = strsplit(line, ' '); % split the line at each comma
  %disp(row);
  for i = 1 : n + 1
    InitialMatrix{k,i} = row{i}; % add the row to the cell matrix
  endfor 
  line = fgets(fid); % read the next line
  k++;
  var--;
endwhile

Y = InitialMatrix(:,1);
Y = cell2mat(Y);
Y = str2num(Y);
InitialMatrix = InitialMatrix(:, 2:end);



% string to num pe toate elemenetele lui Y
% apoi il retin ca cell

fclose(fid); % close the file
  
endfunction