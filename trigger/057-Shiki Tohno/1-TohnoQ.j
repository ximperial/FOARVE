//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_TohnoQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tohno_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 12)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\Tohno.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 0.6, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 4 or count == 8 or count == 12 then
        call SoundStart("war3mapImported\\Tohno_1-2.mp3")
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e), 80, a)
        set y = PolarY(GetEffectY(e), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call Effect("war3mapImported\\kiritoslash.mdx", GetUnitX(gUnit), GetUnitY(gUnit), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A061'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetEffectX(e), GetEffectY(e), 120, a, 0, 0, GetRandomReal(1.2, 1.7), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetEffectX(e), GetEffectY(e), 120, a, - 20, 0, GetRandomReal(1.2, 1.7), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetEffectX(e), GetEffectY(e), 120, a, - 340, 0, GetRandomReal(1.2, 1.7), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            else
                call Effect("war3mapimported\\qzzz.mdx", GetEffectX(e), GetEffectY(e), 120, a, - 320, 0, GetRandomReal(1.2, 1.7), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
            call Effect("war3mapimported\\kiritoslash.mdx", GetEffectX(e), GetEffectY(e), 80, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\tx_white2.mdx", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 0.6, 1, 0, 0, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\Tohno.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 1, 0.6, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
        endif
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Tohno_1-1.mp3")
        if Distance(GetEffectX(e), GetEffectY(e), GetUnitX(c), GetUnitY(c)) < 1400 then
            call SetUnitX(c, GetEffectX(e))
            call SetUnitY(c, GetEffectY(e))
        endif
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call Effect("war3mapimported\\cleave.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 0, 0, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
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
    set e = null
    set g = null
endfunction

function Trig_TohnoQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A061' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_TohnoQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_TohnoQ takes nothing returns nothing
    set gg_trg_TohnoQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohnoQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TohnoQ, function Trig_TohnoQ_Actions )
endfunction