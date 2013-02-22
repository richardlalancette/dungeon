unit

%---------------------------------------------------------------------------
% Author: Richard Lalancette

class TilePropertyObject
    export  create, destroy,
            getName, setName, 
            getObjectType, setObjectType, 
            getFirstCell, setFirstCell, 
            getSheet, setSheet,
            toString
    
    var mName : string := ""
    var mObjectType : string := ""
    var mFirstCell : string := ""
    var mSheet : string := ""

    %---------------------------------------------------------------------------
    % Constructeur
    procedure create()
    end create
    
    %---------------------------------------------------------------------------
    % Destructeur
    procedure destroy()
    end destroy
    
    %---------------------------------------------------------------------------
    % Cherche et distribue le nom de "Object"
    function getName() : string
        result mName
    end getName
    
    procedure setName( name : string)
        mName := name
    end setName
    
    %---------------------------------------------------------------------------
    % Cherche et distribue le type de "Object"
    function getObjectType() : string
        result mObjectType
    end getObjectType
    
    procedure setObjectType( objectType : string)
        mObjectType := objectType
    end setObjectType

    %---------------------------------------------------------------------------
    % Cherche et distribue la premiere image d'un "Sprite Sheet" 
    function getFirstCell() : string
        result mFirstCell
    end getFirstCell
    
    procedure setFirstCell( firstCell : string)
        mFirstCell := firstCell
    end setFirstCell

    %---------------------------------------------------------------------------
    % Cherche et distribue des "Sprite Sheet"
    function getSheet() : string
        result mSheet
    end getSheet
    
    procedure setSheet( sheet : string)
        mSheet := sheet
    end setSheet
    
    %---------------------------------------------------------------------------
    % Rapport l'information du "Object" (Fonction DEBUG)
    function toString() : string
        result "(" + mName + "," + mObjectType + "," + mFirstCell + "," + mSheet + ")"
    end toString
    
end TilePropertyObject