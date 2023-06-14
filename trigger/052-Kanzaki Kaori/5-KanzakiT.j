//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KanzakiT_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kanzaki_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 1 or count == 5 or count == 15 or count == 30 or count == 50 or count == 85 or count == 110 or count == 125 or count == 230 or count == 245 then
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.6, 0.85), 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1)) 
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.3, 0.45), 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1)) 
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1)) 
    endif
    if count <= 15 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else 
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif 
    endif
    if count == 15 then
        call SetUnitAnimationByIndex(c, 7) 
        call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        call Effect("war3mapImported\\[A]Sand3.mdl", x, y, 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 15 and count <= 35 or count >= 50 and count <= 70 or count >= 85 and count <= 115 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
    endif
    if count == 35 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call SetUnitFacing(c, a + 180)
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count == 45 then
        call Effect("war3mapImported\\eros.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.6, 1.2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 70 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call SetUnitFacing(c, a + 180)
        call SetUnitAnimationByIndex(c, 13)
    endif
    if count == 80 then
        call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count >= 120 and count <= 160 then
        if dist > 140 then
            call SetUnitX(t, PolarX(GetUnitX(t), - 10, a))
            call SetUnitY(t, PolarY(GetUnitY(t), - 10, a)) 
            if count > 145 then
                call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
                call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a)) 
            endif
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\blue-daoguang-new.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(1, 2), 0.8, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.85))
        endif
    endif
    if count == 160 then
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("war3mapImported\\BerkaBlue.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 8, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
    endif
    if count == 170 or count == 190 or count == 210 then
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
    endif
    if count >= 160 and count <= 230 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\[A]blue-qiliu-daoguang.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), GetRandomReal(- 90, 0), 0, GetRandomReal(0.8, 1.75), 0.8, 204, 204, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.75))
            call Effect("war3mapImported\\[A]blue-qiliu-daoguang.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), GetRandomReal(- 90, 0), 0, GetRandomReal(1.2, 2.2), 0.8, 204, 204, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 0.85))
        endif
    endif
    if count == 230 then
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call SetUnitFacing(c, a + 180)
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 0.9)
    endif
    if count == 245 then
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\blue-toushewu.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
    endif
    if count == 250 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_KanzakiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06C' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KanzakiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KanzakiT takes nothing returns nothing
    set gg_trg_KanzakiT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KanzakiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KanzakiT, function Trig_KanzakiT_Actions )
endfunction