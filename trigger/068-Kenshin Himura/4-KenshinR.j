//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KenshinR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kenshin_4.mp3")
        call SoundStart("war3mapImported\\Kenshin_4-1.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    endif
    if count <= 100 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 5 or iterator == 10 then
            if iterator == 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SetUnitX(c, PolarX(GetUnitX(t), GetRandomReal(100, 500), randomAngle()))
                call SetUnitY(c, PolarY(GetUnitY(t), GetRandomReal(100, 500), randomAngle()))
                set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
                call SetUnitFacingEx(c, a, true)
                call SetUnitAnimationByIndex(c, GetRandomInt(11, 12))
                call Effect("war3mapImported\\File00009632.mdx", GetUnitX(t), GetUnitY(t), 300, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
            call Effect("war3mapimported\\kiritoslash.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(100, 500), randomAngle(), - 45, 0, GetRandomReal(0.85, 2.5), 1, 255, 0, 0, 255)
            call Effect("war3mapimported\\DGDDXZ4.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(200, 500), randomAngle(), - 45, 0, GetRandomReal(0.85, 1.85), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Kenshin_4-2.mp3")
        call Effect("war3mapimported\\FCJX_DG.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 110 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0CV')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_KenshinR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CV' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KenshinR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KenshinR takes nothing returns nothing
    set gg_trg_KenshinR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshinR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KenshinR, function Trig_KenshinR_Actions)
endfunction