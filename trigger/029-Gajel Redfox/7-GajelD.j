//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_GajelD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x0 = LoadReal(ht, GetHandleId(z), 2)
    local real y0 = LoadReal(ht, GetHandleId(z), 3)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real z1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local real dist = LoadReal(ht, GetHandleId(z), 4)
    local real dist2
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local real pitch
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Gajel_7.mp3")
        call SoundStart("war3mapImported\\Gajel_7-1.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimation(c, "spell two")
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\MC Gajeel.mdl", x, y, 25, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Gajel_7-2.mp3")
    endif
    if count <= 40 then  
        set x1 = PolarX(GetUnitX(c), dist / 40, a)
        set y1 = PolarY(GetUnitY(c), dist / 40, a)
        set dist = Distance(x0, y0, x, y)
        set dist2 = Distance(x0, y0, GetUnitX(c), GetUnitY(c))
        set z1 = GetParabolaZ(dist2, dist, 500)
        set pitch = Slope(GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), x1, y1, z1)
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x1)
            call SetUnitY(c, y1)
        endif
        call SetUnitFlyHeight(c, z1, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\WindCircleFaster.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, pitch, 0, 0.8, 1, 200, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
    endif
    if count == 50 then 
        call SoundStart("war3mapImported\\Gajel_4-1.mp3")
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
    endif
    if count >= 50 and count <= 60 then 
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null 
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then 
                call DamageUnit(c, gUnit, 8 * GetHeroStr(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            loop
                exitwhen i > 4
                set x = PolarX(GetUnitX(c), 70 * (count - 49), 72 * i)
                set y = PolarY(GetUnitY(c), 70 * (count - 49), 72 * i)
                call Effect("war3mapImported\\SZBYAFB2.mdl", x, y, 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                set i = i + 1
            endloop
        endif
    endif
    if count == 60 then
        call SetUnitTimeScale(c, 1)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
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
endfunction

function Trig_GajelD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0B2' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveReal(ht, GetHandleId(z), 2, x1)
        call SaveReal(ht, GetHandleId(z), 3, y1)
        call SaveReal(ht, GetHandleId(z), 4, Distance(x1, y1, x, y))
        call TimerStart(z, 0.02, true, function Trig_GajelD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_GajelD takes nothing returns nothing
    set gg_trg_GajelD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GajelD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GajelD, function Trig_GajelD_Actions )
endfunction