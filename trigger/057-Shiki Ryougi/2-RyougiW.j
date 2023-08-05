//TESH.scrollpos=54
//TESH.alwaysfold=0
function Trig_RyougiW_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 40 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart( "war3mapImported\\Ryougi_2.mp3" )
        call SetUnitAnimationByIndex(c, 10)
        call Effect("war3mapImported\\wind2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\dash sfx.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count <= 15 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 15 then
        call SoundStart( "war3mapImported\\Ryougi_2-1.mp3" )
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call Effect("war3mapImported\\wind2.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Hit.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\dash sfx.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\coarse slashRed.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count >= 15 and count <= 35 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
    endif
    if count == 35 then
        call SoundStart( "war3mapImported\\Ryougi_2-2.mp3" )
        call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, 400, 0)
        call Effect("war3mapImported\\dash sfx.mdl", GetUnitX(c), GetUnitY(c), 400, a, - 45, -180, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wind2.mdl", GetUnitX(t), GetUnitY(t), 400, a, - 45, -180, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Hit.mdl", GetUnitX(t), GetUnitY(t), 400, a, - 45, -180, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 400, a, - 45, -180, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\coarse slashRed.mdl", GetUnitX(t), GetUnitY(t), 400, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitFlyHeight(c, 0, 1000)
        call SetUnitFlyHeight(t, 0, 666)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A00A')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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
endfunction

function Trig_RyougiW_Func002 takes nothing returns nothing
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
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Ryougi_2.mp3" )
        call SetUnitAnimationByIndex(c, 10)
        call Effect("war3mapImported\\wind2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\dash sfx.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 9)
    endif
    if count <= 15 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 15 then
        call SoundStart( "war3mapImported\\Ryougi_4.mp3" )
        call Effect("war3mapImported\\slash red.mdl", GetUnitX(t), GetUnitY(t), 100, a + 90, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\slash red.mdl", GetUnitX(t), GetUnitY(t), 100, a - 90, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\bloodp1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 15 and count <= 35 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(c), 15, a)
        set y = PolarY(GetUnitY(c), 15, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
    endif
    if count == 25 then
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitFacing(c, a + 180)
    endif
    if count == 35 then
        loop
            exitwhen i > 9
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapImported\\slash red.mdl", x, y, GetRandomReal(40, 100), randomAngle(), GetRandomReal(- 40, 40), 0, 1.5, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call Effect("war3mapImported\\bloodp1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 0.3 * GetUnitBuffLevel(c, 'B01O')
        call DamageUnit(c, t, (dmg + 1 + GetUnitAbilityLevel(c, 'A00A')) * GetHeroAgi(c, true))
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
endfunction

function Trig_RyougiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00A' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if GetUnitAbilityLevel(c, 'B01O') > 0 then
            call TimerStart(z, 0.02, true, function Trig_RyougiW_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_RyougiW_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RyougiW takes nothing returns nothing
    set gg_trg_RyougiW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyougiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyougiW, function Trig_RyougiW_Actions )
endfunction