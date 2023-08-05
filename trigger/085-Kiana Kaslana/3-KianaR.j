//TESH.scrollpos=0
//TESH.alwaysfold=0
scope KianaR

    private struct Missile extends Missiles
        
    unit c
    integer i
                
    method onPeriod takes nothing returns boolean
        local real a = Angle(.x, .y, .impact.x, .impact.y)
        
        set i = i + 1
        if i == 1 then
            call Effect("war3mapimported\\az_hysbd.mdx", .x, .y, .z, a, .effect.pitch * bj_RADTODEG, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
            
        return false
    endmethod
                
    method onRemove takes nothing returns nothing
        call Effect("war3mapimported\\flamestrike i.mdx", .x, .y, 25, randomAngle(), 0, 0, 1.35, 1.5, 255, 255, 255, 255)
        set c = null
    endmethod

endstruct

function Trig_KianaR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local Missile move
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
        call SoundStart("war3mapImported\\Kiana_4.mp3")
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 20 then
        call Effect("war3mapimported\\rasenganodama.mdx", GetUnitX(t), GetUnitY(t), 400, a, 0, 0, 1, 5, 255, 100, 255, 255)
    endif
    if count >= 20 and count <= 260 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
            call Effect("war3mapimported\\supershinythingypurple.mdx", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, GetRandomReal(0.85, 1.9), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(0.75, 1.45), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Kiana_4-1.mp3")
        call Effect("war3mapimported\\BlackHoleSSS.mdx", GetUnitX(t), GetUnitY(t), 120, randomAngle(), 0, 0, 1, 4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 4, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Kiana_4-2.mp3")
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Kiana_4-3.mp3")
        call SetUnitAnimationByIndex(c, 0)
        loop
            exitwhen i > 11
            set x = PolarX(GetUnitX(t), GetRandomReal(700, 1200), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(700, 1200), randomAngle())
            set x1 = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
            set y1 = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
            set move = Missile.create(x, y, GetRandomReal(300, 550), x1, y1, 0)
            set move.c = c
            set move.i = 0
            set move.duration = 0.6
            call VisionArea(GetOwningPlayer(c) , 400, 3, x , y)
            call Effect("war3mapimported\\GilgameshCircle.mdx", move.origin.x, move.origin.y, move.origin.z, move.origin.angle * bj_RADTODEG, move.origin.alpha * bj_RADTODEG, 0, 2, 1.5, 255, 255, 255, 255)
            call SaveInteger(ht, GetHandleId(z), 2 + i, move)
            set i = i + 1
        endloop
    endif
    if count == 200 then
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 220 then
        loop
            exitwhen i > 11
            set move = LoadInteger(ht, GetHandleId(z), 2 + i)
            set move.model = "war3mapimported\\kiana_spears.mdx"
            set move.animation = 1
            set move.timeScale = 1.2
            call move.launch()
            set i = i + 1
        endloop
    endif
    if count == 265 then
        call SoundStart("war3mapImported\\Effect_Sound5.mp3")
    endif
    if count == 270 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A09B')) * GetHeroInt(c, true))
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

function Trig_KianaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09B' then 
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
        call TimerStart(z, 0.02, true, function Trig_KianaR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KianaR takes nothing returns nothing
    set gg_trg_KianaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KianaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KianaR, function Trig_KianaR_Actions)
endfunction