//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_JellalD_Func001 takes nothing returns nothing
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
    if count <= 20 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 20 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Jellal_6.mp3")
        call SoundStart("war3mapImported\\Jellal_6-1.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call UnitApplySilence(t, true)
        call SaveBoolean(ht, GetHandleId(z), 0, true)
        call Effect("war3mapimported\\Shadow_Glow.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, .8, 7, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\mcj.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 7, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count > 1 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectPositionEx(e, GetUnitX(t), GetUnitY(t), 25 + GetUnitZ(t))
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetSpecialEffectPositionEx(e, GetUnitX(t), GetUnitY(t), 25 + GetUnitZ(t))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\SuperShinyThingy2_1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\SuperShinyThingyBlack.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 125 then
        call UnitApplySilence(t, false)
        call SaveBoolean(ht, GetHandleId(z), 0, false)
    endif
    if count == 340 or not IsUnitAlive(t) then
        if not IsUnitAlive(t) then
            set e = LoadEffectHandle(ht, GetHandleId(z), 2)
            call SetSpecialEffectPositionEx(e, GetRectCenterX(gg_rct_dummyrect), GetRectCenterY(gg_rct_dummyrect), 0)
            set e = LoadEffectHandle(ht, GetHandleId(z), 3)
            call SetSpecialEffectPositionEx(e, GetRectCenterX(gg_rct_dummyrect), GetRectCenterY(gg_rct_dummyrect), 0)
            if count < 20 then
                call PauseUnit(c, false)
                call SetUnitInvulnerable(c, false)
                call IssueImmediateOrderById(c, 851972)
            endif
            if LoadBoolean(ht, GetHandleId(z), 0) then
                call UnitApplySilence(t, false)
            endif
        endif
        call Effect("war3mapimported\\SuperBigExplosion4_1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1.5, 255, 255, 255, PercentTo255(50))
        call Effect("war3mapimported\\SuperBigExplosion4_1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1.5, 255, 255, 255, PercentTo255(75))
        call Effect("war3mapimported\\SuperBigExplosion4_1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, PercentTo255(30), PercentTo255(30), PercentTo255(30), 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1.5, PercentTo255(30), PercentTo255(30), PercentTo255(30), 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(t), GetUnitY(t), 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 8 * GetHeroInt(c, true))
            endif
        endloop
        call GroupClear(gGroup)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_JellalD_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = GetUnitFacing(c)
    local integer i = 0
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Jellal_6-2.mp3")
        call SaveSoundHandle(ht, GetHandleId(z), -1, dummySound)
        call Effect("war3mapimported\\Shadow_Glow.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, .85, 10, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\mcj.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 4.2, 10, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call StartAbilityCooldown(GetUnitAbility(c, 'A07C'), 60)
    endif
    if count > 1 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectPositionEx(e, GetUnitX(c), GetUnitY(c), 25 + GetUnitZ(c))
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetSpecialEffectPositionEx(e, GetUnitX(c), GetUnitY(c), 25 + GetUnitZ(c))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\SuperShinyThingy2_1.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\SuperShinyThingyBlack.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 500 or not IsUnitAlive(c) then
        if not IsUnitAlive(c) then
            set e = LoadEffectHandle(ht, GetHandleId(z), 2)
            call SetSpecialEffectPositionEx(e, GetRectCenterX(gg_rct_dummyrect), GetRectCenterY(gg_rct_dummyrect), 0)
            set e = LoadEffectHandle(ht, GetHandleId(z), 3)
            call SetSpecialEffectPositionEx(e, GetRectCenterX(gg_rct_dummyrect), GetRectCenterY(gg_rct_dummyrect), 0)
            call StopSound(LoadSoundHandle(ht, GetHandleId(z), -1), true, false)
        endif
        call Effect("war3mapimported\\SuperBigExplosion4_1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 4.5, 1.5, 255, 255, 255, PercentTo255(50))
        call Effect("war3mapimported\\SuperBigExplosion4_1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3.5, 1.5, 255, 255, 255, PercentTo255(75))
        call Effect("war3mapimported\\SuperBigExplosion4_1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1.5, PercentTo255(30), PercentTo255(30), PercentTo255(30), 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3.5, 1.5, PercentTo255(30), PercentTo255(30), PercentTo255(30), 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 8 * GetHeroInt(c, true))
            endif
        endloop
        call GroupClear(gGroup)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(c) , GetUnitY(c))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_JellalD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A07C' then 
        set z = CreateTimer()
        if t != c then
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function Trig_JellalD_Func001)
        else
            call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function Trig_JellalD_Func002)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_JellalD takes nothing returns nothing
    set gg_trg_JellalD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JellalD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_JellalD, function Trig_JellalD_Actions)
endfunction