//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    integer MinatoQ2Hash = StringHash("MinatoQ2")
endglobals

function Trig_MinatoQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 15 then
        call PauseUnit(c, true)
    endif
    if count > 115 then
        call PauseUnit(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Minato_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        if GetUnitTypeId(c) == 'H01M' then
            call SetUnitAnimationByIndex(c, 13)
        else
            call SetUnitAnimationByIndex(c, 2)
        endif
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapImported\\minato_kunai.mdl", GetUnitX(c), GetUnitY(c), 100, a, - 90, 0, 1.2, 2.5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e), 80, a)
        set y = PolarY(GetEffectY(e), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call Effect("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A00Q'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call ShowUnitAbility(c, 'A00Q', false)
        call UnitAddAbility(c, 'A00V')
        call UnitMakeAbilityPermanent(c, true, 'A00V')
        call SetUnitAbilityLevel(c, 'A00V', GetUnitAbilityLevel(c, 'A00Q'))
        call DestroyGroup(g)
    endif
    if count == 115 and not HaveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c)) then
        call ShowUnitAbility(c, 'A00Q', true)
        call UnitRemoveAbility(c, 'A00V')
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    if count >= 15 and count <= 115 and HaveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c)) then
        if GetUnitTypeId(c) == 'H01M' then
            call SoundStart("war3mapImported\\Minato_6.mp3")
            call PauseUnit(c, true)
            call SetUnitAnimationByIndex(c, 19)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetUnitX(c, GetEffectX(e))
            call SetUnitY(c, GetEffectY(e))
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetEffectX(e, GetRectCenterX(gg_rct_dummyrect))
            call SetEffectY(e, GetRectCenterY(gg_rct_dummyrect))
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            set g = LoadGroupHandle(ht, GetHandleId(z), 1)
            set count = 115
            call SaveInteger(ht, GetHandleId(z), 0, count)
            call RemoveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c))
        else
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetUnitX(c, GetEffectX(e))
            call SetUnitY(c, GetEffectY(e))
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetEffectX(e, GetRectCenterX(gg_rct_dummyrect))
            call SetEffectY(e, GetRectCenterY(gg_rct_dummyrect))
            call ShowUnitAbility(c, 'A00Q', true)
            call UnitRemoveAbility(c, 'A00V')
            call RemoveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c))
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
    endif
    if count == 130 then
        call Effect("war3mapImported\\DT.mdl", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count >= 140 and count <= 150 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 400, null)
        loop
            set gUnit = FirstOfGroup(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A00V')) * GetHeroAgi(c, true)) 
                call GroupAddUnit(g, gUnit)
            endif
            call GroupRemoveUnit(gGroup, gUnit)
        endloop
    endif
    if count == 150 then
        call PauseUnit(c, false)
        call ShowUnitAbility(c, 'A00Q', true)
        call UnitRemoveAbility(c, 'A00V')
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e = null
endfunction

function Trig_MinatoQ_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 4)
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local group g = LoadGroupHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 20 then
        call PauseUnit(c, true)
        call PauseUnit(t, true)
    endif
    if count > 120 then
        call PauseUnit(c, true)
        call PauseUnit(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Minato_1.mp3")
        if GetUnitTypeId(c) == 'H01M' then
            call SetUnitAnimationByIndex(c, 13)
        else
            call SetUnitAnimationByIndex(c, 2)
        endif
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapImported\\minato_kunai.mdl", GetUnitX(c), GetUnitY(c), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 20 then
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        if dist > 140 then 
            call SetEffectX(e, PolarX(GetEffectX(e), 14 + dist / 15, a))
            call SetEffectY(e, PolarY(GetEffectY(e), 14 + dist / 15, a))
        else
            call SetEffectX(e, GetUnitX(t))
            call SetEffectY(e, GetUnitY(t))
        endif
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call VisionArea(GetOwningPlayer(c), 600, 1, GetEffectX(e), GetEffectY(e))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call DamageUnit(c, t, 100 * GetUnitAbilityLevel(c, 'A00Q'))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call ShowUnitAbility(c, 'A00Q', false)
        call UnitAddAbility(c, 'A00V')
        call UnitMakeAbilityPermanent(c, true, 'A00V')
        call SetUnitAbilityLevel(c, 'A00V', GetUnitAbilityLevel(c, 'A00Q'))
        call SetEffectX(e, GetUnitX(t))
        call SetEffectY(e, GetUnitY(t))
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call Effect("war3mapImported\\kunaimark.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count >= 20 and count <= 120 then
        call SetEffectX(e2, GetUnitX(t))
        call SetEffectY(e2, GetUnitY(t))
        call SetSpecialEffectZ(e2, 25 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
        call SetSpecialEffectYaw(e2, GetUnitFacing(t))
    endif
    if count == 40 or count == 60 or count == 80 or count == 100 then
        call VisionArea(GetOwningPlayer(c), 600, 2, GetUnitX(t), GetUnitY(t))
    endif
    if count == 120 and not HaveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c)) then
        call SetEffectX(e2, GetRectCenterX(gg_rct_dummyrect))
        call SetEffectY(e2, GetRectCenterY(gg_rct_dummyrect))
        call ShowUnitAbility(c, 'A00Q', true)
        call UnitRemoveAbility(c, 'A00V')
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    if count >= 20 and count <= 120 and HaveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c)) then
        if GetUnitTypeId(c) == 'H01M' then
            call SoundStart("war3mapImported\\Minato_6.mp3")
            call PauseUnit(c, true)
            call PauseUnit(t, true)
            call SetUnitAnimationByIndex(c, 19)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetUnitX(c, GetUnitX(t))
            call SetUnitY(c, GetUnitY(t))
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SaveGroupHandle(ht, GetHandleId(z), 3, CreateGroup())
            set g = LoadGroupHandle(ht, GetHandleId(z), 3)
            set count = 120
            call SaveInteger(ht, GetHandleId(z), 0, count)
            call RemoveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c))
        else
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetUnitX(c, GetUnitX(t))
            call SetUnitY(c, GetUnitY(t))
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call ShowUnitAbility(c, 'A00Q', true)
            call UnitRemoveAbility(c, 'A00V')
            call RemoveSavedBoolean(ht, MinatoQ2Hash, GetHandleId(c))
            call SetEffectX(e2, GetRectCenterX(gg_rct_dummyrect))
            call SetEffectY(e2, GetRectCenterY(gg_rct_dummyrect))
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
    endif
    if count == 135 then
        call Effect("war3mapImported\\DT.mdl", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count >= 145 and count <= 155 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 400, null)
        loop
            set gUnit = FirstOfGroup(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A00V')) * GetHeroAgi(c, true)) 
                call GroupAddUnit(g, gUnit)
            endif
            call GroupRemoveUnit(gGroup, gUnit)
        endloop
    endif
    if count == 155 then
        call SetEffectX(e2, GetRectCenterX(gg_rct_dummyrect))
        call SetEffectY(e2, GetRectCenterY(gg_rct_dummyrect))
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call ShowUnitAbility(c, 'A00Q', true)
        call UnitRemoveAbility(c, 'A00V')
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
    set e2 = null
    set g = null
endfunction

function Trig_MinatoQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A00Q' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if t == null then
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function Trig_MinatoQ_Func001)
        else
            call PauseUnit(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call TimerStart(z, 0.02, true, function Trig_MinatoQ_Func002)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction
    
//===========================================================================
function InitTrig_MinatoQ takes nothing returns nothing
    set gg_trg_MinatoQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MinatoQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MinatoQ, function Trig_MinatoQ_Actions )
endfunction