unit
%---------------------------------------------------------------------------
% Completement facultatif, ceci sert pour debugger le jeu
module ErrorHelper
    export displayError, printLevelData
    
    %---------------------------------------------------------------------------
    % Authors:  Richard Lalancette
    procedure displayError( errorToDisplay : string )
        var c : string
        put errorToDisplay
        get c% wait for user input.
    end displayError
    
    %---------------------------------------------------------------------------
    % Authors:  David Delisle-Lalancette
    procedure printLevelData (levelData : array 0 .. * of string)
        var c : char
        for k : 0 .. upper (levelData) - 1
            put levelData(k)
        end for 
        get c% wait for user input.
    end printLevelData
    
end ErrorHelper