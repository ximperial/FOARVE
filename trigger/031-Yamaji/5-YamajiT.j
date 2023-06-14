//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_YamajiT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart( "war3mapImported\\Yamaji_5.mp3" )
        if GetUnitTypeId(c) != 'H0FV' then
            call MorphUnit(c, 'H0FV')
        endif
        call Effect("war3mapimported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[A]FireEruption2.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.8, 1, 255, PercentTo255(80), PercentTo255(50), 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\FireEffectOrange.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 1, AddSpecialEffectTarget("war3mapImported\\qjbuff.mdl", c, "origin"))
    endif
    if count == 50 then
        call SoundStart( "war3mapImported\\Yamaji_5-1.mp3" )
    endif
    if count >= 50 and IsUnitAlive(c) then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 50 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 1000, null)
            loop 
                set gUnit = FirstOfGroup(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(c, gUnit) and GetUnitTypeId(gUnit) != 'oeye' then
                    call Effect("war3mapimported\\FireEffectOrange.mdx", GetUnitX(gUnit), GetUnitY(gUnit), 50, a, 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(80))
                    call DamageUnit(c, gUnit, GetHeroStr(c, true)) 
                endif
                call GroupRemoveUnit(gGroup, gUnit)
            endloop
        endif
    endif
    if count >= 50 and GetUnitAbilityLevel(c, 'B01T') == 0 and IsUnitAlive(c) then 
        call MorphUnit(c, 'H0FU')
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 1))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_YamajiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0BF' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_YamajiT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_YamajiT takes nothing returns nothing
    set gg_trg_YamajiT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YamajiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_YamajiT, function Trig_YamajiT_Actions )
endfunction