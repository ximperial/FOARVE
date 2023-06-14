//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MiuQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer i = 0
    local effect e
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Miu_1-1.mp3")
        call SoundStart("war3mapImported\\Miu_1-2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count <= 15 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetEffectX(e), 80, a)
        set y = PolarY(GetEffectY(e), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then 
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0GK'))
                call GroupAddUnit(g, gUnit)
            endif 
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", GetEffectX(e), GetEffectY(e), 50, a, 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call Effect("war3mapImported\\26.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_MiuQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0GK' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_MiuQ_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MiuQ takes nothing returns nothing
    set gg_trg_MiuQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MiuQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MiuQ, function Trig_MiuQ_Actions )
endfunction