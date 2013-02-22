unit

%---------------------------------------------------------------------------
% Authors: David Delisle Lalancette, Richard Lalancette
% Stocke des images 3x4 pour les "sprites" pour l'avatar, les bestioles et les monstres, etc...
module SpriteSheetManager

    import constants in "constants.t", SpriteSheet in "spritesheet.t", TilePropertyObject in "tilepropertyobject.t"
    
    export  create, destroy, loadSpriteSheet, loadSpriteSheetGid, getSpriteSheet, loadTilesetFromXY,
            cSheetCharacter1, cSheetCharacter2, cSheetCharacter3, cSheetCharacter4, 
            cSheetCharacter5, cSheetCharacter6, cSheetCharacter7, cSheetCharacter8,
            monsterGolem,
            monsterFireGolem,
            monsterIronGolem,
            monsterTentacles,
            monsterImp,
            monsterFireImp,
            monsterHoodedShadow,
            monsterHoodedAssassin,
            monsterArmoredSkeleton,
            monsterArmoredSoldier,
            monsterMaskedUndead,
            monsterTurbanSoldier,
            monsterOrderSoldier,
            monsterOrcAssassin,
            monsterOrcShaman,
            monsterVampire,
            monsterBrownSoldier,
            monsterBlueSoldier,
            monsterBlondHairGuy,
            monsterRedHairGuy,
            monsterShadowSoldier,
            monsterArmoredWraith,
            monsterUndeadSolider1,
            monsterUndeadSoldier2,
            var tileset
    
    const cSheetCharacter1 := 1
    const cSheetCharacter2 := 4
    const cSheetCharacter3 := 7
    const cSheetCharacter4 := 10
    const cSheetCharacter5 := 49
    const cSheetCharacter6 := 52
    const cSheetCharacter7 := 55
    const cSheetCharacter8 := 58
    
    % Les monstres peuvent etre crees sans utilisee de "level"
    const monsterGolem           := 404
    const monsterFireGolem       := 405
    const monsterIronGolem       := 406
    const monsterTentacles       := 407

    const monsterImp             := 408
    const monsterFireImp         := 409
    const monsterHoodedShadow    := 410
    const monsterHoodedAssassin  := 411

    const monsterArmoredSkeleton := 412
    const monsterArmoredSoldier  := 413
    const monsterMaskedUndead    := 414
    const monsterTurbanSoldier   := 415

    const monsterOrderSoldier    := 436
    const monsterOrcAssassin     := 437
    const monsterOrcShaman       := 438
    const monsterVampire         := 439

    const monsterBrownSoldier    := 440
    const monsterBlueSoldier     := 441
    const monsterBlondHairGuy    := 442
    const monsterRedHairGuy      := 443

    const monsterShadowSoldier   := 444
    const monsterArmoredWraith   := 445
    const monsterUndeadSolider1  := 446
    const monsterUndeadSoldier2  := 447

    var sheets : array 0 .. constants.cMaxSpriteSheets of ^ SpriteSheet
    var tileset : array 0 .. 639 of int
    var currentTilesetName : string := ""
    
    %---------------------------------------------------------------------------
    % Author:  Richard Lalancette
    % Initialise les cases pour les images des personnages a zero
    procedure create()
        for i : 0 .. constants.cMaxSpriteSheets 
            sheets(i) := nil
        end for
    end create
    
    %---------------------------------------------------------------------------
    % Author:  Richard Lalancette
    % Vide les cases des images
    procedure destroy()
        for i : 0 .. constants.cMaxSpriteSheets
            if( sheets(i) not= nil ) then
                sheets(i) -> destroy()
                free SpriteSheet, sheets(i)
            end if
        end for
    end destroy
    
    %---------------------------------------------------------------------------
    % Author:  Richard Lalancette
    % Stocke les "Sprite Sheets" (toutes les images utilisees par un meme monstre ou avatar) dans un tableau
    procedure add( newSpriteSheet : ^ SpriteSheet )
        for i : 0 .. constants.cMaxSpriteSheets 
            if( sheets(i) = nil ) then
                sheets(i) := newSpriteSheet
                return
            end if
        end for
    end add
    
    %---------------------------------------------------------------------------
    % Author:  Richard Lalancette
    % Va chercher les images appropriees base sur un identifiant lui etant donne
    function getSpriteSheet( spriteSheetId : string ) : ^ SpriteSheet
        for i : 0 .. constants.cMaxSpriteSheets 
            if( sheets(i) not= nil ) then
                if sheets(i) -> getSheetId() = spriteSheetId then
                    result sheets(i)
                end if
            end if
        end for
        result nil
    end getSpriteSheet

    %---------------------------------------------------------------------------
    % Author: David Delisle-Lalancette
    % Va chercher les positions(images) des objets mobiles et les place dans un tableau
    procedure loadSprites (spriteSheet: ^ SpriteSheet, spriteSheetName : string, spriteFirstFrame : int)
        var frame : int := 0
        var column : int := 0
        var spriteFrame : int := 0
        var path : string := ""
        var subPath : string := ""
        
        if( spriteSheetName(1) = "m" ) then
            subPath := "monsters"
        elsif ( spriteSheetName(1) = "a" ) then
            subPath := "animals"
        end if
        
        for rows : 0 .. 3
            for columns: 0 .. 2
                spriteFrame := spriteFirstFrame + columns + rows * 12
                if spriteFrame < 10 then
                    path := "../res/characters/"+subPath+"/" + spriteSheetName + "_0" + intstr(spriteFrame) + ".bmp"
                else
                    path := "../res/characters/"+subPath+"/" + spriteSheetName + "_" + intstr(spriteFrame) + ".bmp"
                end if
                spriteSheet->sprites(frame) := Pic.FileNew (path)
                Pic.SetTransparentColour ( spriteSheet->sprites(frame), brightgreen)
                frame := frame + 1
            end for
        end for  
    end loadSprites

    %---------------------------------------------------------------------------
    % Authors:  Richard Lalancette
    % Indentifie les "Sprites Sheets" necessaires et les passe a la methode qui les charge dans un tableau 
    function loadSpriteSheet( spriteSheetName : string, spriteFirstFrame : int ) : ^ SpriteSheet
        var spriteSheetId : string := spriteSheetName + "_" + intstr(spriteFirstFrame)
        var newSpriteSheet : ^ SpriteSheet
        
        newSpriteSheet := getSpriteSheet( spriteSheetId )
        
        % Cree une nouvelle "Sprite Sheet" si elle n'a pas deja ete cree
        if( newSpriteSheet = nil ) then
            new SpriteSheet, newSpriteSheet
            newSpriteSheet -> create(spriteSheetId)
            add( newSpriteSheet )
            loadSprites( newSpriteSheet, spriteSheetName, spriteFirstFrame )
        end if
        
        result newSpriteSheet
    end loadSpriteSheet
    
    %---------------------------------------------------------------------------
    % Authors:  Richard Lalancette
    % Va chercher le premier ficher du "Sprite Sheet"
    function loadSpriteSheetGid( gid : int, tileProperty:^TilePropertyObject ) : ^ SpriteSheet
        result loadSpriteSheet( tileProperty->getSheet(), strint( tileProperty->getFirstCell() ) )
    end loadSpriteSheetGid
    
    %---------------------------------------------------------------------------
    % Authors:  David Delisle-Lalancette
    % Vide le "Tileset"
    procedure unloadTileset
        for i : 0..upper( tileset ) 
            if( tileset(i) > 0 ) then
                Pic.Free ( tileset(i) )
                tileset(i) := 0
            end if
        end for
    end unloadTileset

    %---------------------------------------------------------------------------
    % Authors:  David Delisle-Lalancette
    % Charge les images du "Tileset"
    procedure loadTilesetFromXY ( tilesetName : string )
        % Charge seulement le "Tileset" si necessaire
        if( currentTilesetName not= tilesetName ) then
            if( currentTilesetName not= "" ) then
                unloadTileset()
                currentTilesetName := ""
            end if
            
            %Ceci va chercher les tuiles(images) et les place dans un tableau
            var tile : int := 0
        
            for row : 0..19
                for column: 0..31
                    tileset(tile) := Pic.FileNew ("../res/tilesets/" + tilesetName + "/" + tilesetName + "_" + intstr(row) + "_" + intstr(column) + ".bmp")
                    Pic.SetTransparentColour (tileset(tile), brightgreen)
                    tile := tile + 1
                end for
            end for
            currentTilesetName := tilesetName
        end if
    end loadTilesetFromXY
    
end SpriteSheetManager
