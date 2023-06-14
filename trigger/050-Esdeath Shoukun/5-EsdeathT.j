//TESH.scrollpos=12
//TESH.alwaysfold=0
function Trig_EsdeathT_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_EsdeathT_Func001 takes nothing returns nothing
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
    local group g = LoadGroupHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Esdeath_5.mp3")
        call SetUnitAnimationByIndex(c, 1)
        call Effect("war3mapImported\\[Plagiat]Effect309.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 10, 2.6, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 75 then
        call SoundStart("war3mapImported\\Esdeath_5-1.mp3")
    endif
    if count == 120 then
        call Effect("war3mapImported\\[Plagiat]Effect392.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.6), 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.65, 1))
        call Effect("war3mapImported\\[Plagiat]Effect392.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.6), 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.65, 1))
        call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call TimeScaleEffect(bj_lastCreatedEffect, 0.65, 1)
    endif
    if count >= 20 and count <= 130 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(t), GetUnitY(t), 1200, null)
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
    if count == 130 then
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call ForGroup(g, function Trig_EsdeathT_Func002)
        call DestroyGroup(g)
    endif
    if count == 140 then
        call Effect("war3mapImported\\FreezingRing.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapImported\\[Plagiat]Effect249.mdl", GetUnitX(t), GetUnitY(t), 25, a + 180, 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 10, a, 0, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
        call Effect("war3mapImported\\afbbxks.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    endif
    if count == 150 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_EsdeathT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A041' then 
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
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_EsdeathT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EsdeathT takes nothing returns nothing
    set gg_trg_EsdeathT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EsdeathT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EsdeathT, function Trig_EsdeathT_Actions )
endfunction