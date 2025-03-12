function coded = caesar(array, shift)

% Caesar's cypher is the simplest encryption algorithm. It adds a fixed 
% value to the ASCII (unicode) value of each character of a text. In other 
% words, it shifts the characters. Decrypting a text is simply shifting it
% back by the same amount, that is, it substracts the same value from the 
% characters. Write a function called caesar that accepts two arguments: 
% the first is the character vector to be encrypted, while  the second is 
% the shift amount. The function returns the output argument coded, the 
% encrypted text. The function needs to work with all the visible ASCII 
% characters from space to ~. The ASCII codes of these are 32 through 126.
% If the shifted code goes outside of this range, it should wrap around. 
% For example, if we shift ~ by 1, the result should be space. If we shift 
% space by -1, the result should be ~. Here are a few things you may want 
% to try with MATLAB before starting on this assignment:


    % The ASCII codes boundary is 31 through 126
        lowerLimit = 31;
        upperLimit = 126;
        span = upperLimit - lowerLimit;
        shift = shift - span * fix(shift/span);
        ASCII_values = double((array)) + shift;

        for ii = 1:length(ASCII_values)
            if ((ASCII_values(ii)) < 32)            %If ASCII value goes below 32
                ASCII_values(ii) = ASCII_values(ii) + span;   
            elseif (ASCII_values(ii)) > upperLimit  %If ASCII value goes beyond 126 
                ASCII_values(ii) = ASCII_values(ii) - span;
            end 
        end
        coded = char(ASCII_values);
end
