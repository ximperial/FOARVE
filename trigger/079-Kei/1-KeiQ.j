//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_KeiQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\kitam_1.mp3")
        call SoundStart("war3mapImported\\kitam_1-1.mp3")
        call SetUnitAnimationByIndex(c, 18)
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 1.3, 1.5, 255, 255, 255, 255)
        call Effect("war3mapImported\\amx (345).mdx", GetUnitX(c) , GetUnitY(c) , 160, a , 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\YoooBug_ExCharge.mdx", GetUnitX(c) , GetUnitY(c) , 70, a , 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\blue_fire_hei.mdx", c, "hand right"))
    endif
    if count == 5 then
        call SoundStart("war3mapImported\\kitam_1-2.mp3")
    endif
    if count == 3 or count == 6 or count == 9 or count == 12 then
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
        call Effect("war3mapImported\\Blackblink.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count <= 15 then
        set x = PolarX(GetUnitX(c) , 80, a)
        set y = PolarY(GetUnitY(c) , 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call VisionArea(GetOwningPlayer(c) , 1000, 2, x, y)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0H3'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\kdash.mdx", GetUnitX(c) , GetUnitY(c) , 0, a, 0, 0, 0.95, 0.4, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 18)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\blue_fire_hei.mdx", c, "hand right"))
        endif
    endif
    if count == 15 then
        call SetUnitVertexColor(c, 255, 255, 255, 255)
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
endfunction

function Trig_KeiQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0H3' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KeiQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KeiQ takes nothing returns nothing
    set gg_trg_KeiQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KeiQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KeiQ, function Trig_KeiQ_Actions)
endfunction