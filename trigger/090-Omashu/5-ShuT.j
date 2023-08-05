//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShuT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 2)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Shu_5-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\fanty (86).mdl", GetUnitX(c), GetUnitY(c), 25, GetUnitFacing(c), 0, 0, 2, 3, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), a)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 2.5)
        call SaveUnitHandle(ht, GetHandleId(z), 2, v)
    endif
    if count == 25 or count == 50 or count == 75 then
        if GetLocalPlayer() == GetOwningPlayer(c) then
            call ClearSelection()
            call SelectUnit(v, true) 
        endif
    endif
    if count <= 100 then
        if GetUnitFacing(c) != GetUnitFacing(v) then
            call SetUnitFacingEx(c, GetUnitFacing(v), true)
            call SetSpecialEffectYaw(e, GetUnitFacing(v))
        endif
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Shu_5-2.mp3")
        call Effect("war3mapImported\\0810.mdl", GetUnitX(c), GetUnitY(c), 200, GetUnitFacing(c), 0, 0, 4, 3, 255, 255, 255, 255)
        call Effect("war3mapImported\\File00002384.mdl", GetUnitX(c), GetUnitY(c), 200, GetUnitFacing(c), - 90, 0, 1.5, 3, 255, 255, 255, 255)
    endif
    if count >= 100 and count <= 200 then
        loop
            exitwhen i > 12
            set x = PolarX(GetUnitX(c), 150 * i, GetUnitFacing(c))
            set y = PolarY(GetUnitY(c), 150 * i, GetUnitFacing(c))
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) then
                    call IssueImmediateOrderById(gUnit, 851972)
                    if not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(c, gUnit, 15 * GetHeroInt(c, true) / 90)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
            set i = i + 1
        endloop
        call GroupClear(g)
    endif
    if count == 200 then
        set i = 0
        call Effect("war3mapImported\\FantasyBattle (1582).mdl", GetUnitX(c), GetUnitY(c), 25, GetUnitFacing(c), 0, 0, 2, 1, 255, 255, 255, 255)
        loop
            exitwhen i > 7
            set x = PolarX(GetUnitX(c), 200 + 300 * i, GetUnitFacing(c))
            set y = PolarY(GetUnitY(c), 200 + 300 * i, GetUnitFacing(c))
            call Effect("war3mapImported\\FantasyBattle (1643).mdl", x, y, 200, GetUnitFacing(c), 0, 0, 3, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
    endif
    if count == 205 then
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
    set v = null
    set e = null
endfunction

function Trig_ShuT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A05P' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 3, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_ShuT_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ShuT takes nothing returns nothing
    set gg_trg_ShuT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShuT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ShuT, function Trig_ShuT_Actions)
endfunction