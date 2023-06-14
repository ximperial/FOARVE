//TESH.scrollpos=21
//TESH.alwaysfold=0
globals
    integer LaxusRHash = StringHash("LaxusR")
    integer LaxusRXHash = StringHash("LaxusRX")
    integer LaxusRYHash = StringHash("LaxusRY")
endglobals

function Trig_LaxusR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real z1
    local real x2
    local real y2
    local real z2
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 2)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 3)
    local lightning l = LoadLightningHandle(ht, GetHandleId(z), 4)
    local real dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\LaxusNew_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 8, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 4)
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), 0)
        call SaveBoolean(ht, LaxusRHash, GetHandleId(v), true)
        call SaveReal(ht, LaxusRXHash, GetHandleId(v), x)
        call SaveReal(ht, LaxusRYHash, GetHandleId(v), y)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 4.2)
        call SaveUnitHandle(ht, GetHandleId(z), 2, v)
        if GetLocalPlayer() == GetOwningPlayer(c) then
            call ClearSelection()
            call SelectUnit(v, true) 
        endif
        call Effect("war3mapImported\\LightningBall.mdl", x, y, 600, randomAngle(), 0, 0, 0.75, 7.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        set z1 = GetAxisZ(GetUnitX(c), GetUnitY(c))
        set z2 = 600 + GetAxisZ(x, y)
        set l = AddLightningEx("AFOD", false, GetUnitX(c), GetUnitY(c), z1, x, y, z2)
        call SaveLightningHandle(ht, GetHandleId(z), 4, l)
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\LaxusNew_4-1.mp3")
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 190 then
        call SoundStart("war3mapImported\\LaxusNew_4-2.mp3")
    endif
    if count <= 200 then
        if x != LoadReal(ht, LaxusRXHash, GetHandleId(v)) or y != LoadReal(ht, LaxusRYHash, GetHandleId(v)) then
            set x = LoadReal(ht, LaxusRXHash, GetHandleId(v))
            set y = LoadReal(ht, LaxusRYHash, GetHandleId(v))
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
        endif
        set a = Angle(GetUnitX(c), GetUnitY(c), x, y)
        set dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
        if dist > 1000 then
            set x = PolarX(GetUnitX(c), 1000, a)
            set y = PolarY(GetUnitY(c), 1000, a)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
        endif
        set a = Angle(GetEffectX(e), GetEffectY(e), x, y)
        set dist = Distance(GetEffectX(e), GetEffectY(e), x, y)
        set x1 = PolarX(GetEffectX(e), dist / 10, a)
        set y1 = PolarY(GetEffectY(e), dist / 10, a)
        if dist > 0 and not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x1)
            call SetEffectY(e, y1)
            call SetSpecialEffectZ(e, 600 + GetAxisZ(x1, y1))
            set z1 = GetAxisZ(GetUnitX(c), GetUnitY(c))
            set x2 = GetUnitX(c)
            set y2 = GetUnitY(c)
            set z2 = 600 + GetAxisZ(x1, y1)
            call MoveLightningEx(l, true, x2, y2, z1, x1, y1, z2)
            set a = Angle(GetUnitX(c), GetUnitY(c), x1, y1)
            call SetUnitFacing(c, a)
        endif
        call VisionArea(GetOwningPlayer(c), 800, 1, x, y)
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
    if count >= 200 and count <= 250 then
        call SetSpecialEffectZ(e, GetEffectZ(e) - 12)
        set x1 = GetUnitX(c)
        set y1 = GetUnitY(c)
        set z1 = GetAxisZ(GetUnitX(c), GetUnitY(c))
        set x2 = GetEffectX(e)
        set y2 = GetEffectY(e)
        set z2 = GetEffectZ(e)
        call MoveLightningEx(l, true, x1, y1, z1, x2, y2, z2)
    endif
    if count <= 230 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2500, null)
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
    if count == 230 then
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
    endif
    if count == 250 then
        call SoundStart("war3mapImported\\LaxusNew_4-3.mp3")
    endif
    if count == 340 then
        call SetSpecialEffectAnimationByIndex(e, 1) 
    endif
    if count <= 350 then
        if count >= 250 then
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(c, gUnit) then 
                    call DamageUnit(c, gUnit, ((6 + 2 * GetUnitAbilityLevel(c, 'A097')) * GetHeroStr(c, true)) / 90)
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 20 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 0.5, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            if count >= 250 then
                call Effect("war3mapImported\\LighWave3.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(2, 2.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, GetRandomReal(2, 3), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(80, 90)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                call Effect("war3mapImported\\wind4.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(1.5, 1.75), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            endif
        endif
    endif
    if count == 350 then
        call SetSpecialEffectAnimationByIndex(e, 1)
        call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapImported\\wind3.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 2, 1, 255, 255, PercentTo255(60), PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\File00007390.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.8, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count == 355 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyLightning(l)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set v = null
    set l = null
    set e = null
endfunction

function Trig_LaxusR_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\LaxusNew_6.mp3")
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count <= 280 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.25, 2), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 2))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\LaxusNew_6-1.mp3")
    endif
    if count == 260 then
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count == 280 then
        set x = PolarX(GetUnitX(c), 150, a)
        set y = PolarY(GetUnitY(c), 150, a)
        call Effect("war3mapImported\\laxus_lightning_spear.mdl", x, y, 40, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 280 and count <= 320 then 
        set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        if dist > 140 then 
            call SetEffectX(e, PolarX(GetEffectX(e), dist / 15, a))
            call SetEffectY(e, PolarY(GetEffectY(e), dist / 15, a))
            call SetSpecialEffectZ(e, 40 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
            call SetSpecialEffectYaw(e, a)
        else
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetEffectX(e, PolarX(GetUnitX(t), - 10, a))
            call SetEffectY(e, PolarY(GetUnitY(t), - 10, a))
            call SetSpecialEffectZ(e, 40 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
            call SetSpecialEffectYaw(e, a)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\Ap235.mdl", GetEffectX(e), GetEffectY(e), 50, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(20))
            call Effect("war3mapImported\\CF2.mdl", GetEffectX(e), GetEffectY(e), 50, a, 0, 0, GetRandomReal(0.3, 0.4), 1, 255, 255, PercentTo255(60), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, GetRandomReal(1, 1.35), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
    endif
    if count == 310 then
        call SetEffectX(e, PolarX(GetUnitX(t), - 10, a))
        call SetEffectY(e, PolarY(GetUnitY(t), - 10, a))
        call SetSpecialEffectZ(e, 40 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call SetSpecialEffectYaw(e, a)
    endif
    if count == 320 then 
        call Effect("war3mapImported\\[A]LightStrikeArray4.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 45, 0, 1.75, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapImported\\QQQQQyellow.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        set x = PolarX(GetUnitX(t), 50, a)
        set y = PolarY(GetUnitY(t), 50, a)
        call Effect("war3mapImported\\WindCirclefaster.mdl", x, y, 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.75, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count == 330 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A097')) * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_LaxusR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A097' then 
        set z = CreateTimer()
        if t != null then
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, c)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function Trig_LaxusR_Func002)
        else
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, c)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function Trig_LaxusR_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_LaxusR takes nothing returns nothing
    set gg_trg_LaxusR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LaxusR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_LaxusR, function Trig_LaxusR_Actions )
endfunction