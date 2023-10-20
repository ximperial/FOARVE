//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    integer LeviEHash = StringHash("LeviE")
    integer LeviEXHash = StringHash("LeviEX")
    integer LeviEYHash = StringHash("LeviEY")
endglobals

function Trig_LeviE_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Levi_3.mp3")
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 0.8)
        call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 5 or count == 10 or count == 15 then
        call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 20 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 20 then
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 25 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0EK')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_LeviE_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local integer iterator2 = LoadInteger(ht, GetHandleId(z) , 2)
    local real x
    local real y
    local real a = GetUnitFacing(c)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Levi_3-1.mp3")
        call SaveSoundHandle(ht, GetHandleId(z), -1, dummySound)
        call CinematicFilterGenericEx(GetOwningPlayer(c), 2, BLEND_MODE_BLEND, "war3mapImported\\leviE2.tga", 255, 255, 255, 0, 255, 255, 255, 255)
        call SaveBoolean(ht, LeviEHash, GetHandleId(c), true)
        call SaveReal(ht, LeviEXHash, GetHandleId(c), GetUnitX(c))
        call SaveReal(ht, LeviEYHash, GetHandleId(c), GetUnitY(c))
        call StartAbilityCooldown(GetUnitAbility(c, 'A0EK'), 60)
    endif
    if count <= 250 + 50 * GetUnitAbilityLevel(c, 'A0EK') then
        set iterator2 = iterator2 + 1
        call SaveInteger(ht, GetHandleId(z), 2, iterator2)
        if iterator2 >= 4 then
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            call Effect("Abilities\\Weapons\\GryphonRiderMissile\\GryphonRiderMissileTarget.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 30, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 20 or iterator == 40 or iterator == 60 or iterator == 80 or iterator == 100 then 
            call SetUnitAnimationByIndex(c, 1)
        endif
        if iterator >= 100 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
    endif
    if count >= 250 + 50 * GetUnitAbilityLevel(c, 'A0EK') or not IsUnitAlive(c) then 
        if not IsUnitAlive(c) then
            call StopSound(LoadSoundHandle(ht, GetHandleId(z), -1), true, false)
        endif
        call RemoveSavedBoolean(ht, LeviEHash, GetHandleId(c))
        call RemoveSavedReal(ht, LeviEXHash, GetHandleId(c))
        call RemoveSavedReal(ht, LeviEYHash, GetHandleId(c))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_LeviE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0EK' then 
        set z = CreateTimer()
        if t != c then
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function Trig_LeviE_Func001)
        else
            call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveInteger(ht, GetHandleId(z) , 2, 0)
            call TimerStart(z, 0.02, true, function Trig_LeviE_Func002)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_LeviE takes nothing returns nothing
    set gg_trg_LeviE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LeviE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_LeviE, function Trig_LeviE_Actions)
endfunction