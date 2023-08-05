//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KizaruD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kizaru_7.mp3")
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 0)
    endif
    if count >= 20 and count <= 160 then 
        if count >= 130 then 
            if dist > 140 then 
                call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
                call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
            else
                call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
                call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
            endif
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\FairyLawLight.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255) 
        endif
    endif
    if count == 160 then 
        call Effect("war3mapImported\\Asuma-Explosion.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DivineRage.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SuperBigExplosion.mdl", GetUnitX(t), GetUnitY(t), 80, a, - 90, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\ValkDust.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\NewDirtEXNofire.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 170 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_KizaruD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A03D' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KizaruD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KizaruD takes nothing returns nothing
    set gg_trg_KizaruD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KizaruD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KizaruD, function Trig_KizaruD_Actions )
endfunction