//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ZweiF_Func001 takes nothing returns nothing
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
    local real ux
    local real uy
    local real randomA
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Reinforce_6.mp3")
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 10, a, 0, 0, 2, 5, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapimported\\az_blacksmoke.mdx", GetUnitX(t), GetUnitY(t), 1100, randomAngle(), 0, 0, 2, 4, 255, 255, 255, 255)
        call Effect("war3mapimported\\NanohaMidchilderDivine.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 5.5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count <= 150 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.025)
    endif
    if count >= 150 and count <= 250 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set ux = GetUnitX(t)
            set uy = GetUnitY(t)
            set randomA = randomAngle()
            set x = PolarX(ux, GetRandomReal(-600, 600), randomA)
            set y = PolarY(uy, GetRandomReal(-600, 600), randomA)
            call Effect("war3mapimported\\Evolt-1.mdx", x, y, 900, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei-purp.mdx", x, y, 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Sand_TieShaZhongJi_ZhaKai.mdx", x, y, 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 260 then
        call SoundStart("war3mapImported\\biu3.mp3")
        call Effect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_ZhenZhengDeLuoLei-purp.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 270 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroInt(c, true))
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

function Trig_ZweiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09K' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ZweiF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ZweiF takes nothing returns nothing
    set gg_trg_ZweiF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ZweiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ZweiF, function Trig_ZweiF_Actions)
endfunction