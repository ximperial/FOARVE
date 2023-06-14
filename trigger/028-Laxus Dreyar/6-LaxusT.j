//TESH.scrollpos=131
//TESH.alwaysfold=0
function Trig_LaxusT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local group g2 = LoadGroupHandle(ht, GetHandleId(z), 5)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    local effect e3 = LoadEffectHandle(ht, GetHandleId(z), 4)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 700 then
        if count >= 350 then
            call PauseUnit(c, true)
        endif
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        if GetRandomInt(1, 2) == 1 then
            call SoundStart("war3mapImported\\LaxusNew_5-2.mp3")
        else
            call SoundStart("war3mapImported\\LaxusNew_5-3.mp3")
        endif
        call UnitApplySilence(c, true)
    endif
    if count == 350 then
        call SoundStart("war3mapImported\\LaxusNew_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 8, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 4)
        call Effect("war3mapImported\\ChargeYellow.mdl", GetUnitX(c), GetUnitY(c), 150, randomAngle(), 0, 0, 2.75, 7, 255, 255, 255, 255)
        call Effect("war3mapImported\\AFB_aura_Yellow.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.15, 7, 255, 255, 255, 255)
        call Effect("war3mapImported\\File00007390.mdl", GetUnitX(c), GetUnitY(c), - 200, randomAngle(), 0, 0, 4, 7, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapImported\\huoqiang02_T1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1)) 
    endif
    if count == 380 then
        call SetSpecialEffectTimeScale(e, 0.03)
    endif
    if count == 390 or count == 430 or count == 470 or count == 510 then
        call Effect("war3mapImported\\huoqiang02_T1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))  
    endif
    if count == 450 then
        call SetUnitTimeScale(c, 0)
        call Effect("war3mapImported\\MC Laxus.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count <= 450 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 15 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.35, 2), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
        endif
    endif
    if count >= 450 and count <= 550 then
        call SetSpecialEffectZ(e2, GetEffectZ(e2) + 9)
    endif
    if count >= 450 and count <= 700 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 15 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.7, 1) + (count - 450) * 0.02, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.25) + (count - 450) * 0.02, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.35, 2) + (count - 450) * 0.02, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
        endif
    endif
    if count == 500 then
        call SoundStart("war3mapImported\\LaxusNew_5-1.mp3")
        call SetUnitTimeScale(c, 0.5)
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 550 then
        call Effect("war3mapImported\\az_sg2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 0.6, 3, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.05)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapImported\\MystoganExp.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 3, 255, 255, 255, PercentTo255(70)) 
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        set e3 = bj_lastCreatedEffect
    endif
    if count >= 550 and count <= 700 then
        if count <= 650 then
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.15)
            call SetSpecialEffectScale(e2, GetSpecialEffectScale(e2) + 0.15)
            call SetSpecialEffectScale(e3, GetSpecialEffectScale(e3) + 0.15)
        endif
        if count < 650 then 
            call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 300 + (count - 550) * 12, null)
        else
            call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 1500, null)
        endif
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null 
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g2) then
                call DamageUnit(c, gUnit, 15 * GetHeroStr(c, true))
                call GroupAddUnit(g2, gUnit) 
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count >= 350 and count <= 600 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01) 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 600 then
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
    endif
    if count == 700 then
        call SetUnitTimeScale(c, 1)
        call UnitApplySilence(c, false)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g2)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
    set g2 = null
    set e2 = null
    set e3 = null
endfunction

function Trig_LaxusT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A09M' then
        set z = CreateTimer()
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call SaveGroupHandle(ht, GetHandleId(z), 5, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_LaxusT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_LaxusT takes nothing returns nothing
    set gg_trg_LaxusT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_LaxusT, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_LaxusT, function Trig_LaxusT_Actions )
endfunction