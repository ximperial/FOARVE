//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KuroyukihimeT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\BlackLotus_5.mp3")
        call SetUnitAnimationByIndex(c, 9)
        call Effect("war3mapImported\\Purple Aura.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTPurpleNoRing.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\LotusStar.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count >= 40 and count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
            call SetUnitAnimation(c, "attack")
            call Effect("war3mapImported\\DTPurpleNoRing.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\valkkame4.mdl", GetUnitX(t), GetUnitY(t), 25, a + GetRandomReal(- 60, 60), 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
            call MoveEffect(bj_lastCreatedEffect, 40, 1, GetSpecialEffectYaw(bj_lastCreatedEffect))
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapImported\\slashdigital.mdl", x, y, GetRandomReal(25, 40), randomAngle(), GetRandomReal(- 45, 0), 0, 2.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapImported\\slashdigital.mdl", x, y, GetRandomReal(25, 40), randomAngle(), GetRandomReal(- 45, 0), 0, 2.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 150 then
        call SetUnitAnimationByIndex(c, 7)
        call Effect("war3mapImported\\Purple Aura.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 150 and count <= 170 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(c), 14, a)
        set y = PolarY(GetUnitY(c), 14, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
    endif
    if count == 170 then
        call Effect("war3mapImported\\DTPurpleNoRing.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\violet spark by deckai.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\LotusStar.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 180 then 
        call SetUnitTimeScale(c, 1)
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

function Trig_KuroyukihimeT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0A7' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KuroyukihimeT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KuroyukihimeT takes nothing returns nothing
    set gg_trg_KuroyukihimeT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KuroyukihimeT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KuroyukihimeT, function Trig_KuroyukihimeT_Actions )
endfunction