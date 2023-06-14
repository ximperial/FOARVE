//TESH.scrollpos=48
//TESH.alwaysfold=0
globals
    integer HibariRHash = StringHash("HibariR")
    integer HibariRMPHash = StringHash("HibariRMP")
    integer HibariRXHash = StringHash("HibariRXHash")
    integer HibariRYHash = StringHash("HibariRYHash")
endglobals

function Trig_HibariR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer cal = LoadInteger(ht, GetHandleId(z) , 1)
    local real a = GetUnitFacing(c)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 2)
    local integer i = 0
    local real x
    local real y
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 and RectContainsCoords(gg_rct_Boss_Arena, GetUnitX(c) , GetUnitY(c)) then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
        set z = null
        set c = null
        set e = null
        set g = null
        return
    endif
    if count <= 50 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Hibari_4.mp3")
        call SetUnitAnimationByIndex(c, 8)
        set bj_lastCreatedEffect = AddSpecialEffect("war3mapImported\\hibary double box.mdl", GetUnitX(c) , GetUnitY(c))
        call SetSpecialEffectZ(bj_lastCreatedEffect, 25 + GetAxisZ(GetUnitX(c) , GetUnitY(c)))
        call SetSpecialEffectYaw(bj_lastCreatedEffect, a)
        call SetSpecialEffectVertexColour(bj_lastCreatedEffect, 255, 255, 255, PercentTo255(30))
        call SetSpecialEffectScale(bj_lastCreatedEffect, 1)
        call SaveEffectHandle(ht, GetHandleId(z) , 1, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 50 then
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.6)
        call SetSpecialEffectZ(e, GetEffectZ(e) + 2)
    endif
    if count == 50 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call SaveUnitHandle(ht, GetHandleId(z), 3, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    endif
    if count >= 50 and count <= 450 then
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 1000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if IsUnitAlive(gUnit) and IsUnitType(gUnit, UNIT_TYPE_HERO) and not IsUnitInvulnerable(gUnit) and not IsUnitInGroup(gUnit, g) then
                call SaveBoolean(ht, HibariRHash , GetHandleId(gUnit) , true)
                call SaveReal(ht, HibariRMPHash , GetHandleId(gUnit) , GetUnitState(gUnit, UNIT_STATE_MANA))
                call SaveReal(ht, HibariRXHash , GetHandleId(gUnit) , GetUnitX(gUnit))
                call SaveReal(ht, HibariRYHash , GetHandleId(gUnit) , GetUnitY(gUnit))
                set x = GetRandomReal(GetRectMinX(gg_rct_HibariR), GetRectMaxX(gg_rct_HibariR))
                set y = GetRandomReal(GetRectMinY(gg_rct_HibariR), GetRectMaxY(gg_rct_HibariR))
                call SetUnitXY(gUnit, x, y, 0)
                if GetLocalPlayer() == GetOwningPlayer(gUnit) then
                    call PanCameraToTimed(GetUnitX(gUnit), GetUnitY(gUnit), 0.01)
                endif
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        loop
            set gUnit = GroupForEachUnit(g)
            exitwhen gUnit == null
            if GetUnitLifePercent(gUnit) > 5 then
                if gUnit != c then
                    call SetUnitLifePercentBJ(gUnit, GetUnitLifePercent(gUnit) - 0.12)
                else
                    call SetUnitLifePercentBJ(gUnit, GetUnitLifePercent(gUnit) - 0.04)
                endif
            endif
            call SetUnitState(gUnit, UNIT_STATE_MANA, 0)
            if not RectContainsCoords(gg_rct_HibariR, GetUnitX(gUnit), GetUnitY(gUnit)) and Distance(GetUnitX(gUnit), GetUnitY(gUnit), GetRectCenterX(gg_rct_HibariR), GetRectCenterY(gg_rct_HibariR)) <= 2000 then
                call SetUnitBoundXY(gUnit, gg_rct_HibariR, false)
            endif
        endloop
    endif
    if count >= 50 and not RectContainsCoords(gg_rct_HibariR, GetUnitX(c) , GetUnitY(c)) then
        loop
            set gUnit = GroupForEachUnit(g)
            exitwhen gUnit == null
            call SetUnitState(gUnit, UNIT_STATE_MANA, LoadReal(ht, HibariRMPHash , GetHandleId(gUnit)))
        endloop
        call SetEffectX(e, GetRectCenterX(gg_rct_dummyrect))
        call SetEffectY(e, GetRectCenterY(gg_rct_dummyrect))
        call DestroyEffect(e)
        call DestroyGroup(g)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 3))
        call FlushChildHashtable(ht, HibariRHash)
        call FlushChildHashtable(ht, HibariRMPHash)
        call FlushChildHashtable(ht, HibariRXHash)
        call FlushChildHashtable(ht, HibariRYHash)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
        set z = null
        set c = null
        set e = null
        set g = null
        return
    endif
    if count == 450 or(count >= 50 and not IsUnitAlive(c)) then
        loop
            set gUnit = GroupForEachUnit(g)
            exitwhen gUnit == null
            if IsUnitAlive(gUnit) then
                call SetUnitX(gUnit, LoadReal(ht, HibariRXHash , GetHandleId(gUnit)))
                call SetUnitY(gUnit, LoadReal(ht, HibariRYHash , GetHandleId(gUnit)))
                if GetLocalPlayer() == GetOwningPlayer(gUnit) then
                    call PanCameraToTimed(GetUnitX(gUnit), GetUnitY(gUnit), 0.01)
                endif
                call SetUnitState(gUnit, UNIT_STATE_MANA, LoadReal(ht, HibariRMPHash , GetHandleId(gUnit)))
            endif
        endloop
        call SetEffectX(e, GetRectCenterX(gg_rct_dummyrect))
        call SetEffectY(e, GetRectCenterY(gg_rct_dummyrect))
        call DestroyEffect(e)
        call DestroyGroup(g)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 3))
        call FlushChildHashtable(ht, HibariRHash)
        call FlushChildHashtable(ht, HibariRMPHash)
        call FlushChildHashtable(ht, HibariRXHash)
        call FlushChildHashtable(ht, HibariRYHash)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
        set z = null
        set c = null
        set e = null
        set g = null
        return
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_HibariR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A04E' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 2, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_HibariR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_HibariR takes nothing returns nothing
    set gg_trg_HibariR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HibariR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_HibariR, function Trig_HibariR_Actions)
endfunction