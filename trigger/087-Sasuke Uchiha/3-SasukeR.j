//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_SasukeR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Sasuke_4.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, .5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\rasengan_eff4.mdx", GetUnitX(c), GetUnitY(c), 125, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 125, a + 180, - 90, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count <= 20 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Sasuke_4-1.mp3")
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 125, a + 180, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 125, a + 180, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[a]t_icesparks.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 1, a)
    endif
    if count >= 20 and count <= 150 then
        set a = LoadReal(ht, GetHandleId(z), 1)
        set x = PolarX(GetUnitX(t), 5, a)
        set y = PolarY(GetUnitY(t), 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 5, 0)
    endif
    if count == 40 then
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0)) 
        call SaveEffectHandle(ht, GetHandleId(z), 3, AddSpecialEffectTarget("Abilities\\Weapons\\ZigguratMissile\\ZigguratMissile.mdl", c, "origin")) 
        call SaveEffectHandle(ht, GetHandleId(z), 4, AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", c, "origin")) 
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 300, a + 45))
        call SetUnitY(c, PolarY(GetUnitY(t), - 300, a + 45))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 40 and count <= 150 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 60, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 60, a))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 30, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\blue-slash-more.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\az-zidan.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call Effect("war3mapimported\\QQQQQR.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\blue-daoguang-new.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 45, 0, .8, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\blue-daoguang-new.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 225, 0, .8, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\hero_dwarvensniper_n3s_o_target.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\shandian-xiaoshi-man-2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 50 or count == 70 or count == 90 or count == 110 or count == 130 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 300, a - 90))
        call SetUnitY(c, PolarY(GetUnitY(t), - 300, a - 90))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t) - 100, 0)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 60 or count == 80 or count == 100 or count == 120 or count == 140 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 300, a + 90))
        call SetUnitY(c, PolarY(GetUnitY(t), - 300, a + 90))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t) - 100, 0)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 150 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a + 45))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a + 45))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 10)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t), a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 150 and count <= 170 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 65, 0)
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t), 0)
    endif
    if count == 160 then
        call SoundStart("war3mapImported\\Sasuke_4-2.mp3")
    endif
    if count == 170 then
        call Effect("war3mapimported\\bymutou_huozhu_heise.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\bymutou_huozhu_siwang.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]dz2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\[DoFT]AmaterasNew.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, .8, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AmaterExplosion1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]ama boom.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
    endif
    if count == 180 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A071')) * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 4))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_SasukeR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A071' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_SasukeR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_SasukeR takes nothing returns nothing
    set gg_trg_SasukeR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SasukeR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_SasukeR, function Trig_SasukeR_Actions)
endfunction