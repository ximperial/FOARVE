//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RinT_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z) , 3)
    local effect e3 = LoadEffectHandle(ht, GetHandleId(z) , 4)
    local effect e4 = LoadEffectHandle(ht, GetHandleId(z) , 5)
    local effect e5 = LoadEffectHandle(ht, GetHandleId(z) , 6)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Rin_5.mp3")
        call Effect("war3mapimported\\[A]RinRfire.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.75, 15, 255, 255, 255, PercentTo255(70))
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 1 then
        call SetEffectX(e, GetUnitX(c))
        call SetEffectY(e, GetUnitY(c))
        call SetSpecialEffectZ(e, 25 + GetUnitZ(c))
    endif
    if count == 80 then
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 100 or count == 240 or count == 390 then
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.55, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 250 or count == 500 then
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count >= 250 and count <= 320 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x = PolarX(GetUnitX(c) , 100, a)
            set y = PolarY(GetUnitY(c) , 100, a)
            call Effect("war3mapimported\\wind3.mdx", x, y, 80, a, - 90, 0, 1.25, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.5, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\CF2.mdx", x, y, 25, a, 0, 0, GetRandomReal(0.35, 0.6) , 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(50, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.8)) 
        endif
    endif
    if count >= 250 and count <= 320 or count >= 480 and count <= 700 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 50, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 50, a))
        else
            set x = PolarX(GetUnitX(t) , 5, a)
            set y = PolarY(GetUnitY(t) , 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 300 then
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 320 then
        call Effect("war3mapimported\\[A]RinRfire2.mdx", GetUnitX(t) , GetUnitY(t) , 80, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", x, y, 80, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]GongChengBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 1.35, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.65, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)  
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.45, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(50, 90)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.8)) 
        call Effect("war3mapimported\\[A]RinRfire2.mdx", GetUnitX(t) , GetUnitY(t) , 80, a, - 90, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(t) , GetUnitY(t) , 80, a, - 90, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.35, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.5, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count >= 320 and count <= 480 then
        set x = PolarX(GetUnitX(t) , 5, a)
        set y = PolarY(GetUnitY(t) , 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\wind2.mdx", GetUnitX(t) , GetUnitY(t) , 80, a, - 90, 0, GetRandomReal(1.5, 2.55) , 1, 255, 255, 255, PercentTo255(GetRandomReal(60, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
            set x = PolarX(GetUnitX(t) , 50, a)
            set y = PolarY(GetUnitY(t) , 50, a)
            call Effect("war3mapimported\\rasengan_eff4.mdx", x, y, 80, a, - 90, 0, GetRandomReal(0.8, 1.2) , 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(40, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            set x = PolarX(GetUnitX(t) , 100, a)
            set y = PolarY(GetUnitY(t) , 100, a)
            call Effect("war3mapimported\\wind3.mdx", x, y, 80, a, - 90, 0, 1.25, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            set x = PolarX(GetUnitX(t) , 150, a)
            set y = PolarY(GetUnitY(t) , 150, a)
            call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9) 
            set x = PolarX(GetUnitX(t) , 100, a)
            set y = PolarY(GetUnitY(t) , 100, a)
            call Effect("war3mapimported\\CF2.mdx", x, y, 25, a, 0, 0, GetRandomReal(0.45, 0.65) , 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.9))
        endif
    endif
    if count == 360 then
        call SoundStart("war3mapImported\\Rin_5-1.mp3")
        call SetUnitAnimationByIndex(c, 10)
    endif
    if count == 450 then
        call Effect("war3mapimported\\[A]Rin_Lina_D1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 3.55, 5, 255, 255, 255, PercentTo255(90))
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
        call Effect("war3mapimported\\[A]AZ_chongci-blue.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 3.5, 5, 255, 255, 255, PercentTo255(60))
        call SaveEffectHandle(ht, GetHandleId(z) , 4, bj_lastCreatedEffect)
        set e3 = bj_lastCreatedEffect
        call Effect("war3mapimported\\[A]ChuShou_Blue1.mdx", GetUnitX(c) , GetUnitY(c) , 80, a + 180, - 90, 0, 0.35, 5, 255, 255, 255, PercentTo255(30))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect , 1.5)
        call SaveEffectHandle(ht, GetHandleId(z) , 5, bj_lastCreatedEffect)
        set e4 = bj_lastCreatedEffect
        call Effect("war3mapimported\\[A]ChuShou_Blue1.mdx", GetUnitX(c) , GetUnitY(c) , 80, a + 180, - 90, 0, 1.5, 5, PercentTo255(30) , PercentTo255(30) , PercentTo255(30) , PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect , 3)
        call SaveEffectHandle(ht, GetHandleId(z) , 6, bj_lastCreatedEffect)
        set e5 = bj_lastCreatedEffect
    endif
    if count >= 450 then
        call SetEffectX(e2 , PolarX(GetUnitX(c) , - 150, a))
        call SetEffectY(e2 , PolarY(GetUnitY(c) , - 150, a))
        call SetSpecialEffectZ(e2, 25 + GetAxisZ(GetEffectX(e2) , GetEffectY(e2)))
        call SetEffectX(e3 , PolarX(GetUnitX(c) , - 150, a))
        call SetEffectY(e3 , PolarY(GetUnitY(c) , - 150, a))
        call SetSpecialEffectZ(e3, 25 + GetAxisZ(GetEffectX(e3) , GetEffectY(e3)))
        call SetEffectX(e4 , PolarX(GetUnitX(c) , 10, a))
        call SetEffectY(e4 , PolarY(GetUnitY(c) , 10, a))
        call SetSpecialEffectZ(e4, 80 + GetAxisZ(GetEffectX(e4) , GetEffectY(e4)))
        call SetEffectX(e5 , PolarX(GetUnitX(c) , 10, a))
        call SetEffectY(e5 , PolarY(GetUnitY(c) , 10, a))
        call SetSpecialEffectZ(e5, 80 + GetAxisZ(GetEffectX(e5) , GetEffectY(e5)))
    endif
    if count == 480 then
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.75, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2) 
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 1.55, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.75, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.65, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
    endif
    if count >= 480 and count <= 700 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x = PolarX(GetUnitX(c) , 100, a)
            set y = PolarY(GetUnitY(c) , 100, a)
            call Effect("war3mapimported\\wind3.mdx", x, y, 80, a, - 90, 0, 1.75, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.8, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\CF2.mdx", x, y, 25, a, 0, 0, GetRandomReal(0.65, 1) , 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(50, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.8)) 
        endif
    endif
    if count == 530 then
        call SoundStart("war3mapImported\\Rin_5-2.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call SetUnitTimeScale(c, 1)
    endif
    if count == 640 then
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitTimeScale(c, 0.4)
    endif
    if count == 710 then
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]RinRfire2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]RinRfire2.mdx", GetUnitX(t) , GetUnitY(t) , 80, a + 180, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", x, y, 80, a + 180, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\[A]RinRfire2.mdx", x, y, 80, a + 180, - 90, 0, 1.3, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", x, y, 80, a + 180, - 90, 0, 1.3, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)  
        call Effect("war3mapimported\\[A]GongChengBlue.mdx", x, y, 25, a, 0, 0, 4, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3) 
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 2.3, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 740 then 
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
    set e2 = null
    set e3 = null
    set e4 = null
    set e5 = null
endfunction

function Trig_RinT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08Q' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_RinT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RinT takes nothing returns nothing
    set gg_trg_RinT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RinT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RinT, function Trig_RinT_Actions)
endfunction