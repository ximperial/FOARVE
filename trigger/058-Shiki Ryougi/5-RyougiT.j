//TESH.scrollpos=3
//TESH.alwaysfold=0
function Trig_RyougiT_Func001 takes nothing returns nothing
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
        call SoundStart( "war3mapImported\\Ryougi_8.mp3" )
        call SoundStart( "war3mapImported\\Ryougi_8-2.mp3" )
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SetUnitAnimation(c, "spell three")
        call SetUnitTimeScale(c, 1.5)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", c, "right hand"))
        call Effect("war3mapimported\\wind2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\sakura round.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]qianbenying8.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 2, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SoundStart( "war3mapImported\\Ryougi_8-3.mp3" )
    endif
    if count == 20 then
        call SetUnitAnimation(c, "spell four")
    endif
    if count == 40 then
        call SetUnitTimeScale(c, 1)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 40 and count <= 80 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 20, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 20, a))
    endif
    if count == 60 then
        call SoundStart( "war3mapImported\\Ryougi_8-5.mp3" )
        call SoundStart( "war3mapImported\\Ryougi_8-6.mp3" )
        call SetUnitAnimation(c, "spell five")
    endif
    if count == 80 then
        call Effect("war3mapimported\\BasicStrikeStar.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\Akiha Claw sakura.mdx", GetUnitX(t), GetUnitY(t), 40, a + 45, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AncientExplode2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\PurpleExp.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 90 then 
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

function Trig_RyougiT_Func002 takes nothing returns nothing
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
    local real dmg 
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Ryougi_8.mp3" )
        call SoundStart( "war3mapImported\\Ryougi_8-2.mp3" )
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SetUnitAnimation(c, "spell three")
        call SetUnitTimeScale(c, 1.5)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", c, "right hand"))
        call Effect("war3mapimported\\wind2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\sakura round.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]qianbenying8.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 2, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SoundStart( "war3mapImported\\Ryougi_8-3.mp3" )
    endif
    if count == 20 then
        call SetUnitAnimation(c, "spell four")
    endif
    if count == 40 then
        call SetUnitTimeScale(c, 1)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 40 and count <= 80 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 20, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 20, a))
    endif
    if count == 60 then
        call SoundStart( "war3mapImported\\Ryougi_8-5.mp3" )
        call SoundStart( "war3mapImported\\Ryougi_8-6.mp3" )
        call SetUnitAnimation(c, "spell five")
    endif
    if count == 80 then
        call Effect("war3mapimported\\BasicStrikeStar.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\Akiha Claw sakura.mdx", GetUnitX(t), GetUnitY(t), 40, a + 45, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AncientExplode2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\PurpleExp.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 90 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 0.3 * GetUnitAbilityLevel(c, 'B01O')
        call DamageUnit(c, t, (dmg + 15) * GetHeroAgi(c, true))
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

function Trig_RyougiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00D' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if GetUnitAbilityLevel(c, 'B01O') > 0 then
            call TimerStart(z, 0.02, true, function Trig_RyougiT_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_RyougiT_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RyougiT takes nothing returns nothing
    set gg_trg_RyougiT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyougiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyougiT, function Trig_RyougiT_Actions )
endfunction