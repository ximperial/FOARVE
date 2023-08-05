//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MonkeE_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A08U' then
        call SoundStart("war3mapImported\\Monke_3.mp3")
        call Effect("war3mapimported\\blackblink1.mdx", GetUnitX(c), GetUnitY(c), 25, 270, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, 270, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, 270, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_MonkeE takes nothing returns nothing
    set gg_trg_MonkeE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_MonkeE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_MonkeE, function Trig_MonkeE_Actions )
endfunction

