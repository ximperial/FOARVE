//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AizenQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e1 = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    local effect e3 = LoadEffectHandle(ht, GetHandleId(z), 4)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Aizen_1.mp3")
        call SoundStart("war3mapImported\\Aizen_1-1.mp3")
        call SoundStart("war3mapImported\\Aizen_1-2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 17)
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\white-qiquan-juhuang_red.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\az_cocochristmas_d_impact_red.mdx", c, "hand right"))
        set x = PolarX(GetUnitX(c), 10, a + 20)
        set y = PolarY(GetUnitY(c), 10, a + 20)
        call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", x, y, 25, a + 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\xtyball.mdl", x, y, 25, a + 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e1 = bj_lastCreatedEffect
        set x = PolarX(GetUnitX(c), 10, a)
        set y = PolarY(GetUnitY(c), 10, a)
        call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\xtyball.mdl", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
        set x = PolarX(GetUnitX(c), 10, a - 20)
        set y = PolarY(GetUnitY(c), 10, a - 20)
        call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", x, y, 25, a - 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\xtyball.mdl", x, y, 25, a - 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        set e3 = bj_lastCreatedEffect
    endif
    if count <= 15 then
        call SetEffectX(e1, PolarX(GetEffectX(e1), 80, GetSpecialEffectYaw(e1)))
        call SetEffectY(e1, PolarY(GetEffectY(e1), 80, GetSpecialEffectYaw(e1)))
        call SetSpecialEffectZ(e1, 25 + GetAxisZ(GetEffectX(e1), GetEffectY(e1)))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e1), GetEffectY(e1), 200, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A03U'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        call SetEffectX(e2, PolarX(GetEffectX(e2), 80, GetSpecialEffectYaw(e2)))
        call SetEffectY(e2, PolarY(GetEffectY(e2), 80, GetSpecialEffectYaw(e2)))
        call SetSpecialEffectZ(e2, 25 + GetAxisZ(GetEffectX(e2), GetEffectY(e2)))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e2), GetEffectY(e2), 200, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A03U'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        call SetEffectX(e3, PolarX(GetEffectX(e3), 80, GetSpecialEffectYaw(e3)))
        call SetEffectY(e3, PolarY(GetEffectY(e3), 80, GetSpecialEffectYaw(e3)))
        call SetSpecialEffectZ(e3, 25 + GetAxisZ(GetEffectX(e3), GetEffectY(e3)))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e3), GetEffectY(e3), 200, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A03U'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", GetEffectX(e1), GetEffectY(e1), 25, GetSpecialEffectYaw(e1), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", GetEffectX(e2), GetEffectY(e2), 25, GetSpecialEffectYaw(e2), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", GetEffectX(e3), GetEffectY(e3), 25, GetSpecialEffectYaw(e3), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call SetSpecialEffectAnimationByIndex(e1, 1)
        call SetSpecialEffectAnimationByIndex(e2, 1)
        call SetSpecialEffectAnimationByIndex(e3, 1)
        call Effect("war3mapimported\\W_Effect05.mdx", GetEffectX(e1), GetEffectY(e1), 25, GetSpecialEffectYaw(e1), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\W_Effect05.mdx", GetEffectX(e2), GetEffectY(e2), 25, GetSpecialEffectYaw(e2), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\W_Effect05.mdx", GetEffectX(e3), GetEffectY(e3), 25, GetSpecialEffectYaw(e3), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\bymutou_huozhu_siwang-red.mdx", GetEffectX(e1), GetEffectY(e1), 25, GetSpecialEffectYaw(e1), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\bymutou_huozhu_siwang-red.mdx", GetEffectX(e2), GetEffectY(e2), 25, GetSpecialEffectYaw(e2), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\bymutou_huozhu_siwang-red.mdx", GetEffectX(e3), GetEffectY(e3), 25, GetSpecialEffectYaw(e3), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e1 = null
    set e2 = null
    set e3 = null
endfunction

function Trig_AizenQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A03U' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AizenQ_Func001)
        set z = null
    endif
    set z = null
    set c = null
endfunction
        
//===========================================================================
function InitTrig_AizenQ takes nothing returns nothing
    set gg_trg_AizenQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AizenQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AizenQ, function Trig_AizenQ_Actions )
endfunction