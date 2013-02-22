unit

%---------------------------------------------------------------------------
% S'occupe des entree, clavier ou manette
% Note: Le niveau est maintenant responsable du dispatch des inputs.
class GameControlInput
    import  joystick in "joystick.tu", 
            constants in "constants.t",
            Level in "level.t"
    
    export  create, destroy,
            processInput, initJoystick 
    
    %---------------------------------------------------------------------------
    type joypad : % Cree un type: Joypad
    record
        button : array 1 .. 32 of boolean   % Cree 32 instances de boutons
        pos : joystick.PosRecord            % Utilisee pour trouver tout les entrees joypad avec  l'exception des boutons
        caps : joystick.CapsRecord          % Utilisee pour trouver le maximum sur l'analog du joypad
                                            
    end record

    var joy : array 0 .. 1 of joypad        % Cree un tableau joypad
    
    %---------------------------------------------------------------------------
    % Constructeur
    procedure create
    end create

    %---------------------------------------------------------------------------
    % Destructeur
    procedure destroy
    end destroy
    
    %---------------------------------------------------------------------------
    % Initialisation des valeures par defaut
    procedure initJoystick
        for i : 1 .. upper (joy)
            for ii : 1 .. upper (joy (i).button)
                joy (i).button (ii) := false
            end for
            joy (i).pos.POV := 66535
            joystick.Capabilities (i - 1, joy (i).caps)
        end for    
    end initJoystick
    
    %---------------------------------------------------------------------------
    % Verifie si une manette est branchee et lis l'information qui-y-provien
    function processJoystick( jNum : int ) : boolean
        if( joystick.isPlugged(jNum) ) then
            joystick.GetInfo (jNum, joy (jNum).button)
            joystick.Read (jNum, joy (jNum).pos)
            result true
        end if
        result false
    end processJoystick

    %---------------------------------------------------------------------------
    % Se sert de toutes les donnees produite par les peripheriques d'entrees
    % Auteurs : Richard Lalancette
    %           David Delisle-Lalancette
    %           
    function processInput ( level : ^ Level ) : boolean
        var pressedKeys : array char of boolean
        
        /*% Manette par port parallel
        var c : char
        if parallelget = 120 then
            if parallelget = constants.parallelUp then
            get c
                result level -> processInput( constants.DPadUp )
                %Indique vers le haut.
            elsif parallelget = constants.parallelDown then
                result level -> processInput( constants.DPadDown )
                %Indique vers le bas.
            elsif parallelget = constants.parallelRight then
                result level -> processInput( constants.DPadRight )
                %Indique vers la droite.
            elsif parallelget = constants.parallelLeft then
                result level -> processInput( constants.DPadLeft )
                %Indique vers la gauche.
            elsif parallelget = constants.parallelButton then
                result level -> processInput( constants.ButtonA )
                % Button
            end if
        end if
        %*/
            % Joystick
        if( processJoystick(0) ) then
            if joy(0).pos.POV = 0 then
                result level -> processInput( constants.DPadUp )
            elsif joy(0).pos.POV = 4500 then
                result level -> processInput( constants.DPadUpRight )
            elsif joy(0).pos.POV = 9000 then
                result level -> processInput( constants.DPadRight )
            elsif joy(0).pos.POV = 13500 then
                result level -> processInput( constants.DPadDownRight )
            elsif joy(0).pos.POV = 18000 then
                result level -> processInput( constants.DPadDown )
            elsif joy(0).pos.POV = 22500 then
                result level -> processInput( constants.DPadDownLeft )
            elsif joy(0).pos.POV = 27000 then
                result level -> processInput( constants.DPadLeft )
            elsif joy(0).pos.POV = 31500 then
                result level -> processInput( constants.DPadUpLeft )
            end if
            
            if joy(0).button(1) then
                result level -> processInput( constants.ButtonA )
            end if
            if joy(0).button(2) then
                result level -> processInput( constants.ButtonB )
            end if
            if joy(0).button(3) then
                result level -> processInput( constants.ButtonX )
            end if
            if joy(0).button(4) then
                result level -> processInput( constants.ButtonY )
            end if
        end if
        
    %---------------------------------------------------------------------------
    % Clavier
        Input.KeyDown (pressedKeys)

        if pressedKeys ('w') then 
        %Indique vers le haut.
            result level -> processInput( constants.cNorth )
        elsif pressedKeys ('s') then 
        %Indique vers le bas.
            result level -> processInput( constants.cSouth )
        elsif pressedKeys ('a') then 
        %Indique vers la gauche.
            result level -> processInput( constants.cWest )
        elsif pressedKeys ('d') then 
        %Indique vers la droite.
            result level -> processInput( constants.cEast )
        elsif pressedKeys ('e')then
        %Cette touche est la touche d'action
            result level -> processInput( constants.ButtonA )
            
        elsif pressedKeys ('k')then
            result level -> processInput( -13 )
        elsif pressedKeys ('h')then
            result level -> processInput( -63 )
        elsif pressedKeys (KEY_ESC) then
            result true
            
        end if
        result false
    end processInput
    
end GameControlInput