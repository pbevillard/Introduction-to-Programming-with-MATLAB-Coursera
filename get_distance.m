function distance = get_distance(input_a,input_b)
    format compact
    distance = 0;
    filename = 'Distances.xlsx';
    [~,~,raw] = xlsread(filename, 'Sheet1');
     
    % Compare user input string with entries in the Excel sheet
    p_input_a = strcmpi(input_a, raw(1,:));
    p_input_b = strcmpi(input_b, raw(:,1));
    rowNum = find(p_input_a ==1);
    colNum = find(p_input_b ==1);
    
     if isempty(cell2mat(raw(rowNum, colNum)))  
         % An empty cell indicates a non-existant city. 
         % Therefore return a '-1'
         distance = -1;
         return
     else
         distance  = cell2mat(raw(rowNum, colNum));
     end
end