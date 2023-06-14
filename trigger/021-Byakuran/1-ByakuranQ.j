//TESH.scrollpos=12
//TESH.alwaysfold=0
function Trig_ByakuranQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local boolean b = LoadBoolean(ht, GetHandleId(z), 0)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Byakuran_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        if b then
            call SetUnitAnimationByIndex(c, 11)
            call Effect("war3mapImported\\Shockwave White.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 0, 0, 0, 255)
            call Effect("war3mapImported\\shadowdrive2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\chinesedragon.mdl", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 2, 0.6, 0, 0, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
            set e = bj_lastCreatedEffect
        else
            call SetUnitAnimationByIndex(c, 1)
            call Effect("war3mapImported\\Shockwave White.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\WhiteDrive.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\chinesedragon.mdl", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 2, 0.6, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
            set e = bj_lastCreatedEffect
        endif
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e), 80, a)
        set y = PolarY(GetEffectY(e), 80, a)
        call SetEffectXY(e, x, y, 1)
        call SetSpecialEffectZ(e, 80 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                if b then
                    call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0AH') + ((0.3 * GetUnitAbilityLevel(c, 'A0AJ')) * GetHeroStr(c, true)))
                else
                    call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0AH'))
                endif
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if b then
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\byakuran ball.mdl", GetEffectX(e), GetEffectY(e), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            else
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\WhiteXMissile.mdl", GetEffectX(e), GetEffectY(e), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            endif
        endif
    endif
    if count == 15 then
        if b then
            call Effect("war3mapImported\\Firaga5.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetEffectX(e), GetEffectY(e), 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkBlast.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\fireworksblack.mdl", GetEffectX(e), GetEffectY(e), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        else
            call Effect("war3mapImported\\FiragaWhite.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion4.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperShinyThingy.mdl", GetEffectX(e), GetEffectY(e), 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\EarthDetonation.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\fireworkswhite.mdl", GetEffectX(e), GetEffectY(e), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_ByakuranQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0AH' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(c, 'B00Y') > 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_ByakuranQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ByakuranQ takes nothing returns nothing
    set gg_trg_ByakuranQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ByakuranQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ByakuranQ, function Trig_ByakuranQ_Actions )
endfunction