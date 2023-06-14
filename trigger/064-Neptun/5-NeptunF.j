//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NeptunF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Neptun_6.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call Effect("war3mapimported\\DTPurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\ShockwavePurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.8, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\EnergyBurst.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 50 then
        call SetUnitFlyHeight(c, 3000, 0)
    endif
    if count == 55 or count == 90 then
        set x = PolarX(GetUnitX(t), 400, randomAngle())
        set y = PolarY(GetUnitY(t), 400, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapimported\\PurpleHeart.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        if GetRandomInt(1, 2) == 1 then 
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        else
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        endif
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 60 or count == 95 then
        call SoundStart("war3mapImported\\Neptun_6-1.mp3")
    endif
    if count == 65 or count == 100 then
        call Effect("war3mapimported\\ShockwavePurple.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\DTPurple.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\StarSlash(Missle).mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
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
        call Effect("war3mapimported\\PurpleHeart.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        if GetRandomInt(1, 2) == 1 then 
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        else
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        endif
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count == 80 or count == 110 then
        call SoundStart("war3mapImported\\Neptun_6-1.mp3")
    endif
    if count == 85 or count == 115 then
        call Effect("war3mapimported\\ShockwavePurple.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\DTPurple.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\StarSlash(Missle).mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
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
        call SoundStart("war3mapImported\\Neptun_6-2.mp3")
    endif
    if count == 130 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, GetEffectX(e2))
        call SetUnitY(c, GetEffectY(e2))
        call SetUnitFacing(c, GetSpecialEffectYaw(e2))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\DTPurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\ShockwavePurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.8, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count == 150 then
        call Effect("war3mapimported\\EnergyBurst.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx", GetUnitX(t), GetUnitY(t), 80, a, 0, 0, 4, 1, 139, 10, 139, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]ExpPurple.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dingzhi_by_wood_effect_kuosanqiliu.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.1, 1, 255, 255, 255, 255)
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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

function Trig_NeptunF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0BS' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NeptunF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_NeptunF takes nothing returns nothing
    set gg_trg_NeptunF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NeptunF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NeptunF, function Trig_NeptunF_Actions)
endfunction