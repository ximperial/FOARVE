//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_CronusT_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_CronusT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
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
        call SoundStart("war3mapImported\\Cronus_5.mp3")
        call SoundStart("war3mapImported\\Cronus_5-6.mp3")
        call CinematicFilterGenericEx(GetOwningPlayer(c), 2, BLEND_MODE_BLEND, "war3mapImported\\cronust2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\cronust2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 1000, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 1000, a))
        call SetUnitAnimationByIndex(c, 23)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2.2, 16, 255, 255, 255, PercentTo255(50))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapImported\\TX_25white first.mdl", GetUnitX(t), GetUnitY(t), 125, randomAngle(), 0, 0, 5, 16, 0, 255, 0, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        call TimeScaleEffect(bj_lastCreatedEffect, 0.6, 14.2)
        call AnimEffect(bj_lastCreatedEffect, 1, 14.2)
    endif
    if count >= 30 and count <= 710 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(t), GetUnitY(t), 1000, null)
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
    if count == 110 then
        call SoundStart("war3mapImported\\Cronus_3.mp3")
        call SetUnitAnimationByIndex(c, 21)
    endif
    if count == 190 then
        call SoundStart("war3mapImported\\Cronus_5-1.mp3")
    endif
    if count == 240 then
        call SoundStart("war3mapImported\\Cronus_5-2.mp3")
        call SetUnitAnimationByIndex(c, 12)
        call SetUnitTimeScale(c, 0.8)
        call Effect("war3mapImported\\ltszmt.mdl", PolarX(GetUnitX(t), - 80, a), PolarY(GetUnitY(t), - 80, a), 25, a, 0, 0, 1.5, 5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.01)
        call TimeScaleEffect(bj_lastCreatedEffect, 0.7, 3)
    endif
    if count >= 240 and count <= 380 then
        call SetUnitX(c, PolarX(GetUnitX(c), 6, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 6, a))
    endif
    if count == 390 then
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 0.4)
        call CinematicFilterGenericEx(GetOwningPlayer(c), 3, BLEND_MODE_BLEND, "war3mapImported\\cronust.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\cronust.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
    endif
    if count == 440 then
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapImported\\az_pafeathermoon_c_caster.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 4, 1.6, 0, 255, 0, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0.2)
        call Effect("war3mapImported\\afbzd.mdl", GetUnitX(t), GetUnitY(t), 80, a, 0, 0, 3, 1.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0.7)
        call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 180, a + 180, 0, 0, 1.4, 7.2, 255, 255, 255, 0)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0)
        call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 180, a, 0, 0, 1.6, 4.5, 255, 255, 255, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0)
        call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.8, 1.9, 255, 255, 255, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0.6)
    endif
    if count == 560 then
        call SoundStart("war3mapImported\\Cronus_5-3.mp3")
    endif
    if count == 710 then
        call SoundStart("war3mapImported\\Cronus_5-4.mp3")
        call ForGroup(g, function Trig_CronusT_Func002)
        call DestroyGroup(g)
    endif
    if count == 810 then
        call SoundStart("war3mapImported\\Cronus_5-5.mp3")
        call Effect("war3mapImported\\BY_Wood_Decade_RiderKick_Explode.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.2, 1.2, 255, 255, 255, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0.3)
    endif
    if count == 820 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set g = null
endfunction

function Trig_CronusT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05Y' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 3, CreateGroup())
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_CronusT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_CronusT takes nothing returns nothing
    set gg_trg_CronusT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_CronusT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_CronusT, function Trig_CronusT_Actions)
endfunction