//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AlibabaF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local group g2 = LoadGroupHandle(ht, GetHandleId(z) , 2)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 3)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 4)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 160 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Alibaba_6-4.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 4)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 300, 300)
        call Effect("war3mapimported\\Holy_Fire_Slam2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 50 then
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), a)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 2)
        call SaveUnitHandle(ht, GetHandleId(z), 4, v)
        if GetLocalPlayer() == GetOwningPlayer(c) then 
            call ClearSelection()
            call SelectUnit(v, true)
        endif
    endif
    if count == 75 or count == 100 then
        if GetLocalPlayer() == GetOwningPlayer(c) then 
            call ClearSelection()
            call SelectUnit(v, true)
        endif
    endif
    if count >= 50 and count <= 100 then
        call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(v))
        set a = GetUnitFacing(v)
        call SetUnitFacing(c, GetUnitFacing(v))
    endif
    if count == 100 then
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\Holy_Fire_Slam2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 130 then
        call Effect("war3mapimported\\FireEruption2.mdx", GetUnitX(c) , GetUnitY(c) , 250, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("", GetUnitX(c) , GetUnitY(c) , 0, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 130 and count <= 170 then
        set x = PolarX(GetEffectX(e) , 50, a)
        set y = PolarY(GetEffectY(e) , 50, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 400, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A04M')) * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\fire1.mdx", GetEffectX(e) , GetEffectY(e) , 250, a, 0, 0, 1.35, 1.2, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]FireShockRun(fire2).mdl", GetEffectX(e), GetEffectY(e), 250, a, 0, 0, 2, 1.2, 255, 255, 255, 255)
        endif
    endif
    if count <= 150 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g2) then 
                call GroupAddUnit(g2, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 150 then
        call ForGroup(g2, function ResetMoveSpeed)
        call DestroyGroup(g2)
    endif
    if count == 160 then
        call SetUnitFlyHeight(c, 0, 1500)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count == 170 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set g2 = null
    set e = null
    set v = null
endfunction

function Trig_AlibabaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A04M' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call SaveGroupHandle(ht, GetHandleId(z) , 2, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AlibabaF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_AlibabaF takes nothing returns nothing
    set gg_trg_AlibabaF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AlibabaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AlibabaF, function Trig_AlibabaF_Actions)
endfunction