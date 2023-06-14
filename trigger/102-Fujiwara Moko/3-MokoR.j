//TESH.scrollpos=0
//TESH.alwaysfold=0
scope MokoR

    private struct Missile extends Missiles
    
    unit c
    effect e
    
    method onPeriod takes nothing returns boolean
        call SetSpecialEffectPositionEx(e, .x, .y, .z)
        
        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call SetSpecialEffectAnimation(e, "death")
        call Effect("war3mapImported\\az-zidan.mdl", .x, .y, 60, .origin.angle, 0, 0, 1.4, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        set c = null
        set e = null
    endmethod
    
endstruct
  
function Trig_MokoR_Func001 takes nothing returns nothing
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
    local Missile move
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Moko_4.mp3")
        call VisionArea(GetOwningPlayer(c) , 1200, 4, GetUnitX(t) , GetUnitY(t))
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(c))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(c))
        call SetUnitX(c, PolarX(GetUnitX(t), - 700, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 700, a))
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 25 or count == 45 or count == 65 or count == 85 then
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 20 or count == 60 then
        call SoundStart("war3mapImported\\Moko_2-1.mp3")
    endif
    if count <= 70 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set move = Missile.create(GetUnitX(c), GetUnitY(c), 60, GetUnitX(t), GetUnitY(t), 60)
            set move.c = c
            set move.duration = 0.4
            call Effect("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdx", move.x, move.y, move.z, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            set move.e = bj_lastCreatedEffect
            call move.launch()
        endif
    endif
    if count == 85 then
        call Effect("war3mapimported\\Dota_Effect_lina_longpozhan.mdx", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 85 and count <= 105 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        set x = PolarX(GetEffectX(e) , dist / 20, a)
        set y = PolarY(GetEffectY(e) , dist / 20, a)
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        call SetSpecialEffectZ(e, 80 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\qj3.mdx", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, GetRandomReal(1.3, 1.65), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Moko_1-1.mp3")
    endif
    if count == 105 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetSpecialEffectAnimation(e, "death")
        call Effect("war3mapImported\\LW11.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 110 then 
        call SetUnitX(c, LoadReal(ht, GetHandleId(z), 0))
        call SetUnitY(c, LoadReal(ht, GetHandleId(z), 1))
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0HX')) * GetHeroInt(c, true))
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
    set e = null
endfunction
  
endscope
  
function Trig_MokoR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HX' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MokoR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction
  
//===========================================================================
function InitTrig_MokoR takes nothing returns nothing
    set gg_trg_MokoR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MokoR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MokoR, function Trig_MokoR_Actions)
endfunction