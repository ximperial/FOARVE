//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_OkitaSojiE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real a = GetUnitFacing(c)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\SojiAlter_2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
    endif
    if count == 5 then
        call SoundStart("war3mapImported\\Shana_2-2.mp3")
    endif
    if count == 10 then
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\NanaSlash.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0CS')) * GetHeroAgi(c, true))
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

function Trig_OkitaSojiE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0CS' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OkitaSojiE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_OkitaSojiE takes nothing returns nothing
    set gg_trg_OkitaSojiE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OkitaSojiE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_OkitaSojiE, function Trig_OkitaSojiE_Actions )
endfunction