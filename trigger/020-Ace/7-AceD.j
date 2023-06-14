//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AceD_Func003 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real z1 = LoadReal(ht, GetHandleId(z), 2) + GetAxisZ(GetEffectX(e), GetEffectY(e))
    local real x1 
    local real y1
    local real a = Angle(GetEffectX(e), GetEffectY(e), x, y)
    local real dist = LoadReal(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 30 then 
        set x1 = PolarX(GetEffectX(e), dist / 30, a)
        set y1 = PolarY(GetEffectY(e), dist / 30, a) 
        call SetEffectXY(e, x1, y1, 0)
        call SetSpecialEffectZ(e, z1)
        call SetSpecialEffectYaw(e, a)
    endif
    if count >= 100 then 
        call Effect("war3mapimported\\[A]BY_Wood_XianHuo_2.mdx", GetEffectX(e), GetEffectY(e), GetEffectZ(e), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_AceD_Func002 takes unit c, real x, real y returns nothing
    local timer z = CreateTimer()
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    call SaveUnitHandle(ht, GetHandleId(z), 0, c)
    call SaveReal(ht, GetHandleId(z), 0, x)
    call SaveReal(ht, GetHandleId(z), 1, y)
    call SaveInteger(ht, GetHandleId(z), 0, 0)
    call Effect("war3mapimported\\ZeroPinkGreen.mdx", GetUnitX(c), GetUnitY(c), GetRandomReal(25, 50), a, 0, 0, 2, 2.1, 255, 255, 255, 255)
    call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
    call SaveReal(ht, GetHandleId(z), 2, GetEffectZ(bj_lastCreatedEffect))
    call SaveReal(ht, GetHandleId(z), 3, Distance(x1, y1, x, y))
    call TimerStart(z, 0.02, true, function Trig_AceD_Func003)
    set z = null
endfunction

function Trig_AceD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist
    local real x
    local real y
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ace_7.mp3")
        call SetUnitAnimationByIndex(c, 9)
        call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 30 or count == 60 then
        call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 60 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Trig_AceD_Func002(c, PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle()), PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle()))
        endif
    endif
    if count == 110 then
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count == 170 then
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
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

function Trig_AceD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0AG' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AceD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction
    
//===========================================================================
function InitTrig_AceD takes nothing returns nothing
    set gg_trg_AceD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AceD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AceD, function Trig_AceD_Actions )
endfunction