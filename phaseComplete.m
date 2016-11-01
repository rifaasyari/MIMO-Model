function [  ] = phaseComplete( pause_require, phase_name )
% 
%
    if pause_require
        fprintf('%s complete, press any key continue...\n',phase_name);
        pause;
    else
        fprintf('%s complete\n',phase_name);
    end
end

