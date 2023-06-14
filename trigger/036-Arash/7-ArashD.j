//TESH.scrollpos=39
//TESH.alwaysfold=0
scope ArashD
    private struct Missile extends Missiles
    
    unit c
        
    method onPeriod takes nothing returns boolean
        return false
    endmethod
        
    method onRemove takes nothing returns nothing
        call SoundStart("war3mapImported\\Cronus_1-1.mp3")
        call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", .x, .y, 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call DamageUnit(c, .target, 1.3 * GetHeroStr(c, true))
        call IssueImmediateOrderById(.target, 851972)
        set c = null
    endmethod
        
endstruct

function Trig_ArashD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local effect e
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Arash_7.mp3")
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Arash_7-1.mp3")
        call SetUnitTimeScale(c, 2)
    endif
    if count >= 10 and count <= 90 then 
        call SetUnitFacing(c, a)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitAnimation(c, "attack")
            set move = Missile.create(GetUnitX(c), GetUnitY(c), 80, GetUnitX(t), GetUnitY(t), 80)
            set move.c = c
            set move.target = t
            set move.duration = 0.4
            set move.model = "war3mapImported\\by_wood_effect_qigongbo_lan.mdx"
            set move.scale = 2.2
            call move.launch()
        endif
    endif
    if count == 95 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueTargetOrderById(c, 851983, t)
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

function Trig_ArashD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HB' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ArashD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ArashD takes nothing returns nothing
    set gg_trg_ArashD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ArashD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ArashD, function Trig_ArashD_Actions )
endfunction