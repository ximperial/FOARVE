//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_SistinaD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Sistina_7.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 140, a))
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 0.9)
    endif
    if count == 5 then
        call SetUnitFacing(c, a)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Yomi_5-2.mp3")
        call Effect("war3mapimported\\123 (383)_2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        loop
            exitwhen i > 5
            set x = PolarX(GetUnitX(t), 300, i * 60)
            set y = PolarY(GetUnitY(t), 300, i * 60)
            call Effect("war3mapimported\\sistinaboom.mdx", x, y, 25, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set i = i + 1
        endloop
    endif
    if count == 25 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
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

function Trig_SistinaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HE' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_SistinaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_SistinaD takes nothing returns nothing
    set gg_trg_SistinaD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SistinaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_SistinaD, function Trig_SistinaD_Actions)
endfunction