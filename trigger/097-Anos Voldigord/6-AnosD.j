//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AnosD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 2)
    local real a
    if count < 250 then
        if not IsUnitInvulnerable(c) then 
            set count = count + 1
            call SaveInteger(ht, GetHandleId(z), 0, count)
        endif
        if not IsUnitAlive(c) or GetUnitAbilityLevel(c, 'B00K') == 0 then
            call UnitRemoveAbility(c, 'A0EW')
            call UnitRemoveAbility(c, 'B00K')
            call FlushChildHashtable(ht, GetHandleId(z)) 
            call PauseTimer(z)
            call DestroyTimer(z)
            set z = null
            set c = null
            return
        endif
    else
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 250 then
        call SoundStart("war3mapImported\\Anos_7-2.mp3")
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 0.8)
        call UnitRemoveAbility(c, 'A0EW')
        call UnitRemoveAbility(c, 'B00K')
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 1000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and IsUnitType(gUnit, UNIT_TYPE_HERO) and not IsUnitInGroup(gUnit, g) then
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set v = GetClosestUnitGroup(GetUnitX(c), GetUnitY(c), g)
        call SaveUnitHandle(ht, GetHandleId(z), 2, v)
    endif
    if count > 250 then
        if v != null then
            set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(v), GetUnitY(v))
            call PauseUnit(v, true)
            call SetUnitInvulnerable(v, true)
            if count == 260 then
                call Effect("war3mapimported\\Dead Spirit by Deckai3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetUnitX(c, PolarX(GetUnitX(v), 140, a))
                call SetUnitY(c, PolarY(GetUnitY(v), 140, a))
                call SetUnitFacingEx(c, a + 180, true)
            endif
            if count == 270 then
                call SoundStart("war3mapImported\\Anos_2-1.mp3")
                call SetUnitTimeScale(c, 1)
                call Effect("war3mapimported\\afbxnntx.mdx", GetUnitX(v), GetUnitY(v), 100, a + 30, 0, 0, 1.2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\kdls3.mdx", GetUnitX(v), GetUnitY(v), 200, a, 0, 0, 3, 1, 255, 255, 255, 255) 
                call Effect("war3mapimported\\zxd3.mdx", GetUnitX(v), GetUnitY(v), 25, a, 0, 0, 3.5, 1, 255, 0, 0, 255)
            endif
            if count == 280 then 
                call PauseUnit(c, false)
                call PauseUnit(v, false)
                call SetUnitInvulnerable(c, false)
                call SetUnitInvulnerable(v, false)
                call DamageUnit(c, v, 8 * GetHeroInt(c, true))
                call knockbackUnit(v, 600, a, 0.6)
                call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(v) , GetUnitY(v))
                call IssueTargetOrderById(c, 851983, v)
                call IssueImmediateOrderById(v, 851972)
                call DestroyGroup(g)
                call FlushChildHashtable(ht, GetHandleId(z))
                call PauseTimer(z)
                call DestroyTimer(z)
            endif
        else
            call SetUnitTimeScale(c, 1)
            call PauseUnit(c, false)
            call SetUnitInvulnerable(c, false)
            call IssueImmediateOrderById(c, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
    endif
    set z = null
    set c = null
    set g = null
    set v = null
endfunction

function Trig_AnosD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0EV' then
        set z = CreateTimer()
        call SoundStart("war3mapImported\\Anos_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call UnitAddAbility(c, 'A0EW')
        call UnitMakeAbilityPermanent(c, true, 'A0EW')
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AnosD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_AnosD takes nothing returns nothing
    set gg_trg_AnosD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AnosD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AnosD, function Trig_AnosD_Actions )
endfunction