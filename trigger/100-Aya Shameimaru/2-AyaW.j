//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AyaW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Aya_2.mp3")
        call SetUnitAnimationByIndex(c, 9)
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count <= 20 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(c), 36, a)
        set y = PolarY(GetUnitY(c), 36, a)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
            call Effect("war3mapimported\\glchj.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Aya_2-1.mp3")
    endif
    if count == 20 then
        call Effect("war3mapimported\\zxd5.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        loop
            exitwhen i > 5
            call Effect("war3mapimported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx", GetUnitX(t), GetUnitY(t), 0, i * 60, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
            call MoveEffect(bj_lastCreatedEffect, 40, 0.6, i * 60)
            set i = i + 1
        endloop
    endif
    if count == 25 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0F2')) * GetHeroInt(c, true))
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

function Trig_AyaW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0F2' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AyaW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AyaW takes nothing returns nothing
    set gg_trg_AyaW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AyaW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AyaW, function Trig_AyaW_Actions)
endfunction