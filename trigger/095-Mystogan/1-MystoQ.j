//TESH.scrollpos=0
//TESH.alwaysfold=0
scope MystoQ
    private struct Missile extends Missiles
    
    unit c
    
    method onPeriod takes nothing returns boolean

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        set c = null
    endmethod
    
endstruct
function Trig_MystoQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Mysto_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 2)
        loop
            exitwhen i > 4
            set x1 = PolarX(x, 500, i * 72)
            set y1 = PolarY(y, 500, i * 72)
            set move = Missile.create(x1, y1, 25, x, y, 25)
            set move.c = c
            set move.duration = 0.2
            set move.arc = 60
            set move.model = "war3mapImported\\ArcaneMissileComplete.mdx"
            set move.scale = 3
            call move.launch()
            set i = i + 1
        endloop
    endif
    if count == 12 then
        call Effect("war3mapImported\\DTPurple.mdx", x, y, 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", x, y, 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdx", x, y, 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\OrbitalRay.mdx", x, y, 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0DO'))
            endif 
        endloop
        call GroupClear(gGroup)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction
endscope

function Trig_MystoQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0DO' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_MystoQ_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MystoQ takes nothing returns nothing
    set gg_trg_MystoQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MystoQ, function Trig_MystoQ_Actions )
endfunction