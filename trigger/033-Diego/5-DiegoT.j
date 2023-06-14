//TESH.scrollpos=9
//TESH.alwaysfold=0
scope DiegoT

private struct Missile extends Missiles
        
unit c
effect e
boolean b
            
method onPeriod takes nothing returns boolean
    call SetSpecialEffectPositionEx(e, .x, .y, .z)
                
    return false
endmethod
            
method onRemove takes nothing returns nothing
    local integer pid
    local string s = ""
    if b then
        call Effect("war3mapImported\\[A]bloodex.mdl", .x, .y, 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
    endif
    set c = null
    set e = null
    set b = false
endmethod
            
endstruct
    
function Trig_DiegoT_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction
    
function Trig_DiegoT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 3)
    local effect e2
    local real x
    local real y
    local real z1
    local real x1
    local real y1
    local group g = LoadGroupHandle(ht, GetHandleId(z), 2)
    local integer i = 0
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Diego_5.mp3")
        set x = PolarX(GetUnitX(c), 70, a - 120)
        set y = PolarY(GetUnitY(c), 70, a - 120)
        call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind2.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, a, 0, 0, 1, 9, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 3.2, 9.2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 1.1, 1.8, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 1.9, 1.4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.6, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SaveEffectHandle(ht, GetHandleId(z), 7, bj_lastCreatedEffect)
    endif
    if count <= 40 then
        set i = 4
        loop
            exitwhen i > 7
            call SetSpecialEffectVertexColour(LoadEffectHandle(ht, GetHandleId(z), i), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(40, 60)))
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Diego_5-1.mp3")
    endif
    if count == 200 then
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count >= 200 and count <= 290 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(1000, 1400), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(1000, 1400), randomAngle())
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set x1 = PolarX(GetUnitX(t), GetRandomReal(- 500, - 300), a)
            set y1 = PolarY(GetUnitY(t), GetRandomReal(- 500, - 300), a)
            set z1 = GetRandomReal(900, 1500)
            set move = Missile.create(x, y, z1, x1, y1, GetRandomReal(500, 700))
            set move.c = c
            set move.duration = 0.6
            call Effect("war3mapImported\\[DoFT]DiegoKnife.mdl", x, y, z1, a, - 45, 0, 3, 6.2 - LoadInteger(ht, GetHandleId(z), 2) * 0.04, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 8 + LoadInteger(ht, GetHandleId(z), 2), bj_lastCreatedEffect)
            set move.e = bj_lastCreatedEffect
            call move.launch()
            call SaveInteger(ht, GetHandleId(z), 2, LoadInteger(ht, GetHandleId(z), 2) + 1)
        endif
    endif
    if count >= 440 and count <= 469 then
        set e2 = LoadEffectHandle(ht, GetHandleId(z), 8 + LoadInteger(ht, GetHandleId(z), 3))
        set a = Angle(GetEffectX(e2), GetEffectY(e2), GetUnitX(t), GetUnitY(t))
        set x = PolarX(GetUnitX(t), GetRandomReal(50, 300), a)
        set y = PolarY(GetUnitY(t), GetRandomReal(50, 300), a)
        set move = Missile.create(GetEffectX(e2), GetEffectY(e2), GetEffectZ(e2), x, y, 0)
        set move.c = c
        set move.duration = 0.4
        set move.e = e2
        set move.b = true
        call move.launch()
        call SaveInteger(ht, GetHandleId(z), 3, LoadInteger(ht, GetHandleId(z), 3) + 1)
    endif
    if count <= 450 then
        if count <= 40 then
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), count * 30, null)
            call GroupRemoveUnit(gGroup, c)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        else
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 1200, null)
            call GroupRemoveUnit(gGroup, c)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        endif
    endif
    if count == 40 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 7), 1)
    endif
    if count == 60 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 6), 1)
    endif
    if count == 80 then
        call SetSpecialEffectVertexColour(e, 255, 255, 255, 0)
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 5), 1)
    endif
    if count == 450 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 4), 1)
    endif
    if count == 500 then
        call ForGroup(g, function Trig_DiegoT_Func002)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
    set g = null
    set e2 = null
endfunction
endscope
    
function Trig_DiegoT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0D3' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 0)
        call SaveInteger(ht, GetHandleId(z), 3, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_DiegoT_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_DiegoT takes nothing returns nothing
    set gg_trg_DiegoT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_DiegoT, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_DiegoT, function Trig_DiegoT_Actions )
endfunction