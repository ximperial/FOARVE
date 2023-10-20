//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_SasukeT_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Sasuke_5.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, .5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\rasengan_eff4.mdx", GetUnitX(c), GetUnitY(c), 125, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 125, a + 180, - 90, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 4)
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", c, "right hand")) 
        call SaveEffectHandle(ht, GetHandleId(z), 3, AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", c, "origin"))  
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Sasuke_5-1.mp3")
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, .5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00000432.mdx", GetUnitX(c), GetUnitY(c), 125, a, - 90, - 90, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\blue-slash-more.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\rasengan_eff4.mdx", GetUnitX(c), GetUnitY(c), 125, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 125, a + 180, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StarSlashNew.mdx", GetUnitX(t), GetUnitY(t), 25, a - 45, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StarSlashNew.mdx", GetUnitX(t), GetUnitY(t), 25, a + 45, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 30 and count <= 70 then
        set x = PolarX(GetUnitX(t), 5, a)
        set y = PolarY(GetUnitY(t), 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
    endif
    if count >= 50 and count <= 670 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if count >= 270 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 4)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 2, 0)
            call SetSpecialEffectZ(e, GetUnitZ(t) + 25)
        endif
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(.6, 1.2), 1, PercentTo255(60), PercentTo255(60), 255, 255)
            if count >= 70 and count <= 200 then
                call Effect("war3mapimported\\hiteffect10white.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, 4, 1, 255, 255, 255, 255)
            endif
            if count >= 290 then
                call Effect("war3mapimported\\lighwave1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(.5, 3.5), 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
                call Effect("war3mapimported\\[A]misaka lightBlue.mdx", x, y, 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            endif
        endif
    endif
    if count == 60 then
        call SoundStart("war3mapImported\\Sasuke_5-2.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\tx_white1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 70 then
        call Effect("war3mapimported\\[DoFT]Chibaku.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 25, a, 0, 0, 3, 13.4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
    endif
    if count == 250 then
        call SoundStart("war3mapImported\\Sasuke_5-3.mp3")
    endif
    if count == 270 then
        call SoundStart("war3mapImported\\Sasuke_5-4.mp3")
        call SaveEffectHandle(ht, GetHandleId(z), 5, AddSpecialEffectTarget("war3mapImported\\EffecktChidori.mdl", c, "right hand")) 
    endif
    if count == 520 then
        call Effect("war3mapimported\\AZ_Goods_Dagon_Target(3).mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 7, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\blue-guangzhu-linghun.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\shandian-xiaoshi-man-2.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ErosBluePurple.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 270, 0, 6, 1, 255, 255, 255, 255)
    endif
    if count == 650 then
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, .6)
    endif
    if count == 670 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        call SetSpecialEffectAnimationByIndex(e, 0)
        call Effect("war3mapimported\\[A]pundun!-.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\blue-guangzhu-linghun.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\shandian-xiaoshi-man-2.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 6, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AZ_Goods_Dagon_Target(3).mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 6, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\slam09.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
    endif
    if count == 690 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 5))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_SasukeT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A072' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_SasukeT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_SasukeT takes nothing returns nothing
    set gg_trg_SasukeT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SasukeT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_SasukeT, function Trig_SasukeT_Actions)
endfunction