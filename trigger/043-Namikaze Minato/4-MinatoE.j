//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_MinatoE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart( "war3mapImported\\Minato_3.mp3" )
        if GetUnitTypeId(c) != 'H01M' then
            call MorphUnit(c, 'H01M')
        endif
        call SaveEffectHandle(ht, GetHandleId(z), 1, AddSpecialEffectTarget("war3mapimported\\yonda-aura.mdx", c, "origin"))
        call DisableAbility(GetUnitAbility(c, 'A00Y'), true, true)
        call EnableAbility(GetUnitAbility(c, 'A0GU'), true, true)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and GetUnitAbilityLevel(c, 'B01S') == 0 and IsUnitAlive(c) then 
        call MorphUnit(c, 'H01L')
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 1))
        call DisableAbility(GetUnitAbility(c, 'A0GU'), true, true)
        call EnableAbility(GetUnitAbility(c, 'A00Y'), true, true)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

scope MinatoE

    private struct Missile extends Missiles
    
    unit c
    effect e
    
    method onPeriod takes nothing returns boolean
        if not IsTerrainPathable(.x, .y, PATHING_TYPE_FLYABILITY) then
            call SetSpecialEffectPositionEx(e, .x, .y, .z)
        endif

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        set c = null
        set e = null
    endmethod
    
endstruct

function Trig_MinatoE_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local Missile move
    local integer i = 0
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Minato_3-1.mp3" )
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 13)
        loop
            exitwhen i > 26
            set x1 = PolarX(x, GetRandomReal(200, 800), randomAngle())
            set y1 = PolarY(y, GetRandomReal(200, 800), randomAngle())
            set a = Angle(GetUnitX(c), GetUnitY(c), x1, y1)
            set move = Missile.create(GetUnitX(c), GetUnitY(c), 50, x1, y1, 10)
            set move.c = c
            set move.duration = 0.4
            call Effect("war3mapImported\\minato_kunai.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 60, 0, 1.1, 3.5, 255, 255, 255, 255)
            set move.e = bj_lastCreatedEffect
            call SaveEffectHandle(ht, GetHandleId(z), 1 + i, bj_lastCreatedEffect)
            call move.launch()
            set i = i + 1
        endloop
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 2)
        call SaveEffectHandle(ht, GetHandleId(z), -1, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", c, "origin"))
        call SaveEffectHandle(ht, GetHandleId(z), -2, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", c, "chest"))
        call SaveEffectHandle(ht, GetHandleId(z), -3, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", c, "overhead"))
    endif
    if count >= 25 and count <= 165 then
        call GroupEnumUnitsInRange(gGroup, x, y, 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, ((3 + GetUnitAbilityLevel(c, 'A0GU')) * GetHeroAgi(c, true)) / 140)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveInteger(ht, GetHandleId(z), 2, LoadInteger(ht, GetHandleId(z), 2) + 1)
            set e = LoadEffectHandle(ht, GetHandleId(z), LoadInteger(ht, GetHandleId(z), 2))
            set a = Angle(GetUnitX(c), GetUnitY(c), GetEffectX(e), GetEffectY(e))
            call SetUnitX(c, GetEffectX(e))
            call SetUnitY(c, GetEffectY(e))
            call SetUnitFacingEx(c, a, true)
            call SetUnitAnimation(c, "attack")
            call Effect("war3mapImported\\DTKuning.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\yonda-slash2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2.2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            if LoadInteger(ht, GetHandleId(z), 2) > 26 then
                call SaveInteger(ht, GetHandleId(z), 2, 0)
            endif
        endif   
    endif
    if count == 165 then
        call SetUnitTimeScale(c, 1)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), -1))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), -2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), -3))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

endscope

function Trig_MinatoE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A00Y' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MinatoE_Func001)
    endif
    if GetSpellAbilityId() == 'A0GU' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MinatoE_Func002)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MinatoE takes nothing returns nothing
    set gg_trg_MinatoE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MinatoE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MinatoE, function Trig_MinatoE_Actions )
endfunction