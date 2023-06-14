//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    integer MisogiFHash = StringHash("MisogiF")
endglobals

function Trig_MisogiF_Func003 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real dist = LoadReal(ht, GetHandleId(z) , 0)
    local real a = Angle(GetEffectX(e) , GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
    local real z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
    if HaveSavedBoolean(ht, MisogiFHash , GetHandleId(c)) then
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call SetEffectX(e, PolarX(GetEffectX(e) , dist / 40, a))
        call SetEffectY(e, PolarY(GetEffectY(e) , dist / 40, a))
        call SetSpecialEffectZ(e, z1 - z1 / 50)
        if count >= 40 then
            call DestroyEffect(e)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MisogiF_Func002 takes unit c, unit t returns nothing
    local timer z = CreateTimer()
    local real x = PolarX(GetUnitX(t) , GetRandomReal(- 800, 800) , randomAngle())
    local real y = PolarY(GetUnitY(t) , GetRandomReal(- 800, 800) , randomAngle())
    local real a = Angle(x, y, GetUnitX(t) , GetUnitY(t))
    call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
    call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
    call SaveInteger(ht, GetHandleId(z) , 0, 0)
    set bj_lastCreatedEffect = AddSpecialEffect("war3mapImported\\Medaka Box Misogi Kumagawa Screw 3.mdl", x, y)
    call SetSpecialEffectZ(bj_lastCreatedEffect, GetRandomReal(400, 800) + GetAxisZ(x, y))
    call SetSpecialEffectPitch(bj_lastCreatedEffect, - 45)
    call SetSpecialEffectYaw(bj_lastCreatedEffect, a)
    call SetSpecialEffectScale(bj_lastCreatedEffect, 1.5)
    call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
    call SaveReal(ht, GetHandleId(z) , 0, Distance(x, y, GetUnitX(t) , GetUnitY(t)))
    call TimerStart(z, 0.02, true, function Trig_MisogiF_Func003)
    set z = null
endfunction

function Trig_MisogiF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Misogi_6.mp3")
        call SetUnitAnimation(c, "spell slam")
        call SetUnitTimeScale(c, 1.25)
        call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 0.5, 1, 0, 0, 0, PercentTo255(60))
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count <= 80 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Trig_MisogiF_Func002(c, t)
        endif
    endif
    if count == 110 then
        call SoundStart("war3mapImported\\Misogi_6-1.mp3")
    endif
    if count == 160 then
        call SaveBoolean(ht, MisogiFHash , GetHandleId(c) , true)
        call SoundStart("war3mapImported\\Misogi_6-2.mp3")
    endif
    if count == 200 then
        call Effect("war3mapimported\\[A]blackstrike.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[A]SuperBigExpBlackLow1.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 210 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveSavedBoolean(ht, MisogiFHash , GetHandleId(c))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_MisogiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08C' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MisogiF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisogiF takes nothing returns nothing
    set gg_trg_MisogiF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisogiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisogiF, function Trig_MisogiF_Actions)
endfunction