//TESH.scrollpos=21
//TESH.alwaysfold=0
function Trig_GrayT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Gray_5.mp3")
        call SetUnitAnimationByIndex(c, 7)
        call Effect("war3mapImported\\HolyBlessing.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 6, 255, 255, 255, 255)
        call Effect("war3mapImported\\HarvestMana.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 6, 255, 255, 255, 255)
    endif
    if count == 1 or count == 50 or count == 150 or count == 250 then
        call Effect("Abilities\\Spells\\Other\\Charm\\CharmTarget.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dead Spirit by Deckai2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
    endif
    if count == 100 then
        call Effect("war3mapImported\\HarvestMana.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 3, 255, 255, 255, 255)
    endif
    if count == 250 then
        call Effect("war3mapImported\\Icestomp.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count <= 300 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 15 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.65, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.65, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
    endif
    if count == 300 then
        call Effect("war3mapimported\\sbss_bingdongxili.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\icefirst.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\afbbxks.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 310 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_GrayT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A03J' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_GrayT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_GrayT takes nothing returns nothing
    set gg_trg_GrayT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GrayT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GrayT, function Trig_GrayT_Actions )
endfunction