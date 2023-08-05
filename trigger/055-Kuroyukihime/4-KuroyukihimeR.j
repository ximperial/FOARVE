//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KuroyukihimeR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\BlackLotus_4.mp3")
        call SetUnitAnimationByIndex(c, 9)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dead Spirit by Deckai2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\supershinythingy4.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 170 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
            call SetUnitAnimation(c, "attack")
            call Effect("war3mapImported\\valkkame3.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call Effect("war3mapImported\\slashdigital.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\kirito_stbs01.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\kirito_stbs03.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\kirito_stbs04.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\kirito_stbs05.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 170 then
        call Effect("Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Shockwave Blue.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\supershinythingy4.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BlueAncientExplode.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Energy Release2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\ArcaneExplosion.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dead Spirit by Deckai2.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 180 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, ((6 + 2 * GetUnitAbilityLevel(c, 'A0A6')) + 0.3 * GetUnitBuffLevel(c, 'B00V')) * GetHeroAgi(c, true))
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

function Trig_KuroyukihimeR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0A6' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KuroyukihimeR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KuroyukihimeR takes nothing returns nothing
    set gg_trg_KuroyukihimeR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KuroyukihimeR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KuroyukihimeR, function Trig_KuroyukihimeR_Actions )
endfunction