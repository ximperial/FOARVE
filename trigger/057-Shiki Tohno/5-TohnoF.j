//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TohnoF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Tohno_6.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    endif
    if count == 5 or count == 35 or count == 65 or count == 95 then 
        call SetUnitAnimation(c, "attack")
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 5 and count <= 30 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 36, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 36, a)) 
    endif
    if count >= 35 and count <= 60 or count >= 65 and count <= 90 or count >= 95 and count <= 120 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 24, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 24, a)) 
    endif
    if count == 30 or count == 60 or count == 90 then
        call SetUnitFacing(c, a)
    endif
    if count == 20 or count == 80 then
        call SoundStart("war3mapImported\\Tohno_6-1.mp3")
        loop
            exitwhen i > 11
            set x = PolarX(GetUnitX(t), GetRandomReal(- 120, - 180), a)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 120, - 180), a)
            set a = LoadReal(ht, GetHandleId(z), 0)
            if GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", x, y, 120, a + GetRandomReal(- 45, 45), 0, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 20, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 340, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            else
                call Effect("war3mapimported\\qzzz.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 320, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
            set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(5, 7), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
            set i = i + 1
        endloop
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Tohno_6-2.mp3")
        loop
            exitwhen i > 11
            set x = PolarX(GetUnitX(t), GetRandomReal(- 120, - 180), a)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 120, - 180), a)
            set a = LoadReal(ht, GetHandleId(z), 0)
            if GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), 0, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 20, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 340, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            else
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 320, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
            set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\FCJX_DG.mdx", x, y, GetRandomReal(200, 600), randomAngle(), GetRandomReal(- 120, - 140), 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
            set i = i + 1
        endloop
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Tohno_6-3.mp3")
        loop
            exitwhen i > 13
            set x = PolarX(GetUnitX(t), GetRandomReal(- 700, 700), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 700, 700), randomAngle())
            call Effect("war3mapimported\\FCJX_DG.mdx", x, y, 250, randomAngle(), GetRandomReal(- 120, - 140), 0, 3, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        set a = LoadReal(ht, GetHandleId(z), 0)
        call Effect("war3mapimported\\yishan2Red.mdx", GetUnitX(t), GetUnitY(t), 25, a + 40, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\yishan2Red.mdx", GetUnitX(t), GetUnitY(t), 25, a - 40, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 130 then 
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

function Trig_TohnoF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0AS' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TohnoF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TohnoF takes nothing returns nothing
    set gg_trg_TohnoF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohnoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TohnoF, function Trig_TohnoF_Actions )
endfunction