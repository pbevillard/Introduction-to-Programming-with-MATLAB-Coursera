function valid = valid_date(year, month, day)

    % 1st, Check to see if all three inputs are a positive integer scalar, otherwise return false
    if ((~isscalar(year))  || (~isscalar(month)) || (~isscalar(day)) || ...
        (year < 1)  || (month < 1) || (day < 1 ) || ...
        (year ~= fix(year))  || (month ~= fix(month)) || (day ~= fix(day)))
            valid = false;

    else % If 1st check pases, next check the months and days   
        % Months that have 30 days: April(4), June(6), September(9), November(11) 
        % Evey other month is 31 with the exception of February, which has 28 days except during leap year which is 29
        if ((month == 4 || month == 6 || month == 9 || month == 11) && (day <= 30)) ||...
            ((month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) && (day <= 31))
                valid = true;  

        elseif (month == 2) && (day <= 29)      % If the month is February and days are less than 30
            % Check for leap year
            if (mod(year, 4) == 0) && (mod(year, 100) ~= 0)
                is_a_leap_year = true;
            elseif (mod(year, 4) == 0) && (mod(year, 100) == 0)
                if (mod(year, 400) == 0), is_a_leap_year = true;
                else, is_a_leap_year = false;
                end
            else, is_a_leap_year = false;
            end

            if (~is_a_leap_year && day > 28), valid = false;
            else, valid = true;
            end          
        else,  valid = false;
        end
    end
