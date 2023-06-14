//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_GutsD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart( "war3mapImported\\Guts_7.mp3" )
        if GetUnitTypeId(c) != 'H0FT' then
            call MorphUnit(c, 'H0FT')
        endif
        call DisableUnitAbility(c, 'A0B8', true, true)
        call UnitAddAbility(c, 'A0B9')
        call UnitMakeAbilityPermanent(c, true, 'A0B9')
        call Effect("war3mapimported\\bymutou-hongse3.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\File00003933.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.9, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.25, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 1, AddSpecialEffectTarget("war3mapImported\\[A]Guts_wolf.mdx", c, "head"))
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", c, "right hand"))
        call SaveEffectHandle(ht, GetHandleId(z), 3, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", c, "left hand"))
        call SaveEffectHandle(ht, GetHandleId(z), 4, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", c, "right foot"))
        call SaveEffectHandle(ht, GetHandleId(z), 5, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", c, "left foot"))
    endif
    if count == 75 then
        call SoundStart( "war3mapImported\\Guts_7-1.mp3" )
    endif
    if count >= 75 and GetUnitAbilityLevel(c, 'B009') == 0 and IsUnitAlive(c) then 
        call MorphUnit(c, 'H0EF')
        call EnableUnitAbility(c, 'A0B8', true, true)
        call UnitRemoveAbility(c, 'A0B9')
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 1))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 4))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 5))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_GutsD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0B8' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_GutsD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_GutsD takes nothing returns nothing
    set gg_trg_GutsD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GutsD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GutsD, function Trig_GutsD_Actions )
endfunction