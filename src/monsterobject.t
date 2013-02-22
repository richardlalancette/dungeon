unit

%---------------------------------------------------------------------------
% Author: Richard Lalancette
class MonsterObject
    export  create, destroy,
            getGid, setGid,
            getName, setName,
            getObjectType, setObjectType,
            getX, getY, setX, setY, toString
    
    var mName : string := "no name"
    var mObjectType : string := "no type"
    var mGid : int := 0
    var mX : int := 0
    var mY : int := 0

    %---------------------------------------------------------------------------
    % Constructeur
    procedure create(name:string, objectType: string, gid : int, x:int, y:int)
        mName := name
        mObjectType := objectType
        mGid := gid
        mX := x
        mY := y
    end create
    
    %---------------------------------------------------------------------------
    % Destructeur
    procedure destroy()
    end destroy
    
    %---------------------------------------------------------------------------
    function getGid() : int
        result mGid
    end getGid
    
    procedure setGid( gid : int)
        mGid := gid
    end setGid
    
    %---------------------------------------------------------------------------
    % Cherche et distribue le nom du monstre
    function getName() : string
        result mName
    end getName
    
    procedure setName( name : string)
        mName := name
    end setName
    
    %---------------------------------------------------------------------------
    % Cherche et distribue le type du monstre
    function getObjectType() : string
        result mObjectType
    end getObjectType
    
    procedure setObjectType( objectType : string)
        mObjectType := objectType
    end setObjectType
    
    %---------------------------------------------------------------------------
    % Cherche et distribue la coordonee en X du monstre
    function getX() : int
        result mX
    end getX
    
    procedure setX( x : int)
        mX := x
    end setX
    
    %---------------------------------------------------------------------------
    % Cherche et distribue la coordonee en Y du monstre
    function getY() : int
        result mY
    end getY
    
    procedure setY( y : int)
        mY := y
    end setY
    
    %---------------------------------------------------------------------------
    % Rapport l'information du "Object" (Fonction DEBUG)
    function toString() : string
        result "(" + mName + "," + mObjectType + "," + intstr(mGid) + "," + intstr(mX) + "," + intstr(mY) + ")"
    end toString
    
end MonsterObject