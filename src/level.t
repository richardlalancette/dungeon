unit

%---------------------------------------------------------------------------
% Authors:  David Delisle-Lalancette, Richard Lalancette
% Cette class s'occupe de loader les tuiles, les objects(tresores, etc...) dans le niveau ou "level" que le joueur joue, 
% ainsi que les "monster" et le personnage du joueur, "Avatar".
class Level
    implement by LevelImpl in "levelimpl.t"
    
    import Layer in "layer.t", 
	    Trigger in "trigger.t",
	    MonsterObject in "monsterobject.t", 
        TilePropertyObject in "tilepropertyobject.t",
	    Tuple2i in "tuple2i.t",
        UIManager in "uimanager.t"
    
    export  create, destroy,
            loadLevel, 
            drawLevel,
            update,
            setUIManager,
            getWalkableLayer,
            getPickableLayer,
            getInteractableLayer,
            updateWalkableTile,
            isInsideLevel,
            cWallLayer,
            cFurnitureLayer,
            cWalkableLayer,
            cPickableLayer,
            cInteractableLayer,
            cInteractedLayer,
            spawnMonster,
            checkTriggers,
            getTilePropertyObject,
            moveAvatar,
            avatarAttack,
            processInput,
            getCameraPosition,
            isMobileAt,
            monsterAttack,
            getAvatarScore,
            getAvatarHealth,
            setAvatarScore,
            setAvatarHealth,
            var layers, 
            var gameMessage
            
    
    const cFloorLayer : int := 0
    const cWallLayer : int := 1
    const cFurnitureLayer : int := 2
    const cDecorationLayer : int := 3
    const cPickableLayer : int := 4
    const cInteractedLayer : int :=5
    const cInteractableLayer : int := 6
    const cWalkableLayer : int := 7
    const cUILayer : int := 8
    const cFirstLayer : int := 0
    const cLastLayer : int := 8
    
    var layers : array cFirstLayer .. cLastLayer of ^ Layer
    var gameMessage : string := ""
    
    %---------------------------------------------------------------------------
    % Procedures ont ete deplacee pour eviter des cas de dependances circulaires entre les classes
    deferred procedure create()
    deferred procedure destroy()
    deferred procedure spawnMonster( monsterObject : ^ MonsterObject )
    deferred procedure update()
    deferred function isInsideLevel( tileX : int, tileY : int ) : boolean
    deferred function createNewLevel( levelData : array 0 .. * of string ) : boolean
    deferred function prepareFloorLayer( levelData : array 0 .. * of string ) : boolean
    deferred function prepareWallLayer( levelData : array 0 .. * of string ) : boolean
    deferred function prepareFurnitureLayer( levelData : array 0 .. * of string ) : boolean
    deferred function prepareDecorationLayer( levelData : array 0 .. * of string ) : boolean
    deferred function preparePickableLayer( levelData : array 0 .. * of string ) : boolean
    deferred function prepareInteractedLayer( levelData : array 0 .. * of string ) : boolean
    deferred function prepareInteractableLayer( levelData : array 0 .. * of string ) : boolean
    deferred function prepareUILayer( levelData : array 0 .. * of string ) : boolean
    deferred function prepareMonsterGroup( levelData : array 0 .. * of string ) : boolean
    deferred function prepareTriggerGroup( levelData : array 0 .. * of string) : boolean
    deferred function prepareTileProperties( levelData : array 0 .. * of string ) : boolean
    deferred procedure updateWalkableLayer
    deferred procedure updateWalkableTile (targetTileX : int , targetTileY : int )
    deferred function prepareLevel( levelData : array 0 .. * of string ) : boolean
    deferred function loadLevel( tilesetName: string, level : string ) : boolean
    deferred procedure drawLevel() 
    deferred function getWalkableLayer() : ^ Layer
    deferred function getPickableLayer() : ^ Layer
    deferred function getInteractableLayer() : ^ Layer
    deferred procedure checkTriggers( position : ^ Tuple2i )
    deferred function getTilePropertyObject( id : int ) : ^TilePropertyObject
    deferred procedure moveAvatar( position : ^ Tuple2i, transitPosition : ^ Tuple2i )        
    deferred procedure setUIManager( newUIManager : ^ UIManager )
    deferred procedure avatarAttack()
    deferred procedure monsterAttack()
    deferred function getCameraPosition() : ^ Tuple2i
    deferred function processInput( inputEvent : int ) : boolean
    deferred function isMobileAt( dx:int, dy:int ) : boolean
    deferred function getAvatarScore() : int
    deferred function getAvatarHealth() : int
    deferred procedure setAvatarScore(newAvatarScore: int)
    deferred procedure setAvatarHealth(newAvatarHealth: int) 

end Level
