//TESH.scrollpos=0
//TESH.alwaysfold=0
scope ZweiE

    private struct Missile extends Missiles
    
    unit c
    effect e
    integer i
    
    method onPeriod takes nothing returns boolean
        call SetSpecialEffectPositionEx(e, .x, .y, .z)
        call SetSpecialEffectOrientation(e, .effect.yaw, .effect.pitch, .effect.roll)
        
        set i = i + 1
        if i == 24 then
            call SetSpecialEffectAnimationByIndex(.effect.effect, 1)
        endif
        
        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call Effect("war3mapimported\\cursebolt.mdx", .x, .y, .z, randomAngle(), 0, 0, GetRandomReal(2, 3), 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set c = null
        set e = null
    endmethod
    
endstruct

function Trig_ZweiE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real ux
    local real uy
    local real x
    local real y
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local real randomA
    local Missile move
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Reinforce_3.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        set ux = GetUnitX(t)
        set uy = GetUnitY(t)
        call SetUnitX(c, PolarX(ux, -700, a))
        call SetUnitY(c, PolarY(uy, -700, a))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\VoidDrown.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
        call Effect("war3mapimported\\windcaotic2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count <= 40 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set ux = GetUnitX(c)
            set uy = GetUnitY(c)
            set randomA = randomAngle()
            set x1 = PolarX(ux, -100, a)
            set y1 = PolarY(uy, -100, a)
            set x = PolarX(x1, GetRandomReal(-50, 150), randomA)
            set y = PolarY(y1, GetRandomReal(-50, 150), randomA)
            set ux = GetUnitX(t)
            set uy = GetUnitY(t)
            set randomA = randomAngle()
            set x1 = PolarX(ux, GetRandomReal(-50, 200), randomA)
            set y1 = PolarY(uy, GetRandomReal(-50, 200), randomA)
            set randomA = GetRandomReal(50, 125)
            set move = Missile.create(x, y, 0, x1, y1, randomA)
            set move.c = c
            set move.i = 0
            set move.duration = 1
            set move.curve = LoadReal(ht, GetHandleId(z), 0)
            set move.arc = 40
            set move.model = "war3mapImported\\sfeidao.mdx"
            set move.scale = 1.5
            set move.animation = 3
            set move.timeScale = 2
            call SetSpecialEffectVertexColour(move.effect.effect, 255, 0, 0, 255)
            call Effect("war3mapimported\\buff_bai-red.mdx", move.origin.x, move.origin.y, move.origin.z, randomAngle(), 0, 0, 1.5, 1.4, 255, 255, 255, 255)
            set move.e = bj_lastCreatedEffect
            call move.launch()
            call SaveReal(ht, GetHandleId(z), 0, -LoadReal(ht, GetHandleId(z), 0))
        endif
    endif
    if count == 55 or count == 70 or count == 85 then
        call SoundStart("war3mapImported\\Reinforce_3-1.mp3")
    endif
    if count == 70 then
        call Effect("war3mapImported\\VoidDrown.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
    endif
    if count == 80 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\PurpleExplode.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\A7_zisekuosan.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapImported\\ShockwavePurple.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 90 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A09H')) * GetHeroInt(c, true))
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
    set e = null
endfunction

endscope

function Trig_ZweiE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09H' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, 25)
        call TimerStart(z, 0.02, true, function Trig_ZweiE_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ZweiE takes nothing returns nothing
    set gg_trg_ZweiE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ZweiE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ZweiE, function Trig_ZweiE_Actions)
endfunction