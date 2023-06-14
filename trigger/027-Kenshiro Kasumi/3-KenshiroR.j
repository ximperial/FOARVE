//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KenshiroR_Func003 takes nothing returns nothing
    call PauseUnit(GetEnumUnit(), true)
    call SetUnitInvulnerable(GetEnumUnit(), true)
endfunction

function Trig_KenshiroR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local group g2 = LoadGroupHandle(ht, GetHandleId(z), 2)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 3)
    local real dist
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kenshiro_4-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 5)
        call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), a)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 4)
        call SaveUnitHandle(ht, GetHandleId(z), 3, v)
        if GetLocalPlayer() == GetOwningPlayer(c) then 
            call ClearSelection()
            call SelectUnit(v, true)
        endif
        call SaveReal(ht, GetHandleId(z), 1, a)
    endif
    if count <= 180 then 
        set x = PolarX(GetUnitX(c), 12, a)
        set y = PolarY(GetUnitY(c), 12, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitX(v, GetUnitX(c))
        call SetUnitY(v, GetUnitY(c))
        set a = LoadReal(ht, GetHandleId(z), 1)
        call SetUnitFacing(c, a + count * 6)
        call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(v))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 10 or iterator == 20 then 
            if iterator == 20 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                if GetLocalPlayer() == GetOwningPlayer(c) then 
                    call ClearSelection()
                    call SelectUnit(v, true)
                endif
            endif
            call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, GetRandomReal(0.35, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.25, 1.75))
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 1000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            set dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(gUnit), GetUnitY(gUnit))
            if FilterGeneral(c, gUnit) and dist < 300 then
                if not IsUnitInGroup(gUnit, g2) then
                    call PauseUnit(gUnit, true)
                    call SetUnitInvulnerable(gUnit, true)
                    call GroupAddUnit(g2, gUnit) 
                endif
            endif
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.5)
        endloop
        call GroupClear(gGroup)
        call ForGroup(g2, function Trig_KenshiroR_Func003)
    endif
    if count == 180 then
        call SoundStart("war3mapImported\\Kenshiro_4-2.mp3")
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
    endif
    if count == 370 then
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
    endif
    if count == 380 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        loop
            set gUnit = GroupForEachUnit(g2)
            exitwhen gUnit == null 
            call Effect("war3mapImported\\File00003933.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255) 
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call PauseUnit(gUnit, false)
            call SetUnitInvulnerable(gUnit, false)
            call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A068')) * GetHeroStr(c, true))
            call IssueImmediateOrderById(gUnit, 851972)
        endloop
        call DestroyGroup(g2)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set v = null
    set g = null
    set g2 = null
endfunction

function Trig_KenshiroR_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 3)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 200 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Kenshiro_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 5, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 25)
        call SetUnitTimeScale(c, 0.25)
        call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), a)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 4.5)
        call SaveUnitHandle(ht, GetHandleId(z), 2, v)
        if GetLocalPlayer() == GetOwningPlayer(c) then 
            call ClearSelection()
            call SelectUnit(v, true)
        endif
        call Effect("war3mapImported\\AZ_Alleria_R4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 6.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 1 or count == 30 or count == 60 or count == 90 or count == 120 or count == 150 or count == 180 or count == 210 then
        call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, GetRandomReal(1, 1.25), 1, PercentTo255(70), PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, GetRandomReal(0.4, 0.5), 1, PercentTo255(70), PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, GetRandomReal(1, 1.5), 1, PercentTo255(70), PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
    endif
    if count == 30 or count == 60 or count == 90 or count == 120 or count == 150 or count == 180 then
        call SetSpecialEffectAnimationByIndex(e, 0)
    endif
    if count <= 200 then 
        call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(v))
        call SetUnitFacing(c, GetUnitFacing(v))
        call SetSpecialEffectYaw(e, GetUnitFacing(c))
        call SetEffectX(e, PolarX(GetUnitX(c), 50, GetUnitFacing(c)))
        call SetEffectY(e, PolarY(GetUnitY(c), 50, GetUnitFacing(c)))
        call SetSpecialEffectZ(e, 25 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 20 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetLocalPlayer() == GetOwningPlayer(c) then 
                call ClearSelection()
                call SelectUnit(v, true)
            endif
        endif
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
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call ForGroup(g, function ResetMoveSpeed)
        call GroupClear(g)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", PolarX(GetUnitX(c), 100, a), PolarY(GetUnitY(c), 100, a), 100, a, - 180, 0, 3, 1, PercentTo255(70), PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
        call Effect("war3mapImported\\wind3.mdl", PolarX(GetUnitX(c), 100, a), PolarY(GetUnitY(c), 100, a), 100, a, - 90, 0, 1.75, 1, PercentTo255(70), PercentTo255(70), 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count >= 200 and count <= 300 then
        set x = PolarX(GetEffectX(e), 30, a)
        set y = PolarY(GetEffectY(e), 30, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x)
            call SetEffectY(e, y) 
        endif 
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 450, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A068')) * GetHeroStr(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetEffectX(e), 30, a)
            set y = PolarY(GetEffectY(e), 30, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 120, a, - 90, 0, GetRandomReal(1.5, 1.75), 1, PercentTo255(60), PercentTo255(60), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.5, 1.75))
            set x = PolarX(GetEffectX(e), - 30, a)
            set y = PolarY(GetEffectY(e), - 30, a)
            call Effect("war3mapImported\\by_wood_huoyanchongji_2_2.mdl", x, y, 120, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
        endif
    endif
    if count == 300 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set v = null
    set g = null
    set e = null
endfunction

function Trig_KenshiroR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A068' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if dist > 600 then
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call SaveReal(ht, GetHandleId(z), 0, a)
            call TimerStart(z, 0.02, true, function Trig_KenshiroR_Func002) 
        else
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call SaveReal(ht, GetHandleId(z), 0, a)
            call TimerStart(z, 0.02, true, function Trig_KenshiroR_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KenshiroR takes nothing returns nothing
    set gg_trg_KenshiroR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshiroR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KenshiroR, function Trig_KenshiroR_Actions )
endfunction