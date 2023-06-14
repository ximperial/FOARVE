//TESH.scrollpos=22
//TESH.alwaysfold=0
globals
    integer EscaFHash = StringHash("EscaF")
    integer EscaFXHash = StringHash("EscaFX")
    integer EscaFYHash = StringHash("EscaFY")
endglobals

function Trig_EscaF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real z1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    local effect e3 = LoadEffectHandle(ht, GetHandleId(z), 4)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 5)
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 470 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Escanor_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 10, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), 0)
        call SaveBoolean(ht, EscaFHash, GetHandleId(v), true)
        call SaveReal(ht, EscaFXHash, GetHandleId(v), x)
        call SaveReal(ht, EscaFYHash, GetHandleId(v), y)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 9.6)
        call SaveUnitHandle(ht, GetHandleId(z), 1, v)
        if GetLocalPlayer() == GetOwningPlayer(c) then
            call ClearSelection()
            call SelectUnit(v, true) 
        endif
    endif
    if count <= 20 then
        if dist < 600 then
            set x1 = PolarX(GetUnitX(c), - 30, a)
            set y1 = PolarY(GetUnitY(c), - 30, a)
            if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x1)
                call SetUnitY(c, y1)
            endif
        endif
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 20, 0)
    endif
    if count == 20 then
        call SetUnitX(v, GetUnitX(c))
        call SetUnitY(v, GetUnitY(c))
        call Effect("war3mapImported\\asknhq.mdl", GetUnitX(c), GetUnitY(c), 1180, a, 0, 0, 17, 11, 255, 255, 0, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_unusual_yuedu_1.mdl", GetUnitX(c), GetUnitY(c), 1180, a, 0, 0, 1, 11, 255, 255, 0, PercentTo255(60))
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
        call SaveReal(ht, GetHandleId(z), 2, Distance(GetUnitX(c), GetUnitY(c), x, y))
        call SaveReal(ht, GetHandleId(z), 3, Angle(GetUnitX(c), GetUnitY(c), x, y))
    endif
    if count >= 20 and count <= 470 then
        if x != LoadReal(ht, EscaFXHash, GetHandleId(v)) or y != LoadReal(ht, EscaFYHash, GetHandleId(v)) then
            set x = LoadReal(ht, EscaFXHash, GetHandleId(v))
            set y = LoadReal(ht, EscaFYHash, GetHandleId(v))
            set dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
            set a = Angle(GetUnitX(c), GetUnitY(c), x, y)
            if dist <= 1000 then
                call SaveReal(ht, GetHandleId(z), 0, x)
                call SaveReal(ht, GetHandleId(z), 1, y)
                call SaveReal(ht, GetHandleId(z), 2, Distance(GetUnitX(c), GetUnitY(c), x, y))
                call SaveReal(ht, GetHandleId(z), 3, Angle(GetUnitX(c), GetUnitY(c), x, y))
            else
                set x = PolarX(GetUnitX(c), 1000, a)
                set y = PolarY(GetUnitY(c), 1000, a)
                call SaveReal(ht, GetHandleId(z), 0, x)
                call SaveReal(ht, GetHandleId(z), 1, y)
                call SaveReal(ht, GetHandleId(z), 2, Distance(GetUnitX(c), GetUnitY(c), x, y))
                call SaveReal(ht, GetHandleId(z), 3, Angle(GetUnitX(c), GetUnitY(c), x, y))
            endif
        endif
        call SetUnitFacing(c, a)
        call SetSpecialEffectYaw(e, a)
        call SetSpecialEffectYaw(e2, a)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 20 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetLocalPlayer() == GetOwningPlayer(c) then
                call ClearSelection()
                call SelectUnit(v, true) 
            endif
        endif
    endif
    if count == 450 then
        call SetUnitAnimationByIndex(c, 9)
    endif
    if count == 470 then
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
        call SetUnitFlyHeight(c, 0, 666)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call Effect("war3mapImported\\AFBHQ.mdl", GetUnitX(c), GetUnitY(c), 1180, a, 0, 0, 2, 1.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        set e3 = bj_lastCreatedEffect
    endif
    if count >= 470 and count <= 500 then
        set dist = LoadReal(ht, GetHandleId(z), 2)
        set a = LoadReal(ht, GetHandleId(z), 3)
        set x1 = PolarX(GetEffectX(e), dist / 30, a)
        set y1 = PolarY(GetEffectY(e), dist / 30, a)
        set z1 = GetEffectZ(e) + GetAxisZ(x1 + 0.01, y1) - GetAxisZ(x1 - 0.01, y1)
        set pitch = Slope(GetEffectX(e), GetEffectY(e), GetEffectZ(e), x, y, 0)
        call SetEffectX(e, x1)
        call SetEffectY(e, y1)
        call SetSpecialEffectZ(e, z1 - 36)
        call SetEffectX(e2, x1)
        call SetEffectY(e2, y1)
        call SetSpecialEffectZ(e2, GetEffectZ(e))
        call SetEffectX(e3, x1)
        call SetEffectY(e3, y1)
        call SetSpecialEffectZ(e3, GetEffectZ(e))
        call SetSpecialEffectOrientation(e, a, pitch, 0)
        call SetSpecialEffectOrientation(e2, a, pitch, 0)
        call SetSpecialEffectOrientation(e3, a, pitch, 0)
    endif
    if count == 505 then
        call SoundStart("war3mapImported\\Escanor_6-1.mp3")
        call Effect("war3mapImported\\XZDL2.mdl", x, y, 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 510 or count == 530 then
        call Effect("war3mapImported\\shuozhu2.mdl", x, y, 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count >= 500 and count <= 550 then
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null 
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 11 * GetHeroStr(c, true) / 40)
                call IssueImmediateOrderById(gUnit, 851972)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 550 then 
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set e2 = null
    set e3 = null
    set g = null
    set v = null
endfunction

function Trig_EscaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0CJ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 5, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_EscaF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_EscaF takes nothing returns nothing
    set gg_trg_EscaF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EscaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EscaF, function Trig_EscaF_Actions )
endfunction