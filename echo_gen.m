function output = echo_gen(input, fs, delay, amp)

    %number_of_samples = length(input);

    % fs is the sampling rate. The sampling rate specifies how many samples we have in the data each second 
    % Therefore, fs = 1/T    
    % To get the delay, multiply delay(sec) * fs
    delay_time = round(delay*fs);               % converts double to an integer
    % For the echo add zero padding before the input
    padding = zeros(delay_time, 1);             % column vector

    echo_Signal = [padding; input].*amp;        % multiply echo by amplitude
    
    % % Need to also pad input so both arrays input and echo lengths match
    input_Padded = [input;  padding];
    
    % check to see if both arrays are the same legnth
    % length(padded_input)==length(echo)
     
    assembled_Signal = input_Padded + echo_Signal;      
    % Scale if amplitude is above 1
        if (max(abs(assembled_Signal)) > 1)
            assembled_Signal = assembled_Signal./max(abs(assembled_Signal)); % this scales the output if amp is above 1
        end
    output =  assembled_Signal;
end