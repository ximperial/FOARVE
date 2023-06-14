//TESH.scrollpos=0
//TESH.alwaysfold=0
scope MystoD
    private struct Missile extends Missiles
    
    unit c
    
    method onPeriod takes nothing returns boolean

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call SoundStart("war3mapImported\\miniexplode.mp3")
        call Effect("war3mapimported\\by_wood_effect_yuzhiboyou_unusual_fenshendabaopo_2.mdx", .x, .y, 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call DamageUnit(c, .target, 8 * GetHeroInt(c, true))
        set c = null
    endmethod
    
endstruct
function Trig_MystoD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Mysto_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 1.5)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and IsUnitType(gUnit, UNIT_TYPE_HERO) then
                set move = Missile.create(GetUnitX(c), GetUnitY(c), 0, GetUnitX(gUnit), GetUnitY(gUnit), 0)
                set move.c = c
                set move.target = gUnit
                set move.speed = 1100
                set move.curve = LoadInteger(ht, GetHandleId(z), 2)
                set move.model = "war3mapimported\\mbdm2.mdx"
                set move.scale = 2
                call move.launch()
                call SaveInteger(ht, GetHandleId(z), 2, -LoadInteger(ht, GetHandleId(z), 2))
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 10 then
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

function Trig_MystoD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0DU' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 10)
        call TimerStart(z, 0.02, true, function Trig_MystoD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MystoD takes nothing returns nothing
    set gg_trg_MystoD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MystoD, function Trig_MystoD_Actions )
endfunction