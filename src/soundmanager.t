unit

%---------------------------------------------------------------------------
% S'occupe de tout les effets sonores, l"ambiance et la musique
module SoundManager
    import constants in "constants.t"
    export footstep, ambience, weaponswing, goldPickup
    
    %---------------------------------------------------------------------------
    % Fait jouer les sons de pas lorsquelle est appellee
    process footstep( footstepId : int )
        case footstepId of
            label constants.sfxSmallFootstepDirtA: Music.PlayFile (constants.footSmallDirtA)
            label constants.sfxSmallFootstepDirtB: Music.PlayFile (constants.footSmallDirtB)
            label constants.sfxSmallFootstepDirtC: Music.PlayFile (constants.footSmallDirtC)
            label constants.sfxSmallFootstepDirtD: Music.PlayFile (constants.footSmallDirtD)
            label constants.sfxSmallFootstepDirtE: Music.PlayFile (constants.footSmallDirtE)
            label constants.sfxSmallFootstepStoneA: Music.PlayFile (constants.footSmallStoneA)
            label constants.sfxSmallFootstepStoneB: Music.PlayFile (constants.footSmallStoneB)
            label constants.sfxSmallFootstepStoneC: Music.PlayFile (constants.footSmallStoneC)
            label constants.sfxSmallFootstepStoneD: Music.PlayFile (constants.footSmallStoneD)
            label constants.sfxSmallFootstepStoneE: Music.PlayFile (constants.footSmallStoneE)
            label constants.sfxSmallFootstepGrassA: Music.PlayFile (constants.footSmallGrassA)
            label constants.sfxSmallFootstepGrassB: Music.PlayFile (constants.footSmallGrassB)
            label constants.sfxSmallFootstepGrassC: Music.PlayFile (constants.footSmallGrassC)
            label constants.sfxSmallFootstepGrassD: Music.PlayFile (constants.footSmallGrassD)
            label constants.sfxSmallFootstepGrassE: Music.PlayFile (constants.footSmallGrassE)
        end case
    end footstep
    
    %---------------------------------------------------------------------------
    % Fait jouer le son d'ambiance
    process ambience( ambienceId : int )
            case ambienceId of
                label constants.sfxAmbienceForestHighDay: Music.PlayFileLoop (constants.ambienceForestHighDay)
            end case
    end ambience
    
    %---------------------------------------------------------------------------
    % Fait jouer le son de coups arme
    process weaponswing( weaponId : int )
        case weaponId of
            label constants.sfxm1hswordhitplate1a: Music.PlayFile (constants.m1hswordhitplate1a)
            label constants.sfxm1hswordhitplate1b: Music.PlayFile (constants.m1hswordhitplate1b)
            label constants.sfxm1hswordhitplate1c: Music.PlayFile (constants.m1hswordhitplate1c)
        end case
    end weaponswing
    
    %---------------------------------------------------------------------------
    % Fait jouer le son lorsque le jouer rammasse de l'or
    process goldPickup ( goldPickupId : int)
        case goldPickupId of
            label constants.sfxlootcoinsmall: Music.PlayFile (constants.lootcoinsmall)
            label constants.sfxlootcoinlarge: Music.PlayFile (constants.lootcoinlarge)
        end case
    end goldPickup
    
end SoundManager