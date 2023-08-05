//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TohkaW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local effect e
    local real dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tohka_2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\utsuhoredsun.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 3, 2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count <= 20 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x1 = PolarX(GetEffectX(e), dist / 20, a)
        set y1 = PolarY(GetEffectY(e), dist / 20, a)
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x1)
            call SetEffectY(e, y1)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x1, y1))
        endif
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        set x1 = PolarX(GetEffectX(e), dist / 20, a)
        set y1 = PolarY(GetEffectY(e), dist / 20, a)
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x1)
            call SetEffectY(e, y1)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x1, y1))
        endif
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Tohka_2-1.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 1)
        call Effect("war3mapImported\\Abyssal_Impact_Base.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Asuma-Explosion.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DustWave.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\NewDirtEXNofire.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\NuclearExplosion.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SuperBigExplosion.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, (1 + GetUnitAbilityLevel(c, 'A05C')) * GetHeroInt(c, true))
            endif
        endloop
        call GroupClear(gGroup)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_TohkaW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A05C' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_TohkaW_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_TohkaW takes nothing returns nothing
    set gg_trg_TohkaW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohkaW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TohkaW, function Trig_TohkaW_Actions )
endfunction