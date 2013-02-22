unit

%---------------------------------------------------------------------------
% Author: Richard Lalancette
% S'occupe de trouver et de donne a d'autres functions les tuiles du "level" de type "trigger", comme les escaliers
class Trigger
    export  create, destroy,
            getGid, setGid,
            getX, getY, setX, setY,
            getType
    
    var mGid : int := 0
    var mX : int := 0
    var mY : int := 0
    var mType : string := "" 
    %---------------------------------------------------------------------------
    % Constructeur
    procedure create(gid : int, x : int, y : int, triggerType : string )
        mGid := gid
        mX := x
        mY := y
        mType := triggerType
    end create
    
    %---------------------------------------------------------------------------
    % Destructeur
    procedure destroy()
    end destroy
    
    %---------------------------------------------------------------------------
    % Cherche et distribue l'identifiant du "trigger"
    function getGid() : int
        result mGid
    end getGid
    %-----------------------------
    procedure setGid( gid : int)
        mGid := gid
    end setGid
    %-----------------------------
    % Cherche et distribue la coordonnee en X du "trigger"
    function getX() : int
        result mX
    end getX
    %-----------------------------
    procedure setX( x : int)
        mX := x
    end setX
    %-----------------------------
    % Cherche et distribue la coordonnee en Y du "trigger"
    function getY() : int
        result mY
    end getY
    %-----------------------------
    procedure setY( y : int)
        mY := y
    end setY
    %-----------------------------
    % Cherche et distribue le type du "trigger"
    function getType() : string
        result mType
    end getType
    
end Trigger