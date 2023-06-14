//TESH.scrollpos=154
//TESH.alwaysfold=0
function Trig_JotaroF_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_JotaroF_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 3)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 2)
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
        call SoundStart("war3mapImported\\Jotaro_6.mp3")
        set x = PolarX(GetUnitX(c), 70, a - 120)
        set y = PolarY(GetUnitY(c), 70, a - 120)
        call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind2.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 9.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count == 100 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call SetSpecialEffectAnimationByIndex(e, 5)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 3.2, 8.4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 1.2, 1.8, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2, 1.4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SaveEffectHandle(ht, GetHandleId(z), 7, bj_lastCreatedEffect)
    endif
    if count >= 100 and count <= 140 then
        set i = 4
        loop
            exitwhen i > 7
            call SetSpecialEffectVertexColour(LoadEffectHandle(ht, GetHandleId(z), i), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(40, 60)))
            set i = i + 1
        endloop
    endif
    if count >= 100 and count <= 380 then
        if count <= 140 then
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), (count - 100) * 30, null)
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
            call SetEffectX(e, PolarX(GetUnitX(c), - 120, a))
            call SetEffectY(e, PolarY(GetUnitY(c), - 120, a))
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
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
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 150, 150), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 150, 150), randomAngle())
                call Effect("war3mapimported\\Hit.mdx", x, y, 125, randomAngle(), - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
                call Effect("war3mapimported\\wavejojo.mdx", x, y, 125, randomAngle(), - 45, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\Ikadt1white.mdx", x, y, 125, randomAngle(), - 45, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            endif
        endif
    endif
    if count == 140 then
        call SoundStart("war3mapImported\\Jotaro_6-1.mp3")
        call SetSpecialEffectAnimationByIndex(e, 7)
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 7), 1)
    endif
    if count == 160 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 6), 1)
    endif
    if count == 180 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 5), 1)
    endif
    if count == 380 then
        call SoundStart("war3mapImported\\Jotaro_6-2.mp3")
    endif
    if count == 410 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 4), 1)
    endif
    if count == 450 then
        call ForGroup(g, function Trig_JotaroF_Func002)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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
    set g = null
endfunction

function Trig_JotaroF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A02U' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_JotaroF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_JotaroF takes nothing returns nothing
    set gg_trg_JotaroF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JotaroF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_JotaroF, function Trig_JotaroF_Actions )
endfunction