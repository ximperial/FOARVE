//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_NeptunD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Neptun_7.mp3")
        call SoundStart("war3mapImported\\Neptun_7-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\DTPurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\ShockwavePurple.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.8, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\V.mdx", GetUnitX(c), GetUnitY(c), 150, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
    endif
    if count >= 15 and count <= 45 then
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitFacingEx(c, GetUnitFacing(c) + 18, true)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 400, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                set dmg = 0.4 * GetUnitAbilityLevel(c, 'B003')
                call DamageUnit(c, gUnit, (dmg + 8) * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 6 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SetUnitAnimation(c, "attack")
            call Effect("war3mapimported\\!basicstrike!.mdx", GetUnitX(c), GetUnitY(c), 150, GetUnitFacing(c), 0, 0, 5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\starslash(missle).mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(2, 2.5), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(3, 4), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
            call Effect("war3mapimported\\neptunering.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(0.7, 1.25), 1, 255, 255, 255, PercentTo255(65))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
    endif
    if count == 45 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        if GroupGetCount(g) == 0 then
            call DisableAbility(GetUnitAbility(c, 'A0BT'), true, true)
            call EnableAbility(GetUnitAbility(c, 'A0I3'), true, true)
        endif
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction

function Trig_NeptunD_Func002 takes nothing returns nothing
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
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Neptun_7-2.mp3")
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 1 or count == 15 or count == 35 or count == 60 or count == 100 or count == 120 or count == 140 or count == 160 then
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.85, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 1.2))
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(1, 1.65), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
    endif
    if count == 25 or count == 35 or count == 45 or count == 60 or count == 75 or count == 90 then
        call Effect("war3mapimported\\EnergyBurst.mdx", GetUnitX(t), GetUnitY(t), 60, randomAngle(), 0, 0, GetRandomReal(1.65, 2.2), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.65, 0.85))
        call Effect("war3mapimported\\1062.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, GetRandomReal(0.5, 0.7), 1, 153, 51, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.9, 1.2))
        if GetRandomInt(1, 2) == 1 then
            call Effect("war3mapimported\\1062.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), -30, 0, GetRandomReal(0.5, 0.7), 1, 153, 51, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.9, 1.2))
        else
            call Effect("war3mapimported\\1062.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 30, 0, GetRandomReal(0.5, 0.7), 1, 153, 51, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.9, 1.2))
        endif
        call Effect("war3mapimported\\36-purp.mdx", GetUnitX(c), GetUnitY(c), 60, randomAngle(), 0, 0, GetRandomReal(0.9, 1.25), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.9))
    endif
    if count == 20 or count == 40 or count == 60 or count == 80 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Ogita_5-3.mp3")
    endif
    if count <= 100 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
        else
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
    endif
    if count == 110 then
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 5, 2, 153, 51, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
    endif
    if count >= 100 and count <= 140 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 50, a, -90, 0, GetRandomReal(1, 1.5), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            call Effect("war3mapimported\\punchshot.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(0.4, 0.8), 1, 255, 255, 255, PercentTo255(GetRandomReal(70, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.85))
        endif
    endif
    if count == 120 then
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 0.5)
    endif
    if count >= 120 and count <= 170 then
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 25, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 25, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
    endif
    if count == 170 then
        call SoundStart("war3mapImported\\Naruto_1-1.mp3")
        call ShakeCamera(1.5, GetOwningPlayer(c), 10)
        call ShakeCamera(1.5, GetOwningPlayer(t), 15)
        call Effect("war3mapimported\\123 (383)-fire.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6) 
    endif
    if count == 180 then 
        call DisableAbility(GetUnitAbility(c, 'A0I3'), true, true)
        call EnableAbility(GetUnitAbility(c, 'A0BT'), true, true)
        call StartAbilityCooldown(GetUnitAbility(c, 'A0BT'), 60)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 0.4 * GetUnitAbilityLevel(c, 'B003')
        call DamageUnit(c, t, (dmg + 8) * GetHeroAgi(c, true))
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

function Trig_NeptunD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0BT' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_NeptunD_Func001)
    endif
    if GetSpellAbilityId() == 'A0I3' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NeptunD_Func002)
    endif
    set z = null
    set c = null
    set t = null
endfunction
    
//===========================================================================
function InitTrig_NeptunD takes nothing returns nothing
    set gg_trg_NeptunD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NeptunD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NeptunD, function Trig_NeptunD_Actions)
endfunction