//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TohkaE_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A05N' then
        call SoundStart("war3mapImported\\Tohka_3.mp3")
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_TohkaE takes nothing returns nothing
    set gg_trg_TohkaE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_TohkaE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_TohkaE, function Trig_TohkaE_Actions )
endfunction