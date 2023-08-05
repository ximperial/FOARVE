//TESH.scrollpos=30
//TESH.alwaysfold=0
function Trig_HibariF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Hibari_6.mp3")
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("Abilities\\Weapons\\SludgeMissile\\SludgeMissile.mdl", c, "hand left"))
        call SaveEffectHandle(ht, GetHandleId(z), 3, AddSpecialEffectTarget("Abilities\\Weapons\\SludgeMissile\\SludgeMissile.mdl", c, "hand right"))
    endif
    if count == 10 then
        call SetUnitX(c, PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle()))
        call SetUnitY(c, PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle()))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitAnimationByIndex(c, GetRandomInt(2, 3))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\RedSlash2a.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 51, 255, 255)
    endif
    if count >= 10 and count <= 140 then 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 5 or iterator == 10 then
            call SetUnitX(c, PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle()))
            call SetUnitY(c, PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle()))
            call SetUnitFacingToFaceUnitTimed(c, t, 0)
            call SetUnitAnimationByIndex(c, GetRandomInt(2, 3))
            set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\RedSlash2a.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 51, 255, 255)
            if iterator == 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapImported\\az_slb.mdx", x, y, 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\az_magina[2]_b.mdx", x, y, 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            endif
        endif
    endif
    if count == 150 then
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 160 then
        call SetUnitAnimationByIndex(c, 3)
        call Effect("war3mapImported\\slam09.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\violet spark by deckai.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\az_slb.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 170 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_HibariF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A04K' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_HibariF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_HibariF takes nothing returns nothing
    set gg_trg_HibariF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HibariF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_HibariF, function Trig_HibariF_Actions )
endfunction