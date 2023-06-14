//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisakaD_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Misaka_7.mp3")
        call SetUnitAnimationByIndex(c, 13)
        call Effect("war3mapimported\\KamaFlower2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 52, 153, 255, 255)
    endif
    if count <= 40 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
            call Effect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei.mdx", x, y, 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Sand_TieShaZhongJi_ZhaKai.mdx", x, y, 25, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 50 then 
        call Effect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_ZhenZhengDeLuoLei.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroInt(c, true))
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
endfunction

function Trig_MisakaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0EH' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MisakaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisakaD takes nothing returns nothing
    set gg_trg_MisakaD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisakaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisakaD, function Trig_MisakaD_Actions)
endfunction