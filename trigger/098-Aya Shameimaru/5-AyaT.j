//TESH.scrollpos=0
//TESH.alwaysfold=0
scope AyaT
    private struct Missile extends Missiles
    
    unit c
    
    method onPeriod takes nothing returns boolean

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        set c = null
    endmethod
    
endstruct
function Trig_AyaT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 1
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Aya_5.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 3, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Aya_5-1.mp3")
        loop
            exitwhen i > 3
            set x = PolarX(GetUnitX(c), 90 * i, a + 90)
            set y = PolarY(GetUnitY(c), 90 * i, a + 90)
            set move = Missile.create(x, y, 0, GetUnitX(t), GetUnitY(t), 0)
            set move.c = c
            set move.duration = 0.6875
            set move.curve = 20
            set move.model = "war3mapimported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx"
            set move.timeScale = 1.75
            call move.launch()
            set x = PolarX(GetUnitX(c), 90 * i, a - 90)
            set y = PolarY(GetUnitY(c), 90 * i, a - 90)
            set move = Missile.create(x, y, 0, GetUnitX(t), GetUnitY(t), 0)
            set move.c = c
            set move.duration = 0.6875
            set move.curve = -20
            set move.model = "war3mapimported\\ChuShou_BY_Wood_Effect_Wind_xuanfeng.mdx"
            set move.timeScale = 1.75
            call move.launch()
            set i = i + 1
        endloop
    endif
    if count == 25 then
        call SoundStart("war3mapImported\\Aya_5-2.mp3")
    endif
    if count == 50 then 
        call Effect("war3mapImported\\zxd6.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
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
endscope

function Trig_AyaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0F5' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AyaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AyaT takes nothing returns nothing
    set gg_trg_AyaT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AyaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AyaT, function Trig_AyaT_Actions)
endfunction