//TESH.scrollpos=33
//TESH.alwaysfold=0
globals
    integer OkitaFHash = StringHash("OkitaF")
endglobals
    
function Trig_OkitaSojiF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local integer iterator2
    local effect e
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 24 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\OkitaAlter_6.mp3")
        call SoundStart("war3mapImported\\OkitaAlter_6-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 24 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count <= 50 then
        if count <= 24 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\File00005641.mdx", GetUnitX(c), GetUnitY(c), 100, a + GetRandomReal(- 40, 40), 0, 0, 2, 1, 255, 255, 255, 255)
                call SaveEffectHandle(ht, GetHandleId(z), 1 + LoadInteger(ht, GetHandleId(z), 2), bj_lastCreatedEffect)
                call SaveInteger(ht, OkitaFHash, GetHandleId(bj_lastCreatedEffect), 0)
                call SaveInteger(ht, GetHandleId(z), 2, LoadInteger(ht, GetHandleId(z), 2) + 1)
            endif
        endif
        loop
            exitwhen i > LoadInteger(ht, GetHandleId(z), 2) - 1
            set e = LoadEffectHandle(ht, GetHandleId(z), i)
            set iterator2 = LoadInteger(ht, OkitaFHash, GetHandleId(e)) + 1
            call SaveInteger(ht, OkitaFHash, GetHandleId(e), iterator2)
            if iterator2 <= 20 then
                set x = PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e))
                if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                    call SetEffectX(e, x)
                    call SetEffectY(e, y)
                endif
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(c, gUnit) then
                        set iterator2 = 21
                        call SaveInteger(ht, OkitaFHash, GetHandleId(e), iterator2)
                    endif
                endloop
                call GroupClear(gGroup)
            endif
            if iterator2 == 10 then
                call SetSpecialEffectTimeScale(e, 0)
            endif
            if iterator2 == 21 then
                call SaveInteger(ht, GetHandleId(z), 3, LoadInteger(ht, GetHandleId(z), 3) + 1)
                call SetSpecialEffectTimeScale(e, 1)
                if LoadInteger(ht, GetHandleId(z), 3) >= 3 then
                    call SaveInteger(ht, GetHandleId(z), 3, 0)
                    call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
                    call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                endif
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 400, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(c, gUnit) then
                        call DamageUnit(c, gUnit, 1.5 * GetHeroAgi(c, true))
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif
                endloop
                call GroupClear(gGroup)
            endif
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_OkitaSojiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A04V' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 3, 0)
        call TimerStart(z, 0.02, true, function Trig_OkitaSojiF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_OkitaSojiF takes nothing returns nothing
    set gg_trg_OkitaSojiF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OkitaSojiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_OkitaSojiF, function Trig_OkitaSojiF_Actions )
endfunction