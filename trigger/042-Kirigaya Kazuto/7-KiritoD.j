//TESH.scrollpos=24
//TESH.alwaysfold=0
function Trig_KiritoD_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kirito_6.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 3, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count <= 100 then 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), 200, randomAngle(), - 45, 0, GetRandomReal(.6, 1), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zhanji-blue-shu.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(100, 250), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
            call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", x, y, GetRandomReal(100, 250), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd3.mdx", x, y, GetRandomReal(100, 250), randomAngle(), - 45, 0, GetRandomReal(4, 6), 1, 0, 160, 255, 255)
            call Effect("war3mapImported\\uissb.mdx", x, y, 25, randomAngle(), 0, 0, GetRandomReal(2, 4), 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\mkirito2.mdx", x, y, GetRandomReal(25, 150), a, 0, 0, 1, 0.6, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.35, 2))
            if GetRandomInt(1, 2) == 1 then
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 20)
            else
                if GetRandomInt(1, 2) == 1 then
                    call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
                else
                    if GetRandomInt(1, 2) == 1 then
                        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 22)
                    else
                        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 23)
                    endif
                endif
            endif
        endif
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Kirito_6-1.mp3")
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 6, 0.4, 0, 160, 255, 255)
        call Effect("war3mapImported\\mkirito2.mdx", GetUnitX(t), GetUnitY(t), 1500, a, -90, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 27)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.8)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 110 then
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 4, 0.6, 0, 160, 255, 255)
    endif
    if count == 120 then
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 0.8, 0, 160, 255, 255)
    endif
    if count >= 100 and count <= 130 then
        call SetSpecialEffectZ(e, GetEffectZ(e) - 50)
    endif
    if count == 130 then
        call SoundStart("war3mapImported\\Kirito_6-2.mp3")
        call Effect("war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .2)
        call Effect("war3mapImported\\XZDL2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
        call Effect("war3mapImported\\a_new_skybigbang.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
    endif
    if count == 140 then 
        call SetUnitFlyHeight(c, 0, 0)
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
    set e = null
endfunction

function Trig_KiritoD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00N' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KiritoD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KiritoD takes nothing returns nothing
    set gg_trg_KiritoD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KiritoD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KiritoD, function Trig_KiritoD_Actions )
endfunction