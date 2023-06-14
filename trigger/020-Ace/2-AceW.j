//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_AceW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ace_2.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call SetUnitTimeScale(c, 0.25)
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\[A]AceFireShockRun.mdx", c, "left hand"))
        call SaveEffectHandle(ht, GetHandleId(z), 3, AddSpecialEffectTarget("war3mapImported\\[A]AceFireShockRun.mdx", c, "right hand"))
        call Effect("war3mapImported\\[A]Natsu roar 3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\RedHarvest.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 30 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 1)
    endif
    if count == 40 then
        call Effect("war3mapImported\\[A]Natsu roar 3.mdl", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]File00002800.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ethereal Lightning.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 50 then
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0AB')) * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_AceW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0AB' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AceW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction
    
//===========================================================================
function InitTrig_AceW takes nothing returns nothing
    set gg_trg_AceW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AceW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AceW, function Trig_AceW_Actions )
endfunction