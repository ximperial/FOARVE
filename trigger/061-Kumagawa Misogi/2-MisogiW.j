//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisogiW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Misogi_2.mp3")
        call SetUnitAnimation(c, "spell one")
        call SetUnitTimeScale(c, 1.25)
        call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.4, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\SuperShinyThingy2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.6, 1, 0, 0, 0, PercentTo255(40))
    endif
    if count <= 30 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 25, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 25, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Misogi_2-1.mp3")
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapimported\\SuperShinyThingy2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.6, 1, 0, 0, 0, PercentTo255(40))
        call Effect("war3mapimported\\[A]blackstrike.mdx", PolarX(GetUnitX(t) , 100, a) , PolarY(GetUnitY(t) , 100, a) , 40, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]DarkBlast.mdx", PolarX(GetUnitX(c) , 50, a) , PolarY(GetUnitY(c) , 50, a) , 100, a, - 90, 0, 0.9, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", PolarX(GetUnitX(c) , 50, a) , PolarY(GetUnitY(c) , 50, a) , 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A087')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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
endfunction

function Trig_MisogiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A087' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MisogiW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisogiW takes nothing returns nothing
    set gg_trg_MisogiW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisogiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisogiW, function Trig_MisogiW_Actions)
endfunction