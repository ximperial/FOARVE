//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    integer KenshinTXHash = StringHash("KenshinTX")
    integer KenshinTYHash = StringHash("KenshinTY")
endglobals

function Trig_KenshinT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kenshin_5.mp3")
        call SoundStart("war3mapImported\\Kenshin_5-1.mp3")
        call SoundStart("war3mapImported\\Kenshin_5-2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapimported\\jxlsxf.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\TX_sltz_xiaoguo.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 2, 2, 0, 150, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call Effect("war3mapimported\\jxxz.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapimported\\jxxz.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
    endif
    if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 70 then
        call SetUnitAnimationByIndex(c, GetRandomInt(3, 4))
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Kenshin_5-3.mp3")
    endif
    if count == 50 then
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveReal(ht, GetHandleId(z), 1, 45) 
    endif
    if count <= 80 then
        if count <= 50 then
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        else
            set a = LoadReal(ht, GetHandleId(z), 0)
            set x = PolarX(GetUnitX(c), 15, a)
            set y = PolarY(GetUnitY(c), 15, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x)
                call SetUnitY(c, y)
            endif
        endif
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectPositionEx(e, GetUnitX(c), GetUnitY(c), 25 + GetAxisZ(GetUnitX(c), GetUnitY(c)))
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetSpecialEffectPositionEx(e, GetUnitX(c), GetUnitY(c), 50 + GetAxisZ(GetUnitX(c), GetUnitY(c)))
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        call SetSpecialEffectPositionEx(e, GetUnitX(c), GetUnitY(c), 50 + GetAxisZ(GetUnitX(c), GetUnitY(c)))
        set e = LoadEffectHandle(ht, GetHandleId(z), 5)
        call SetSpecialEffectPositionEx(e, GetUnitX(c), GetUnitY(c), 50 + GetAxisZ(GetUnitX(c), GetUnitY(c)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.65, 1.5), 1, 255, 255, 255, 255)
            call SaveReal(ht, KenshinTXHash, LoadInteger(ht, GetHandleId(z), 2), GetUnitX(c))
            call SaveReal(ht, KenshinTYHash, LoadInteger(ht, GetHandleId(z), 2), GetUnitY(c))
            call SaveInteger(ht, GetHandleId(z) , 2, LoadInteger(ht, GetHandleId(z), 2) + 1)
        endif
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Kenshin_5-4.mp3")
        call SoundStart("war3mapImported\\Kenshin_5-5.mp3")
        set a = LoadReal(ht, GetHandleId(z), 0)
        loop
            exitwhen i > LoadInteger(ht, GetHandleId(z), 2) - 1
            set x = LoadReal(ht, KenshinTXHash, i)
            set y = LoadReal(ht, KenshinTYHash, i)
            call Effect("war3mapimported\\zhanji-bluex-shu2.mdx", x, y, 350, a, LoadReal(ht, GetHandleId(z), 1), 0, 4, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call SaveReal(ht, GetHandleId(z), 1, - LoadReal(ht, GetHandleId(z), 1))
            set i = i + 1
        endloop
    endif
    if count == 85 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_KenshinT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CW' then 
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
        call TimerStart(z, 0.02, true, function Trig_KenshinT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KenshinT takes nothing returns nothing
    set gg_trg_KenshinT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshinT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KenshinT, function Trig_KenshinT_Actions)
endfunction