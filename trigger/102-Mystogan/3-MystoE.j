//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    integer MystoEHash = StringHash("MystoE")
    integer MystoEXHash = StringHash("MystoEX")
    integer MystoEYHash = StringHash("MystoEY")
    integer MystoSoundHash = StringHash("MystoSound")
endglobals

function Trig_MystoE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local integer iterator2 = LoadInteger(ht, GetHandleId(z) , 2)
    local real x
    local real y
    local real a = GetUnitFacing(c)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Mysto_3.mp3")
        call Effect("war3mapimported\\Magic Cast.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 12, 1, 255, 255, 50, 255)
        set bj_lastCreatedEffect = AddSpecialEffect("war3mapimported\\Magic Cast.mdx", GetUnitX(c), GetUnitY(c))
        call SetSpecialEffectZ(bj_lastCreatedEffect, 25)
        call SetSpecialEffectVertexColour(bj_lastCreatedEffect, 255, 255, 50, 255)
        call SetSpecialEffectScale(bj_lastCreatedEffect, 7)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call SaveBoolean(ht, MystoEHash, GetHandleId(c), true)
        call SaveReal(ht, MystoEXHash, GetHandleId(c), GetUnitX(c))
        call SaveReal(ht, MystoEYHash, GetHandleId(c), GetUnitY(c))
    endif
    if count <= 250 + 50 * GetUnitAbilityLevel(c, 'A0DQ') then
        call SetEffectX(e, GetUnitX(c))
        call SetEffectY(e, GetUnitY(c))
        call SetSpecialEffectZ(e, 25 + GetUnitZ(c))
        set iterator2 = iterator2 + 1
        call SaveInteger(ht, GetHandleId(z), 2, iterator2)
        if iterator2 >= 3 then
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            call Effect("war3mapimported\\Magic Cast.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 25, randomAngle(), 0, 0, 5, 1, 255, 255, 50, 255)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator <= 50 then
            call UnitAddAbility(c, 'Amrf')
            call UnitRemoveAbility(c, 'Amrf')
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 5, 0)
        else
            call UnitAddAbility(c, 'Amrf')
            call UnitRemoveAbility(c, 'Amrf')
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 5, 0)
        endif
        if iterator >= 100 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
    endif
    if count >= 250 + 50 * GetUnitAbilityLevel(c, 'A0DQ') or not IsUnitAlive(c) then 
        call SetUnitFlyHeight(c, 0, 0)
        call DestroyEffect(e)
        call RemoveSavedBoolean(ht, MystoEHash, GetHandleId(c))
        call RemoveSavedReal(ht, MystoEXHash, GetHandleId(c))
        call RemoveSavedReal(ht, MystoEYHash, GetHandleId(c))
        call RemoveSavedInteger(ht, MystoSoundHash, GetHandleId(c))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_MystoE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0DQ' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveInteger(ht, GetHandleId(z) , 2, 0)
        call TimerStart(z, 0.02, true, function Trig_MystoE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MystoE takes nothing returns nothing
    set gg_trg_MystoE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MystoE, function Trig_MystoE_Actions)
endfunction