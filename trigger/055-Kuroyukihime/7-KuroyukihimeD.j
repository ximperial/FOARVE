//TESH.scrollpos=45
//TESH.alwaysfold=0
function Trig_KuroyukihimeD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\BlackLotus_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 3)
        call Effect("war3mapimported\\ShockwavePurple.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\blacklotuswave.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 0.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapimported\\ThunderBlackSpark.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 0.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e), 80, a)
        set y = PolarY(GetEffectY(e), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call SetSpecialEffectZ(e, 25 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call SetEffectX(e2, GetEffectX(e))
        call SetEffectY(e2, GetEffectY(e))
        call SetSpecialEffectZ(e2, 25 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 8 * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\Purple Aura.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\DTPurpleNoRing.mdx", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call Effect("war3mapimported\\DTPurpleNoRing.mdx", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Asuma-Explosion4.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e = null
    set e2 = null
endfunction

function Trig_KuroyukihimeD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0A9' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KuroyukihimeD_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KuroyukihimeD takes nothing returns nothing
    set gg_trg_KuroyukihimeD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KuroyukihimeD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KuroyukihimeD, function Trig_KuroyukihimeD_Actions )
endfunction