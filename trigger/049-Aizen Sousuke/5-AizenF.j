//TESH.scrollpos=10
//TESH.alwaysfold=0
function Trig_AizenF_Func001 takes nothing returns nothing
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
    if count == 1 then
        call SoundStart("war3mapImported\\Aizen_6.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0)) 
        call SetUnitX(c, PolarX(GetUnitX(t), - 800, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 800, a))
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count <= 90 then
        call SetUnitX(c, PolarX(GetUnitX(c), 5, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 5, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveNew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 40)
            call Effect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 25)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapimported\\white-qiquan-juhuang.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 25)
            call Effect("war3mapimported\\Aizen_Form_squished.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 0.6, 255, 255, 255, 125)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        endif
    endif
    if count == 90 then
        call Effect("war3mapimported\\[DoFT]cf.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.6, 1, 255, 255, 255, 255)
    endif
    if count == 100 then
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\[DoFT]dingzhi_by_wood_effect_blood_biaoxue_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 110 then
        call SoundStart("war3mapImported\\Aizen_6-1.mp3")
        call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]t_thunderclapcaster.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]az_hit-blue-blade.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 120 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_AizenF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A03S' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AizenF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AizenF takes nothing returns nothing
    set gg_trg_AizenF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AizenF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AizenF, function Trig_AizenF_Actions )
endfunction