//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_YugiF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local group g1 = LoadGroupHandle(ht, GetHandleId(z) , 4)
    local integer i = 1
    local effect e
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 5)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 470 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Yugi_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 10, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 5)
        set x = PolarX(GetUnitX(c), 400, a + 180)
        set y = PolarY(GetUnitY(c), 400, a + 180)
        call Effect("war3mapimported\\hehehehehe33.mdx", x, y, 25, a, 0, 0, 1, 3, 255, 255, 255, 255)
    endif
    if count >= 40 and count <= 120 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), 400, a + 180)
            set y = PolarY(GetUnitY(c), 400, a + 180)
            set x = PolarX(x, GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(y, GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\misaka light a.mdx", x, y, 25, randomAngle(), 0, 0, GetRandomReal(2, 3), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 120 then
        set x = PolarX(GetUnitX(c), 400, a + 180)
        set y = PolarY(GetUnitY(c), 400, a + 180)
        call Effect("war3mapimported\\demon.mdx", x, y, 25, a, 0, 0, 2, 11.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count == 170 then
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 300 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 6)
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), a)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 2)
        call SaveUnitHandle(ht, GetHandleId(z), 5, v)
    endif
    if count == 300 or count == 330 or count == 360 then
        if GetLocalPlayer() == GetOwningPlayer(c) then 
            call ClearSelection()
            call SelectUnit(v, true)
        endif
    endif
    if count >= 300 and count <= 420 then
        if count < 400 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 2)
            call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(v))
            set a = GetUnitFacing(v)
            call SetUnitFacing(c, a)
            set x = PolarX(GetUnitX(c), 400, a + 180)
            set y = PolarY(GetUnitY(c), 400, a + 180)
            call SetSpecialEffectPositionEx(e, x, y, 25 + GetAxisZ(x, y))
            call SetSpecialEffectYaw(e, a)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), 400, a + 180)
            set y = PolarY(GetUnitY(c), 400, a + 180)
            call Effect("war3mapimported\\ethereal lightning2.mdx", x, y, 275, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 420 then
        call SetUnitAnimationByIndex(c, 7)
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 0)
    endif
    if count == 470 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectTimeScale(e, .05)
        set x = PolarX(GetUnitX(c), 200, a)
        set y = PolarY(GetUnitY(c), 200, a)
        call Effect("war3mapimported\\dianqiu.mdx", x, y, 150, a, 0, 0, 8, 3.4, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count == 480 or count == 510 or count == 540 or count == 570 or count == 610 then
        call SoundStart("war3mapImported\\Yugi_6-1.mp3")
    endif
    if count >= 470 and count <= 630 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        set x = PolarX(GetEffectX(e), 25, a)
        set y = PolarY(GetEffectY(e), 25, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 11 * GetHeroInt(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetEffectX(e), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetEffectY(e), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\tenshi swr explode.mdx", x, y, 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\misaka light b.mdx", x, y, 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
    endif
    if count <= 460 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g1) then 
                call GroupAddUnit(g1, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 460 then
        call ForGroup(g1, function ResetMoveSpeed)
        call DestroyGroup(g1)
    endif
    if count == 630 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e = null
    set g1 = null
    set v = null
endfunction

function Trig_YugiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A07O' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call SaveGroupHandle(ht, GetHandleId(z) , 4, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_YugiF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_YugiF takes nothing returns nothing
    set gg_trg_YugiF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YugiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_YugiF, function Trig_YugiF_Actions)
endfunction