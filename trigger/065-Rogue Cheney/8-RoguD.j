//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RoguD_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Rogue_7.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call Effect("war3mapimported\\brs 1.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Desecrate.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DarkBlast.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ShadowDrive2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 50 then
        call SetUnitFlyHeight(c, 3000, 0)
    endif
    if count == 55 or count == 90 then
        set x = PolarX(GetUnitX(t), 400, randomAngle())
        set y = PolarY(GetUnitY(t), 400, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapimported\\RogueFTFL.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255) 
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 13)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 60 or count == 95 then
        call SoundStart("war3mapImported\\Rogue_7-1.mp3")
    endif
    if count == 65 or count == 100 then
        call Effect("war3mapimported\\akiha claw black.mdx", GetUnitX(t), GetUnitY(t), 100, a + 120, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DarkBlade.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 4.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.2, 1, 0, 0, 0, 255)
    endif
    if count >= 55 and count <= 75 or count >= 90 and count <= 110 then
        call SetEffectX(e, PolarX(GetEffectX(e), 40, GetSpecialEffectYaw(e))) 
        call SetEffectY(e, PolarY(GetEffectY(e), 40, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
        if (count > 60 and count <= 75) or count > 95 then 
            set x = PolarX(GetUnitX(t), 3, GetSpecialEffectYaw(e))
            set y = PolarY(GetUnitY(t), 3, GetSpecialEffectYaw(e))
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
        endif
    endif
    if count == 75 or count == 105 then
        set x = PolarX(GetUnitX(t), 400, randomAngle())
        set y = PolarY(GetUnitY(t), 400, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapimported\\RogueFTFL.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 13)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count == 80 or count == 110 then
        call SoundStart("war3mapImported\\Rogue_7-1.mp3")
    endif
    if count == 85 or count == 115 then
        call Effect("war3mapimported\\akiha claw black.mdx", GetUnitX(t), GetUnitY(t), 100, a + 120, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DarkBlade.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 4.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.2, 1, 0, 0, 0, 255)
    endif
    if count >= 75 and count <= 95 or count >= 105 and count <= 125 then
        call SetEffectX(e2, PolarX(GetEffectX(e2), 40, GetSpecialEffectYaw(e2))) 
        call SetEffectY(e2, PolarY(GetEffectY(e2), 40, GetSpecialEffectYaw(e2)))
        call SetSpecialEffectZ(e2, GetAxisZ(GetEffectX(e2), GetEffectY(e2)))
        if (count > 80 and count <= 95) or count > 110 then 
            set x = PolarX(GetUnitX(t), 3, GetSpecialEffectYaw(e2))
            set y = PolarY(GetUnitY(t), 3, GetSpecialEffectYaw(e2))
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
        endif
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Rogue_7-2.mp3")
    endif
    if count == 130 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, GetEffectX(e2))
        call SetUnitY(c, GetEffectY(e2))
        call SetUnitFacing(c, GetSpecialEffectYaw(e2))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\akiha claw black.mdx", GetUnitX(t), GetUnitY(t), 100, a + 120, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DarkBlade.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 4.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.2, 1, 0, 0, 0, 255)
    endif
    if count == 150 then
        call Effect("war3mapimported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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
    set e = null
    set e2 = null
endfunction

function Trig_RoguD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CR' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RoguD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RoguD takes nothing returns nothing
    set gg_trg_RoguD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RoguD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RoguD, function Trig_RoguD_Actions)
endfunction