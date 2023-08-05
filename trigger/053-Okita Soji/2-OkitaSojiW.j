//TESH.scrollpos=18
//TESH.alwaysfold=0
scope OkitaSojiW

    private struct Missile extends Missiles
    
    unit c
    
    method onPeriod takes nothing returns boolean
        if IsTerrainPathable(.x, .y, PATHING_TYPE_FLYABILITY) == false then
            call SetUnitX(c, .x)
            call SetUnitY(c, .y)
        endif
        call SetUnitFlyHeight(c, .z, 0)

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call SetUnitFlyHeight(c, 0, 0)
        set c = null
    endmethod
    
endstruct

function Trig_OkitaSojiW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\SojiAlter_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 0, x, y, 0)
        set move.c = c
        set move.duration = 0.2
        set move.arc = 30
        call move.launch()
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\OkitaAlter_2.mp3")
    endif
    if count == 15 then
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 25, a + 180, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 500, a, - 90, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 500, a + 180, - 90, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 500, a, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 500, a + 90, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 500, a + 180, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 500, a + 270, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, (1 + GetUnitAbilityLevel(c, 'A04S')) * GetHeroAgi(c, true))
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
endfunction

endscope

function Trig_OkitaSojiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A04S' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OkitaSojiW_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_OkitaSojiW takes nothing returns nothing
    set gg_trg_OkitaSojiW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OkitaSojiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_OkitaSojiW, function Trig_OkitaSojiW_Actions )
endfunction