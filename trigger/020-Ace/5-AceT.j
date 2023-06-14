//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_AceT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local integer iterator2 = LoadInteger(ht, GetHandleId(z), 2)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ace_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1800, 6, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\RedHarvest.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapImported\\[A]AceBall.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 0.1, 5.5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 0.1)
    endif
    if count >= 20 and count <= 170 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 25 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\[A]BY_Wood_Kong.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\RedHarvest.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        endif
    endif
    if count == 80 then
        call SetUnitAnimationByIndex(c, 11)
        call SetUnitTimeScale(c, 1)
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), a)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 2.5)
        call SaveUnitHandle(ht, GetHandleId(z), 3, v)
    endif
    if count >= 80 and count <= 180 then
        set iterator2 = iterator2 + 1
        call SaveInteger(ht, GetHandleId(z), 2, iterator2)
        if iterator2 >= 20 then 
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            if GetLocalPlayer() == GetOwningPlayer(c) then 
                call ClearSelection()
                call SelectUnit(v, true)
            endif
        endif
        call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(v))
        call SetUnitFacing(c, GetUnitFacing(v))
        call SetSpecialEffectYaw(e, GetUnitFacing(v))
        call SetSpecialEffectZ(e, GetEffectZ(e) + 4)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.03)
    endif
    if count <= 200 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 3000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Ace_5-1.mp3")
        call SetUnitAnimationByIndex(c, 12)
        call ForGroup(g, function ResetMoveSpeed)
        call GroupClear(g)
        set iterator = 0
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
    endif
    if count >= 200 and count <= 250 then
        set x = PolarX(GetEffectX(e), 50, a)
        set y = PolarY(GetEffectY(e), 50, a)
        call SetEffectXY(e, x, y, 1)
        call SetSpecialEffectZ(e, 525 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call VisionArea(GetOwningPlayer(c), 1000, 2, x, y)
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 15 * GetHeroStr(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\KatonGoukaMekkyaku.mdl", GetEffectX(e), GetEffectY(e), 200, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 250 then
        call SetSpecialEffectAnimationByIndex(e, 1)
        call Effect("war3mapImported\\[A]BY_Wood_Kong.mdl", GetEffectX(e), GetEffectY(e), 300, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetEffectX(e), GetEffectY(e), 200, a, 0, 0, 10, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AceRef.mdl", GetEffectX(e), GetEffectY(e), 200, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_FenShenDaBaoPo_2.mdl", GetEffectX(e), GetEffectY(e), 40, a, 0, 0, 5, 1, 255, 255, 255, 255)
    endif
    if count == 255 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
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
    set v = null
endfunction

function Trig_AceT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0AE' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AceT_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_AceT takes nothing returns nothing
    set gg_trg_AceT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AceT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AceT, function Trig_AceT_Actions )
endfunction