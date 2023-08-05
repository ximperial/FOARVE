//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RoguR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local group g2 = LoadGroupHandle(ht, GetHandleId(z) , 2)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 3)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 4)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 125 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Rogue_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapimported\\brs 1.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Desecrate.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), a)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 2)
        call SaveUnitHandle(ht, GetHandleId(z), 4, v)
        if GetLocalPlayer() == GetOwningPlayer(c) then 
            call ClearSelection()
            call SelectUnit(v, true)
        endif
    endif
    if count == 25 or count == 50 or count == 75 then
        if GetLocalPlayer() == GetOwningPlayer(c) then 
            call ClearSelection()
            call SelectUnit(v, true)
        endif
    endif
    if count == 50 then
        call Effect("war3mapimported\\brs 1.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 100 then
        call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(v))
        set a = GetUnitFacing(v)
        call SetUnitFacing(c, GetUnitFacing(v))
    endif
    if count == 100 then
        call SetUnitAnimationByIndex(c, 11)
        call Effect("war3mapimported\\brs 1.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DarkBlast.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Desecrate.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Dead Spirit by Deckai3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("", GetUnitX(c) , GetUnitY(c) , 0, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 100 and count <= 150 then
        set x = PolarX(GetEffectX(e) , 40, a)
        set y = PolarY(GetEffectY(e) , 40, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300 + (count - 100) * 4, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A0CO')) * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        call Effect("war3mapimported\\GajeelHoukou.mdx", GetEffectX(e), GetEffectY(e), 25 + (count - 100) * 10, a, 0, 0, 1 + (count - 100) * 0.18, 1, 0, 0, 0, 255)
    endif
    if count <= 100 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g2) then 
                call GroupAddUnit(g2, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 100 then
        call ForGroup(g2, function ResetMoveSpeed)
        call DestroyGroup(g2)
    endif
    if count == 125 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count == 150 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set g2 = null
    set e = null
    set v = null
endfunction

function Trig_RoguR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0CO' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call SaveGroupHandle(ht, GetHandleId(z) , 2, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_RoguR_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_RoguR takes nothing returns nothing
    set gg_trg_RoguR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RoguR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RoguR, function Trig_RoguR_Actions)
endfunction