//TESH.scrollpos=0
//TESH.alwaysfold=0
scope AkainuT
    private struct Missile extends Missiles
    
    unit c
        
    method onPeriod takes nothing returns boolean
    
        return false
    endmethod
        
    method onRemove takes nothing returns nothing
        call Effect("war3mapimported\\magmablast2.mdx", .x , .y , 100, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call GroupEnumUnitsInRange(gGroup, .x , .y , 450, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 0.55 * GetHeroAgi(c, true))
                call IssueImmediateOrderById(gUnit, 851972)
            endif 
        endloop
        call GroupClear(gGroup)
        set c = null
    endmethod
        
endstruct
function Trig_AkainuT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x = LoadReal(ht, GetHandleId(z) , 0)
    local real y = LoadReal(ht, GetHandleId(z) , 1)
    local real x1
    local real y1
    local real x2
    local real y2
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , x, y)
    local real dist
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Akainu_5.mp3")
        call SoundStart("war3mapImported\\Akainu_5-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x1 = PolarX(x, GetRandomReal(- 700, 700), randomAngle())
            set y1 = PolarY(y, GetRandomReal(- 700, 700), randomAngle())
            set x2 = PolarX(GetUnitX(c), GetRandomReal(- 700, - 1000), a + LoadInteger(ht, GetHandleId(z), 2))
            set y2 = PolarY(GetUnitY(c), GetRandomReal(- 700, - 1000), a + LoadInteger(ht, GetHandleId(z), 2))
            set move = Missile.create(x2, y2, 900, x1, y1, 20)
            set move.c = c
            set move.duration = 0.4
            set move.model = "war3mapImported\\magmablast2.mdx"
            set move.scale = 1.5
            call move.launch()
            call SaveInteger(ht, GetHandleId(z), 2, - LoadInteger(ht, GetHandleId(z), 2))
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 2000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.4)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 150 then
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction
endscope

function Trig_AkainuT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A01C' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 20)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AkainuT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_AkainuT takes nothing returns nothing
    set gg_trg_AkainuT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AkainuT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AkainuT, function Trig_AkainuT_Actions)
endfunction