//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_MinatoD_Func001 takes nothing returns nothing
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
    if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 then
        call SoundStart("war3mapImported\\Minato_5-2.mp3")
        call SoundStart("war3mapImported\\KanzakiSE1.mp3")
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 120, randomAngle()))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, randomAngle()))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.6, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
        call Effect("war3mapImported\\YellowSL.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.35, 1, 255, 255, 255, 255)
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Minato_7.mp3")
    endif
    if count <= 100 then 
        set x = PolarX(GetUnitX(t), 15, a)
        set y = PolarY(GetUnitY(t), 15, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
    endif
    if count == 100 then
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 0.6)
    endif
    if count == 150 then
        call Effect("war3mapImported\\DT.mdl", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255) 
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_MinatoD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A012' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MinatoD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MinatoD takes nothing returns nothing
    set gg_trg_MinatoD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MinatoD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MinatoD, function Trig_MinatoD_Actions )
endfunction