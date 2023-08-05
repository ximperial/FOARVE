//TESH.scrollpos=37
//TESH.alwaysfold=0
function Trig_RyougiR_Func001 takes nothing returns nothing
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
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Tohno_2-1.mp3" )
        call SoundStart( "war3mapImported\\Ryougi_6.mp3" )
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 3)
        call Effect("war3mapImported\\slash red.mdl", GetUnitX(t), GetUnitY(t), 25, a + 20, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count <= 20 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 20 then
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 20 and count <= 40 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 40, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 40, a))
    endif
    if count == 30 then
        call SoundStart( "war3mapImported\\Ryougi_6-1.mp3" )
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count == 35 then
        call SoundStart( "war3mapImported\\Ryougi_6-2.mp3" )
        call SetUnitFacing(c, a + 180)
        call Effect("war3mapImported\\slash red.mdl", GetUnitX(t), GetUnitY(t), 25, a - 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 45 then
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 45 and count <= 65 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 30, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 30, a))
    endif
    if count == 55 then
        call SoundStart( "war3mapImported\\Ryougi_6-3.mp3" )
        call SetUnitAnimationByIndex(c, 12)
        set x = PolarX(GetUnitX(t), - 200, a)
        set y = PolarY(GetUnitY(t), - 200, a)
        call Effect("war3mapImported\\slash-red.mdl", x, y, 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\RedSlash2a.mdl", x, y, 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 65 then
        call SoundStart( "war3mapImported\\Ryougi_6-2.mp3" )
        call Effect("war3mapImported\\[a]re2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 70 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A00C')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_RyougiR_Func002 takes nothing returns nothing
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
        call SoundStart( "war3mapImported\\Ryougi_5.mp3" )
        call SoundStart( "war3mapImported\\Ryougi_5-1.mp3" )
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 3, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapImported\\wind2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\dash sfx.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 20 then
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count >= 20 and count <= 60 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 20, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 20, a))
    endif
    if count == 20 or count == 40 then
        call Effect("war3mapImported\\Ryougi.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapImported\\blue-daoguagn3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 25 or count == 35 or count == 50 then
        call Effect("war3mapImported\\Ryougi.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call Effect("war3mapImported\\blue-daoguagn4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 30 or count == 45 or count == 55 then
        call Effect("war3mapImported\\Ryougi.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call Effect("war3mapImported\\blue-daoguagn2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 60 then
        call SoundStart( "war3mapImported\\Ryougi_5-2.mp3" )
        call Effect("war3mapImported\\blue-daoguagn3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        loop
            exitwhen i > 12
            set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
            call Effect("war3mapImported\\slash red.mdl", x, y, GetRandomReal(40, 140), randomAngle(), GetRandomReal(- 40, 40), 0, 2, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call Effect("war3mapImported\\arcdirve02bbb.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 70 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 0.3 * GetUnitBuffLevel(c, 'B01O')
        call DamageUnit(c, t, (dmg + 6 + 2 * GetUnitAbilityLevel(c, 'A00C')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_RyougiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00C' then 
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
            call TimerStart(z, 0.02, true, function Trig_RyougiR_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_RyougiR_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RyougiR takes nothing returns nothing
    set gg_trg_RyougiR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyougiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyougiR, function Trig_RyougiR_Actions )
endfunction