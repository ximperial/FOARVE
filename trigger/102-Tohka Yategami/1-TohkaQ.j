//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TohkaQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tohka_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 2, 255, PercentTo255(60), 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapimported\\wind3.mdx", x, y, 75, a, - 90, 0, 1.5, 1.5, 255, PercentTo255(60), 255, PercentTo255(80))
        set x = PolarX(GetUnitX(c), 100, a)
        set y = PolarY(GetUnitY(c), 100, a)
        call Effect("war3mapimported\\rasengan_eff4.mdx", x, y, 25, randomAngle(), 0, 0, 0.6, 1.5, 255, PercentTo255(60), 255, PercentTo255(60))
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call Effect("war3mapimported\\CF2.mdx", x, y, 25, a, 0, 0, 0.6, 2, 255, PercentTo255(60), 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e) , 80, a)
        set y = PolarY(GetEffectY(e) , 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A046'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\wind3.mdx", GetEffectX(e), GetEffectY(e), 80, a, - 90, 0, GetRandomReal(0.75, 1.55), 1, 255, PercentTo255(60), 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
            set x = PolarX(GetEffectX(e) , 50, a)
            set y = PolarY(GetEffectY(e) , 50, a)
            call Effect("war3mapimported\\fireshockrun1(purple).mdx", x, y, 80, a, 0, 0, GetRandomReal(2.5, 3), 1, 255, PercentTo255(50), 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
            set x = PolarX(GetEffectX(e) , 50, a)
            set y = PolarY(GetEffectY(e) , 50, a)
            call Effect("war3mapimported\\NDEarthWave.mdx", x, y, - 200, a, 0, 0, 0.9, 1, 255, PercentTo255(50), 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.55)
            set x = PolarX(GetEffectX(e) , 50, a)
            set y = PolarY(GetEffectY(e) , 50, a)
            call Effect("war3mapimported\\fireshockrun1(purple).mdx", x, y, 50, a, 0, 0, GetRandomReal(1.25, 2), 1, 255, PercentTo255(50), 255, PercentTo255(70))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.85, 1.5))
        endif
    endif
    if count == 15 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e = null
endfunction

function Trig_TohkaQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A046' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_TohkaQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_TohkaQ takes nothing returns nothing
    set gg_trg_TohkaQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohkaQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_TohkaQ, function Trig_TohkaQ_Actions)
endfunction