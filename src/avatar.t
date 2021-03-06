unit
class Avatar
    %Cette classe controle le personnage du joueur(animation).
    inherit Mobile in "mobile.t"
    import constants in "constants.t", 
            SoundManager in "soundmanager.t"
            
    %---------------------------------------------------------------------------
    % Constructeur
    body procedure create(x:int, y:int)
        Mobile.create(x,y)
        speed := 8
        damage := 50
        health := 100
        score := 0
    end create

    %---------------------------------------------------------------------------
    % Destructeur
    body procedure destroy
    end destroy

    %---------------------------------------------------------------------------
    % Sert a augmenter le points de sante du joueur en utilisant une potion
    body procedure setScore(newScore : int)
        score := newScore
    end setScore

    %---------------------------------------------------------------------------
    % Place "avatar" a l'entre du "level"
    body procedure placeAvatar
        currentLevel -> moveAvatar( position, transitPosition )
    end placeAvatar
    
    %---------------------------------------------------------------------------
    % Animation du personnage en determinant la direction et l'etat de son mouvement.
    body function processInput( inputEvent : int ) : boolean
        case inputEvent of
            label 0,1,2,3 : moveInDirection( inputEvent ) 
                result true
            % Direction sur le clavier (AWSD)
            label 8 : action()
                result true
            %Utilisation du bouton "action"
            label 9 :
                result true
            %Utilisation du bouton "potion"
            label constants.DPadUp          : moveInDirection( constants.cNorth )
                result true
            label constants.DPadUpRight     : 
            label constants.DPadRight       : moveInDirection( constants.cEast )
                result true
            label constants.DPadDownRight   : 
            label constants.DPadDown        : moveInDirection( constants.cSouth )
                result true
            label constants.DPadDownLeft    : 
            label constants.DPadLeft        : moveInDirection( constants.cWest )
                result true
            label constants.DPadUpLeft      : 
            label constants.ButtonA         : currentLevel->avatarAttack()
                                            checkInteractableInDirection ()
                result true
            label constants.ButtonB         : currentLevel->gameMessage := "go to next level"
                result true
            label constants.ButtonX         :
                result true
            label :
                result false
        
        end case
        
        result false
    end processInput
    
    %---------------------------------------------------------------------------
    % Verifie si le joueur est sur une tuile du type "Trigger"
    body procedure checkTriggers
        currentLevel -> checkTriggers( position )
    end checkTriggers
    
    %---------------------------------------------------------------------------
    %
    body function attackInDirection() : ^ Tuple2i
        var targetTileX : int
        var targetTileY : int
        var tileX := position -> x div constants.cTilesize
        var tileY := position -> y div constants.cTilesize
            
        if isInsideLevel( tileX, tileY ) then
            result getTileInDirection( position )
        end if    
        result nil
    end attackInDirection
    
end Avatar