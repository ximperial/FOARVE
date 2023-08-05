//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NuraQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Nura_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        if GetUnitTypeId(c) == 'H0GA' then 
            call SetUnitAnimationByIndex(c, 7)
        else
            call SetUnitAnimationByIndex(c, 6)
        endif
        call Effect("war3mapimported\\Shockwave Blue.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e) , 80, a)
        set y = PolarY(GetEffectY(e) , 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A07D'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\fireshockrun1(blue).mdx", GetEffectX(e) , GetEffectY(e) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]BlueRing.mdx", GetEffectX(e) , GetEffectY(e) , 150, a, -90, 0, .8, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call Effect("war3mapimported\\Shockwave Blue.mdx", GetEffectX(e) , GetEffectY(e) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Orgia Mode2.mdx", GetEffectX(e) , GetEffectY(e) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]BlueAsuma-Explosion.mdx", GetEffectX(e) , GetEffectY(e) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
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
    set g = null
    set e = null
endfunction

function Trig_NuraQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A07D' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_NuraQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_NuraQ takes nothing returns nothing
    set gg_trg_NuraQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NuraQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NuraQ, function Trig_NuraQ_Actions)
endfunction