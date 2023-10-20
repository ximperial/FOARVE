//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OgitaW_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ogita_2.mp3")
        call SoundStart("war3mapImported\\Ogita_2-1.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\3shadowassault(lightzi)waveblue.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call SetUnitX(c, PolarX(GetUnitX(t), 400, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 400, a))
        call SetUnitAnimationByIndex(c, 0)
        set a = a + 180
        call SetUnitFacingEx(c, a, true)
    endif
    if count == 5 then
        call SetUnitAnimationByIndex(c, 14)
    endif
    if count >= 5 and count <= 25 then
        set x = PolarX(GetUnitX(c), 40, GetUnitFacing(c))
        set y = PolarY(GetUnitY(c), 40, GetUnitFacing(c))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(c), GetUnitY(c), 25, GetUnitFacing(c), 0, 0, GetRandomReal(1.15, 1.4), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
        endif
    endif
    if count == 25 then
        call SetUnitAnimationByIndex(c, 11)
        call SetUnitTimeScale(c, 1.2)
        call SetUnitFacingEx(c, a, true)
        call Effect("war3mapimported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.3, 1.5, 255, 255, 255, 255)
    endif
    if count == 35 then
        call SoundStart("war3mapImported\\Ogita_2-2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 140, a))
        call Effect("war3mapimported\\windslash.mdx", GetUnitX(t), GetUnitY(t), 150, a + 90, - 45, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\windslash.mdx", GetUnitX(t), GetUnitY(t), 150, a + 90, 45, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\ultizoro.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
        loop
            exitwhen i > 6
            call Effect("war3mapimported\\windweak2.mdx", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, GetRandomReal(1, 2.35), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            set i = i + 1 
        endloop
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        set x = PolarX(GetUnitX(c), - 300, a)
        set y = PolarY(GetUnitY(c), - 300, a)
        call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, 0, 0, 0.45, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
        call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 190, 0, 0, 0.55, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.05)
        call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 200, 0, 0, 0.6, 1.5, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0GE')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_OgitaW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GE' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OgitaW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_OgitaW takes nothing returns nothing
    set gg_trg_OgitaW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OgitaW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_OgitaW, function Trig_OgitaW_Actions)
endfunction