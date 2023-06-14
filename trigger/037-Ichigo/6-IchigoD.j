//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_IchigoD_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0FG' then
        call SoundStart("war3mapImported\\Ichigo_7.mp3")
        call Effect("war3mapImported\\FreezingRing.mdx", GetUnitX(c), GetUnitY(c), 100, 270, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\DarkNova.mdx", GetUnitX(c), GetUnitY(c), 50, 270, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\Desecrate.mdx", GetUnitX(c), GetUnitY(c), 25, 270, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\darkblast.mdx", GetUnitX(c), GetUnitY(c), 25, 270, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\Dead Spirit by Deckai3.mdx", GetUnitX(c), GetUnitY(c), 25, 270, 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\SuperShinyThingy2.mdx", GetUnitX(c), GetUnitY(c), 50, 270, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_IchigoD takes nothing returns nothing
    set gg_trg_IchigoD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_IchigoD, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_IchigoD, function Trig_IchigoD_Actions )
endfunction