//TESH.scrollpos=23
//TESH.alwaysfold=0
function Trig_HibariD2_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Hibari_7-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapImported\\ChainElement2.mdx", GetUnitX(c), GetUnitY(c), 40, 90, 0, 0, 3.5, 1.6, 255, 255, 255, 255)
        call Effect("war3mapImported\\ChainElement2.mdx", GetUnitX(c), GetUnitY(c), 40, 0, 0, 0, 3.5, 1.6, 255, 255, 255, 255)
        call Effect("war3mapImported\\HibariKyoya.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1.6, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 11)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 70 then
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 900, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 8 * GetHeroAgi(c, true) / 70)
                if count >= 10 then
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 0.65, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1.65, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 2.65, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 3.65, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
    endif
    if count == 70 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_HibariD2_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A03Y' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_HibariD2_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_HibariD2 takes nothing returns nothing
    set gg_trg_HibariD2 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HibariD2, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_HibariD2, function Trig_HibariD2_Actions )
endfunction