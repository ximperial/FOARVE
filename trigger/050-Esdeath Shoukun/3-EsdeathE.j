//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_EsdeathE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real z1
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local effect e
    local integer i = 0
    local real a2
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Esdeath_3.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 2)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set a2 = 90
        loop
            exitwhen i > 8
            set x = PolarX(GetUnitX(c), 50, a)
            set y = PolarY(GetUnitY(c), 50, a)
            set x = PolarX(x, GetRandomReal(0, 250), a + a2)
            set y = PolarY(y, GetRandomReal(0, 250), a + a2)
            call Effect("war3mapimported\\ice-danmu.mdx", x, y, GetRandomReal(50, 150), a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 3 + i, bj_lastCreatedEffect)
            set i = i + 1
            set a2 = - a2
        endloop
    endif
    if count <= 15 then
        set i = 0
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetEffectX(e) , 80, a)
        set y = PolarY(GetEffectY(e) , 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A030'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        loop
            exitwhen i > 8
            set e = LoadEffectHandle(ht, GetHandleId(z), 3 + i)
            set x = PolarX(GetEffectX(e) , 80, a)
            set y = PolarY(GetEffectY(e) , 80, a)
            set z1 = GetEffectZ(e) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e)) + GetAxisZ(GetEffectX(e), GetEffectY(e))
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetEffectX(e, x)
                call SetEffectY(e, y)
            endif
            call SetSpecialEffectZ(e, z1)
            set i = i + 1
        endloop
    endif
    if count == 15 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call Effect("war3mapimported\\[Plagiat]Effect302.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\afbbxks.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        set i = 0
        loop
            exitwhen i > 8
            set e = LoadEffectHandle(ht, GetHandleId(z), 3 + i)
            call SetSpecialEffectAnimation(e, "death")
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

function Trig_EsdeathE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A030' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_EsdeathE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_EsdeathE takes nothing returns nothing
    set gg_trg_EsdeathE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EsdeathE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_EsdeathE, function Trig_EsdeathE_Actions)
endfunction