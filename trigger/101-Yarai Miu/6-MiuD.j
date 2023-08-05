//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_MiuD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real a2
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local real randomA
    local effect e
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
        call SoundStart("war3mapImported\\Miu_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 6, GetUnitX(t), GetUnitY(t))
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call Effect("war3mapImported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), -700, a))
        call SetUnitY(c, PolarY(GetUnitY(t), -700, a))
        set a2 = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a2, true)
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a2, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
    endif
    if count == 30 or count == 60 or count == 90 or count == 120 then
        call Effect("war3mapImported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        set x = GetUnitX(t)
        set y = GetUnitY(t)
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(x, 700, randomA))
        call SetUnitY(c, PolarY(y, 700, randomA))
        set a2 = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a2, true)
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a2, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
    endif
    if count <= 20 or count >= 30 and count <= 50 or count >= 60 and count <= 80 or count >= 90 and count <= 110 or count >= 120 and count <= 140 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 10)
        set a2 = GetSpecialEffectYaw(e)
        set x = PolarX(GetEffectX(e), 35, a2)
        set y = PolarY(GetEffectY(e), 35, a2)
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, GetRandomReal(1.4, 2.25), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
    endif
    if count == 20 or count == 50 or count == 80 or count == 110 or count == 140 then
        call SoundStart("war3mapImported\\Miu_4-1.mp3")
        call Effect("war3mapImported\\26.mdx", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
    endif
    if count == 150 then
        call Effect("war3mapImported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        set x = GetUnitX(t)
        set y = GetUnitY(t)
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(x, 820, randomA))
        call SetUnitY(c, PolarY(y, 820, randomA))
        set a2 = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a2, true)
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 1)
    endif
    if count == 200 then
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 0.5)
    endif
    if count >= 200 and count <= 250 then
        call SetUnitX(c, PolarX(GetUnitX(c), 14, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 14, a))
    endif
    if count == 250 then
        call SetUnitAnimationByIndex(c, 9)
    endif
    if count == 280 then
        call SoundStart("war3mapImported\\Miu_1-2.mp3")
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\Ethereal Lightning.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 300 then
        loop
            exitwhen i > 7
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", GetUnitX(t), GetUnitY(t), 50 + 150 * i, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        
            set i = i + 1
        endloop
    endif
    if count == 310 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroInt(c, true))
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
    set e = null
endfunction

function Trig_MiuD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GQ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_MiuD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MiuD takes nothing returns nothing
    set gg_trg_MiuD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MiuD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MiuD, function Trig_MiuD_Actions )
endfunction