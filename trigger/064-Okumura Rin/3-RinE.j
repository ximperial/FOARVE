//TESH.scrollpos=30
//TESH.alwaysfold=0
function Trig_RinE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 1)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z) , 2)
    local real r1
    if GetUnitManaPercent(c) > 5 and GetUnitAbilityLevel(c, 'B01Q') > 0 and IsUnitAlive(c) then
        if not IsUnitInvulnerable(c) then
            call SetUnitCurrentMana(c, GetUnitCurrentMana(c) - (GetUnitMaxMana(c) * 0.01 / 50))
        endif
        call SetEffectX(e, GetUnitX(c))
        call SetEffectY(e, GetUnitY(c))
        call SetSpecialEffectZ(e, 25 + GetUnitZ(c))
    else
        set r1 = -LoadReal(ht, GetHandleId(z) , 0)
        call UnitAddBonus(c, BONUS_MOVESPEED, r1)
        call IssueImmediateOrderById(c, 852178)
        call UnitRemoveAbility(c, 'B01Q')
        call DestroyEffect(e)
        call DestroyEffect(e2)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set e2 = null
endfunction

function Trig_RinE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real r1
    if GetIssuedOrderId() == 852177 and GetUnitTypeId(c) == 'H0D4' then
        set z = CreateTimer()
        if GetRandomInt(1, 2) == 1 then 
            call SoundStart("war3mapImported\\Rin_3.mp3")
        else
            call SoundStart("war3mapImported\\Rin_3-1.mp3")
        endif
        set r1 = 0.05 + 0.05 * GetUnitAbilityLevel(c, 'A08N')
        call UnitAddBonus(c, BONUS_MOVESPEED, r1)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1, 1, PercentTo255(40) , PercentTo255(40) , 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1.25, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        set bj_lastCreatedEffect = AddSpecialEffect("war3mapImported\\[A]RinRfire.mdl", GetUnitX(c) , GetUnitY(c))
        call SetSpecialEffectZ(bj_lastCreatedEffect, 25 + GetAxisZ(GetUnitX(c) , GetUnitY(c)))
        call SetSpecialEffectScale(bj_lastCreatedEffect, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z) , 1, bj_lastCreatedEffect)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, AddSpecialEffectTarget("war3mapImported\\hero_spiritbreaker_n3s_aghanim1.mdl", c, "weapon"))
        call SaveReal(ht, GetHandleId(z) , 0, r1)
        call TimerStart(z, 0.02, true, function Trig_RinE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_RinE takes nothing returns nothing
    set gg_trg_RinE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RinE, EVENT_PLAYER_UNIT_ISSUED_ORDER)
    call TriggerAddAction(gg_trg_RinE, function Trig_RinE_Actions)
endfunction