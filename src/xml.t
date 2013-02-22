unit

%---------------------------------------------------------------------------
% Author: Richard Lalancette
% Trouve les donnes dans le ficheir XML des niveau fait avec l'editeur Tiled
module xml
    export findProperty, findLine

    %---------------------------------------------------------------------------
    % Trouve les propritetes du niveau
    function findProperty( levelData : array 0 .. * of string, stringToSearch : string, lastIndex : int ) : string
        var currentIndex : int := lastIndex
        var stringToSearchIndex : int := 0
        var propertyValueBeginIndex : int := 0
        var resultingString : string := ""
        var propertyValue : string := levelData(currentIndex)
        % Trouver la valeur entre "" Juste apres les symbols '="'
        var str := stringToSearch + '="'
        
        stringToSearchIndex := index( propertyValue, str )
        if( stringToSearchIndex not= 0 ) then
            % begin index is right after the property name
            propertyValueBeginIndex := stringToSearchIndex + length( str );
            propertyValue := propertyValue( propertyValueBeginIndex .. * )
            resultingString := propertyValue( 1 .. index(propertyValue, '"' ) - 1 )
        end if
    
        result resultingString
    end findProperty

    %---------------------------------------------------------------------------
    % Trouve l'informations stocke dans le fichier
    function findLine( levelData : array 0 .. * of string, stringToSearch : string, startIndex : int ) : int
        var currentIndex : int := startIndex
        var upperBound : int := upper( levelData )
        var stringToSearchIndex : int := 0
        var stringToProcess : string := levelData(currentIndex)
        loop
            stringToSearchIndex := index( stringToProcess, stringToSearch )
            exit when ( currentIndex = upperBound-1 ) or ( stringToSearchIndex not= 0 )
            currentIndex := currentIndex + 1
            stringToProcess := levelData(currentIndex)
        end loop
        if( stringToSearchIndex not= 0 ) then
            result currentIndex
        end if
        result -1
    end findLine
    
    
end xml