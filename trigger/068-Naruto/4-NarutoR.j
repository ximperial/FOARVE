//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NarutoR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 1)
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 30 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Naruto_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\7dmrslj.mdx", GetUnitX(c), GetUnitY(c), 300, a, 0, 0, 2, 3, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count >= 30 and count <= 50 then
        set x = PolarX(GetEffectX(e), 80, a)
        set y = PolarY(GetEffectY(e), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call SetSpecialEffectZ(e, 300 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null or i == 1
            if FilterGeneral(c, gUnit) then
                set i = 1
                set count = 50
                call SaveInteger(ht, GetHandleId(z) , 0, count)
                call SetEffectX(e, PolarX(GetUnitX(gUnit), -100, a))
                call SetEffectY(e, PolarY(GetUnitY(gUnit), -100, a))
                call SetSpecialEffectZ(e, 300 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 50 or count == 80 or count == 110 or count == 130 then
        call SoundStart("war3mapImported\\Naruto_4-1.mp3")
    endif
    if count >= 50 and count <= 150 then
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.03)
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 800, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, ((1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0DG')) * GetHeroAgi(c, true)) / 25)
                if not IsUnitInGroup(gUnit, g) then
                    call lockUnit(gUnit, 1, false)
                    call GroupAddUnit(g, gUnit)
                endif
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3_2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 150 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_NarutoR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0DG' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_NarutoR_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_NarutoR takes nothing returns nothing
    set gg_trg_NarutoR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NarutoR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NarutoR, function Trig_NarutoR_Actions)
endfunction