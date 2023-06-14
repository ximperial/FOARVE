//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShanaW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Shana_2.mp3")
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitTimeScale(c, 1.25)
        call Effect("war3mapimported\\Dota_Effect_lina_longpozhan.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count <= 15 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        if dist > 140 then 
            call SetEffectX(e, PolarX(GetEffectX(e), dist / 10, a))
            call SetEffectY(e, PolarY(GetEffectY(e), dist / 10, a))
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)) + 50)
        else
            call SetEffectX(e, PolarX(GetUnitX(t), - 120, a))
            call SetEffectY(e, PolarY(GetUnitY(t), - 120, a))
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)) + 50)
        endif
    endif
    if count == 15 then
        call SetSpecialEffectAnimationByIndex(e, 1)
    endif
    if count == 25 then
        call SoundStart("war3mapImported\\Shana_2-1.mp3")
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a)) 
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)  
    endif
    if count == 35 then
        call SoundStart("war3mapImported\\Shana_2-2.mp3")
        call Effect("war3mapImported\\NanaSlash.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
    endif
    if count == 40 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0C2')) * GetHeroInt(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_ShanaW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0C2' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ShanaW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ShanaW takes nothing returns nothing
    set gg_trg_ShanaW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShanaW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ShanaW, function Trig_ShanaW_Actions)
endfunction