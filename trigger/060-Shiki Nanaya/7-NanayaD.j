//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_NanayaD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Nanaya_7.mp3")
        call SoundStart("war3mapImported\\Nanaya_1-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 12)
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapimported\\nitu.mdx", GetUnitX(c) , GetUnitY(c) , 25, a - 60 , 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\nitu.mdx", GetUnitX(c) , GetUnitY(c) , 25, a - 30 , 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\nitu.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\nitu.mdx", GetUnitX(c) , GetUnitY(c) , 25, a + 30 , 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\nitu.mdx", GetUnitX(c) , GetUnitY(c) , 25, a + 60 , 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 5 or count == 10 or count == 15 or count == 20 or count == 25 then
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count <= 30 then
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitFacingEx(c, GetUnitFacing(c) + 18, true)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 400, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call PauseUnit(gUnit, true)
                call SetUnitInvulnerable(gUnit, true)
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        loop
            set gUnit = GroupForEachUnit(g)
            exitwhen gUnit == null
            call PauseUnit(gUnit, true)
            call SetUnitInvulnerable(gUnit, true)
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            loop
                exitwhen i > 4
                call Effect("war3mapimported\\WindSlash.mdx", GetUnitX(c) , GetUnitY(c) , 40, randomAngle() , 0, 0, GetRandomReal(0.5, 4) , 1, 155, 75, 255, PercentTo255(GetRandomReal(20, 100)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
                set i = i + 1
            endloop
            call Effect("war3mapimported\\Black.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1.5, 0.6, 255 , 255 , 255, PercentTo255(30))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.2)
            call Effect("war3mapimported\\BasicStrikeNanaya.mdx", GetUnitX(c) , GetUnitY(c) , 25, GetUnitFacing(c) - 90 , 0, 0, 5.5, 1, 255 , 255 , 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        endif
    endif
    if count == 35 then
        set x = PolarX(GetUnitX(c) , -750, a)
        set y = PolarY(GetUnitY(c) , -750, a)
        call Effect("war3mapimported\\SKSKSK2.mdx", x, y, 40, a, 0, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdx", x, y, 25, a, 0, 0, 1.8, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        loop
            set gUnit = GroupForEachUnit(g)
            exitwhen gUnit == null
            call PauseUnit(gUnit, false)
            call SetUnitInvulnerable(gUnit, false)
            call DamageUnit(c, gUnit, 8 * GetHeroAgi(c, true))
            call IssueImmediateOrderById(gUnit, 851972)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 40 then
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
endfunction

function Trig_NanayaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A07Z' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_NanayaD_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_NanayaD takes nothing returns nothing
    set gg_trg_NanayaD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NanayaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NanayaD, function Trig_NanayaD_Actions)
endfunction