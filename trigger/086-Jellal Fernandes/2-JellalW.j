//TESH.scrollpos=0
//TESH.alwaysfold=0
scope JellalW

    private struct Missile extends Missiles
        
    unit c
                
    method onPeriod takes nothing returns boolean

        return false
    endmethod
                
    method onRemove takes nothing returns nothing

        set c = null
    endmethod

endstruct

function Trig_JellalW_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Jellal_2.mp3")
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count == 10 then
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 50, GetUnitX(t), GetUnitY(t), 50)
        set move.c = c
        set move.target = t
        set move.duration = 0.6
        set move.curve = 25
        set move.model = "war3mapimported\\mbdm2.mdx"
        call SaveInteger(ht, GetHandleId(z), 2, move)
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 50, GetUnitX(t), GetUnitY(t), 50)
        set move.c = c
        set move.target = t
        set move.duration = 0.6
        set move.curve = 15
        set move.model = "war3mapimported\\mbdm2.mdx"
        call SaveInteger(ht, GetHandleId(z), 3, move)
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 50, GetUnitX(t), GetUnitY(t), 50)
        set move.c = c
        set move.target = t
        set move.duration = 0.6
        set move.curve = - 25
        set move.model = "war3mapimported\\mbdm2.mdx"
        call SaveInteger(ht, GetHandleId(z), 4, move)
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 50, GetUnitX(t), GetUnitY(t), 50)
        set move.c = c
        set move.target = t
        set move.duration = 0.6
        set move.curve = - 15
        set move.model = "war3mapimported\\mbdm2.mdx"
        call SaveInteger(ht, GetHandleId(z), 5, move)
    endif
    if count == 15 then
        loop
            exitwhen i > 3
            set move = LoadInteger(ht, GetHandleId(z), 2 + i)
            call move.launch()
            set i = i + 1
        endloop
    endif
    if count == 45 then
        call SoundStart("war3mapImported\\miniexplode.mp3")
        call Effect("war3mapimported\\by_wood_effect_yuzhiboyou_unusual_fenshendabaopo_2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 50 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A077')) * GetHeroInt(c, true))
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

function Trig_JellalW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A077' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_JellalW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_JellalW takes nothing returns nothing
    set gg_trg_JellalW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JellalW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_JellalW, function Trig_JellalW_Actions)
endfunction