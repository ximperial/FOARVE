//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ToshiQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local effect e
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Toshiro_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.2)
        loop
            exitwhen i > 3
            set x = PolarX(GetUnitX(c), 50, a)
            set y = PolarY(GetUnitY(c), 50, a)
            set x = PolarX(x, GetRandomReal(50, 150), a + GetRandomReal(- 90, 90))
            set y = PolarY(y, GetRandomReal(50, 150), a + GetRandomReal(- 90, 90))
            call Effect("war3mapimported\\ice-danmu.mdx", x, y, 50, a, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 2 + i, bj_lastCreatedEffect)
            set i = i + 1
        endloop
    endif
    if count <= 15 then
        set i = 0
        loop
            exitwhen i > 3
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set x = PolarX(GetEffectX(e) , 80, a)
            set y = PolarY(GetEffectY(e) , 80, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetEffectX(e, x)
                call SetEffectY(e, y)
            endif
            call SetSpecialEffectZ(e, 50 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A00E'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set i = i + 1
        endloop
    endif
    if count == 15 then
        set i = 0
        loop
            exitwhen i > 3
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call Effect("war3mapImported\\AFBBXKS.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            set i = i + 1
        endloop
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
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
endfunction

function Trig_ToshiQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A00E' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_ToshiQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ToshiQ takes nothing returns nothing
    set gg_trg_ToshiQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ToshiQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ToshiQ, function Trig_ToshiQ_Actions)
endfunction