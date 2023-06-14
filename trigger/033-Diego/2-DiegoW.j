//TESH.scrollpos=51
//TESH.alwaysfold=0
function Trig_DiegoW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x0 = LoadReal(ht, GetHandleId(z), 2)
    local real y0 = LoadReal(ht, GetHandleId(z), 3)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real dist
    local real dist2
    local real x1
    local real y1
    local real z1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Diego_2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\wind3.mdl", x, y, 100, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\CF2.mdl", x, y, 50, a, 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(c), 150, a)
        set y = PolarY(GetUnitY(c), 150, a)
        call Effect("war3mapImported\\rasengan_eff4.mdl", x, y, 100, a, - 90, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[DoFT]DiegoBox.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        set x0 = GetUnitX(c)
        set y0 = GetUnitY(c)
        call SaveReal(ht, GetHandleId(z), 2, x0)
        call SaveReal(ht, GetHandleId(z), 3, y0)
    endif
    if count <= 35 then
        set dist = Distance(x0, y0, x, y)
        set x1 = PolarX(GetEffectX(e), dist / 35, a)
        set y1 = PolarY(GetEffectY(e), dist / 35, a)
        set dist2 = Distance(x0, y0, GetEffectX(e), GetEffectY(e))
        set z1 = GetParabolaZ(dist2, dist, 400) + GetAxisZ(GetEffectX(e), GetEffectY(e))
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x1)
            call SetEffectY(e, y1)
        endif
        call SetSpecialEffectZ(e, z1)
    endif
    if count == 35 then 
        call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2.3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetEffectX(e), GetEffectY(e), 150, a, 0, 0, 7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\[A]Explodeorange.mdl", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, 2.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, (1 + GetUnitAbilityLevel(c, 'A0D0')) * GetHeroStr(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_DiegoW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0D0' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_DiegoW_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_DiegoW takes nothing returns nothing
    set gg_trg_DiegoW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DiegoW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_DiegoW, function Trig_DiegoW_Actions )
endfunction