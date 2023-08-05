//TESH.scrollpos=0
//TESH.alwaysfold=0
scope ShanaE
    private struct Missile extends Missiles
    
    unit c
    
    method onPeriod takes nothing returns boolean

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call SoundStart("war3mapImported\\Shana_3-1.mp3")
        call Effect("war3mapimported\\firebbic.mdx", .x, .y, 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 5)
        call DamageUnit(c, .target, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0C3') * GetHeroInt(c, true)))
        set c = null
    endmethod
    
endstruct
function Trig_ShanaE_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Shana_3.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitTimeScale(c, 1.25)
        call SetUnitAnimationByIndex(c, 9)
        call Effect("war3mapImported\\s_RunningFlame Aura.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 1.4, 2, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and IsUnitType(gUnit, UNIT_TYPE_HERO) then
                set move = Missile.create(GetUnitX(c), GetUnitY(c), 0, GetUnitX(gUnit), GetUnitY(gUnit), 0)
                set move.c = c
                set move.target = gUnit
                set move.speed = 900
                set move.model = "war3mapimported\\Dota_Effect_lina_longpozhan.mdx"
                set move.scale = 1.5
                call move.launch()
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

function Trig_ShanaE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0C3' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ShanaE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ShanaE takes nothing returns nothing
    set gg_trg_ShanaE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShanaE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ShanaE, function Trig_ShanaE_Actions )
endfunction