//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KenshinF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kenshin_6.mp3")
        call SoundStart("war3mapImported\\Kenshin_6-1.mp3")
        call SetUnitAnimationByIndex(c, 8)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveReal(ht, GetHandleId(z), 1, 25)
        call SaveReal(ht, GetHandleId(z), 2, 45) 
    endif
    if count <= 30 then
        set a = LoadReal(ht, GetHandleId(z), 0) + LoadReal(ht, GetHandleId(z), 1)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitFacingEx(c, a, true)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 2 or iterator == 4 then
            if iterator == 4 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SaveReal(ht, GetHandleId(z), 1, - LoadReal(ht, GetHandleId(z), 1))
            endif
            call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.65, 1.5), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\zhanji-bluex-shu2.mdx", GetUnitX(c), GetUnitY(c), 400, a, LoadReal(ht, GetHandleId(z), 2), 0, 4, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call SaveReal(ht, GetHandleId(z), 2, - LoadReal(ht, GetHandleId(z), 2))
        endif
    endif
    if count == 30 then
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist > 600 then
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 7)
        call SaveReal(ht, GetHandleId(z), 3, dist)
    endif
    if count == 35 then
        call SoundStart("war3mapImported\\Kenshin_6-2.mp3")
        call SoundStart("war3mapImported\\Kenshin_6-3.mp3")
    endif
    if count == 40 then
        set dist = LoadReal(ht, GetHandleId(z), 3)
        set x = PolarX(GetUnitX(c), dist / 2, a + 20)
        set y = PolarY(GetUnitY(c), dist / 2, a + 20)
        call Effect("war3mapimported\\DTJJ.mdx", x, y, 0, a + 20, 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
        set x = PolarX(GetUnitX(c), dist / 2, a)
        set y = PolarY(GetUnitY(c), dist / 2, a)
        call Effect("war3mapimported\\DTJJ.mdx", x, y, 0, a, 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
        set x = PolarX(GetUnitX(c), dist / 2, a - 20)
        set y = PolarY(GetUnitY(c), dist / 2, a - 20)
        call Effect("war3mapimported\\DTJJ.mdx", x, y, 0, a - 20, 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
    endif
    if count == 45 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_KenshinF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CX' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveInteger(ht, GetHandleId(z) , 2, 0)
        call TimerStart(z, 0.02, true, function Trig_KenshinF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KenshinF takes nothing returns nothing
    set gg_trg_KenshinF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshinF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KenshinF, function Trig_KenshinF_Actions)
endfunction