function charnum = char_counter(fname, character)

    fid = fopen(fname,'rt');
    if fid < 0
        charnum = -1;
        return;
    elseif ischar(character)==0
        charnum = -1;
        return;
    end

    count = 0; 
    charnum = 0;
    fprintf("\n");
    % Read file as a string
    oneline = fgets(fid);
    
        while ischar(oneline)
            tmp = char(oneline);
            for ii = 1: length(tmp)
                if tmp(ii) == character
                    count = count + 1;
                    % count the number of selected char in the string
                    charnum =sum(count);
                end
            end
            % fgets is called repeatedly in the body of the loop. Without our telling 
            % it to do so, fgets skips to the next line of the file each time we call it,
            % moving line-by-line through the file putting the most recent line read into
            % oneline. at the end of file, it returns the number -1
            oneline = fgets(fid);
        end
    
end