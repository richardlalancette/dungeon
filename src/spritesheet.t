unit

%---------------------------------------------------------------------------
% Author: Richard Lalancette
% Contient l'information pour un "Sprite Sheet"
class SpriteSheet
    import constants in "constants.t"
    export create, destroy, getSheetId, setSheetId, var sprites
    
    var sheetId : string := ""
    var sprites : array 0 .. 11 of int

    %---------------------------------------------------------------------------
    % Constructeur
    procedure create(newSheetId:string)
        sheetId := newSheetId
        for i : 0 .. 11
            sprites(i) := 0
        end for
    end create

    %---------------------------------------------------------------------------
    % Destructeur
    procedure destroy()
        for i : 0 .. 11 
            if( sprites(i) > 0 ) then
                Pic.Free( sprites(i) )
            end if
        end for
    end destroy
    
    %---------------------------------------------------------------------------
    % Cherche et distribue l'identifiant du "Sprite Sheet"
    function getSheetId() : string
        result sheetId
    end getSheetId
    
    procedure setSheetId( newSheetId : string)
        sheetId := newSheetId
    end setSheetId
    
end SpriteSheet