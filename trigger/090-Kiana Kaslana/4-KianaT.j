//TESH.scrollpos=0
//TESH.alwaysfold=0
scope KianaT

    private struct Missile extends Missiles
        
    unit c
    integer i
                
    method onPeriod takes nothing returns boolean
        local real a = Angle(.x, .y, .impact.x, .impact.y)
        
        set i = i + 1
        if i == 1 then
            call Effect("war3mapimported\\GilgameshCircle.mdx", .x, .y, .z, a, .effect.pitch * bj_RADTODEG, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\az_hysbd.mdx", .x, .y, .z, a, .effect.pitch * bj_RADTODEG, 0, 1, 1, 255, 255, 255, 255)
        endif
            
        return false
    endmethod
                
    method onRemove takes nothing returns nothing
        call Effect("war3mapimported\\flamestrike i.mdx", .x, .y, 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, .x , .y , 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 0.8 * GetHeroInt(c, true))
                call IssueImmediateOrderById(gUnit, 851972)
            endif
        endloop
        call GroupClear(gGroup)
        set c = null
    endmethod

endstruct
    
function Trig_KianaT_Func001 takes nothing returns nothing
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
    local effect e
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kiana_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 5, GetUnitX(c), GetUnitY(c))
        call CinematicFilterGenericEx(GetOwningPlayer(c), 3, BLEND_MODE_BLEND, "war3mapImported\\kianat.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\kianat.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call UnitAddAbility(c, 'Amrf')  
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), - 1000, a)
        set y = PolarY(GetUnitY(t), - 1000, a)
        call Effect("war3mapimported\\Kiana.mdx", x, y, 0, a, 0, 0, 1, 4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count <= 20 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectZ(e, GetEffectZ(e) + 20)
    endif
    if count == 40 or count == 70 or count == 100 or count == 130 or count == 160 then
        call SoundStart("war3mapImported\\Effect_Sound5.mp3")
    endif
    if count >= 20 and count <= 200 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set a = Angle(GetEffectX(e) , GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
        call SetSpecialEffectOrientation(e, a, 0, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 12 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetEffectX(e), GetRandomReal(50, 400), a + 90)
            set y = PolarY(GetEffectY(e), GetRandomReal(50, 400), a + 90)
            set x1 = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y1 = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            set move = Missile.create(x, y, GetRandomReal(300, 500), x1, y1, 0)
            set move.c = c
            set move.i = 0
            set move.duration = 0.3
            set move.model = "war3mapimported\\kiana_spears.mdx"
            call SetSpecialEffectAnimationByIndex(move.effect.effect, 2)
            call SetSpecialEffectTimeScale(move.effect.effect, 2)
            call move.launch()
            set x = PolarX(GetEffectX(e), GetRandomReal(50, 400), a - 90)
            set y = PolarY(GetEffectY(e), GetRandomReal(50, 400), a - 90)
            set x1 = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y1 = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            set move = Missile.create(x, y, GetRandomReal(300, 500), x1, y1, 0)
            set move.c = c
            set move.i = 0
            set move.duration = 0.3
            set move.model = "war3mapimported\\kiana_spears.mdx"
            call SetSpecialEffectAnimationByIndex(move.effect.effect, 2)
            call SetSpecialEffectTimeScale(move.effect.effect, 2)
            call move.launch()
        endif
    endif
    if count == 200 then 
        call SetUnitFlyHeight(c, 0, 0)
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

function Trig_KianaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09D' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KianaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KianaT takes nothing returns nothing
    set gg_trg_KianaT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KianaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KianaT, function Trig_KianaT_Actions)
endfunction