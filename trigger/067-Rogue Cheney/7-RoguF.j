//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RoguF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Rogue_6.mp3")
        call SoundStart("war3mapImported\\Rogue_6-1.mp3")
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 20 then
        call Effect("war3mapimported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
        loop
            exitwhen i > 6
            set x = PolarX(GetUnitX(t), 500, i * 60)
            set y = PolarY(GetUnitY(t), 500, i * 60)
            call Effect("war3mapimported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei3.mdx", x, y, 25, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            set i = i + 1
        endloop
    endif
    if count == 30 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call knockupUnit(t, 1, 600)
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

function Trig_RoguF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CQ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RoguF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RoguF takes nothing returns nothing
    set gg_trg_RoguF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RoguF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RoguF, function Trig_RoguF_Actions)
endfunction