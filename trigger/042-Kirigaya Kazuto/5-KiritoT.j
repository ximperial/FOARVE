//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_KiritoT_Func001 takes nothing returns nothing
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
    local real randomA
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
        call SoundStart("war3mapImported\\Kirito_5-4.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 18)
        call SetUnitTimeScale(c, 0.9)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 15, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        loop
            exitwhen i > 7
            set x = PolarX(GetUnitX(t), 400, i * 45)
            set y = PolarY(GetUnitY(t), 400, i * 45)
            call Effect("war3mapImported\\Effect_Fate_jiujian_galibang_dimianjianqi2.mdx", x, y, 30, randomAngle(), 0, 0, 2, 16, 255, 255, 255, 255)
            
            set i = i + 1
        endloop
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
    endif
    if count == 100 then
        call SetUnitTimeScale(c, 2)
    endif
    if count >= 120 and count <= 720 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 10 or iterator == 20 then
            if iterator == 20 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SetUnitAnimationByIndex(c, 32)
            endif
            set x = LoadReal(ht, GetHandleId(z), 0)
            set y = LoadReal(ht, GetHandleId(z), 1)
            set randomA = randomAngle()
            call SetUnitX(t, PolarX(x, GetRandomReal(200, 400), randomA))
            call SetUnitY(t, PolarY(y, GetRandomReal(200, 400), randomA))
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 12, 0)
            set randomA = randomAngle()
            call SetUnitX(c, PolarX(GetUnitX(t), 140, randomA))
            call SetUnitY(c, PolarY(GetUnitY(t), 140, randomA))
            set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(c, a, true)
            call SetUnitFlyHeight(c, GetUnitFlyHeight(t), 0)
            if GetRandomInt(1, 2) == 1 then
                set randomA = GetRandomReal(15, 25)
                call Effect("war3mapImported\\bule-dark-salsh_21.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                set randomA = GetRandomReal(-40, -20)
                call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
                set randomA = GetRandomReal(15, 25)
                call Effect("war3mapImported\\bule-dark-salsh_21.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                set randomA = GetRandomReal(-40, -20)
                call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
            else
                if GetRandomInt(1, 2) == 1 then
                    set randomA = GetRandomReal(15, 25)
                    call Effect("war3mapImported\\bule-dark-salsh_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                    set randomA = GetRandomReal(-40, -20)
                    call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(2, 3.5), 1, 255, 255, 0, 255)
                    set randomA = GetRandomReal(15, 25)
                    call Effect("war3mapImported\\bule-dark-salsh_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                    set randomA = GetRandomReal(-40, -20)
                    call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(2, 3.5), 1, 255, 255, 0, 255)
                else
                    set randomA = GetRandomReal(15, 25)
                    call Effect("war3mapImported\\bule-dark-salsh_21.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                    set randomA = GetRandomReal(-40, -20)
                    call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
                    set randomA = GetRandomReal(15, 25)
                    call Effect("war3mapImported\\bule-dark-salsh_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                    set randomA = GetRandomReal(-40, -20)
                    call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, GetRandomReal(2, 3.5), 1, 255, 255, 0, 255)
                endif
            endif
        endif
    endif
    if count == 730 then
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        call SetUnitX(t, x)
        call SetUnitY(t, y)
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(GetUnitX(t), 140, randomA))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, randomA))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 20)
        call SetUnitTimeScale(c, 1)
    endif
    if count >= 740 and count <= 770 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 24, 0)
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t), 0)
    endif
    if count == 750 or count == 755 or count == 760 or count == 765 then
        call Effect("war3mapImported\\wind2.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(80))
    endif
    if count == 770 then
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapImported\\blue-guagnzhu-special.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    endif
    if count == 780 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_KiritoT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00J' then 
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
        call TimerStart(z, 0.02, true, function Trig_KiritoT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KiritoT takes nothing returns nothing
    set gg_trg_KiritoT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KiritoT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KiritoT, function Trig_KiritoT_Actions )
endfunction