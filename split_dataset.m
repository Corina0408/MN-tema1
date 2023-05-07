function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % TODO: split_dataset implementation
  
  k = size(X, 1);
  %randperm foloseam initial
  permutari = randperm(k);
  % _train
  tr = k*percent;
  %disp(percent);
  %disp(tr);
  
  %tr_index = perm(1:tr);
  
  %X_train = size(k*percent, 1);
  row = permutari(1:tr);
  X_train = X(row, :);
  y_train = y(row);
  
  %_test
  
  ts = k - tr;  % cu + 1 trece doar testul 1
  
  %ts_index = perm(ts:k);
  rows_2 = permutari(tr + 1 : k);
  %X_test = size(k - k*percent);
  X_test = X(rows_2, :);
  y_test = y(rows_2);
  
endfunction
