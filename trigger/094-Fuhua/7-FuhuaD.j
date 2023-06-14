//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_FuhuaD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Fuhua_7.mp3")
        call SoundStart("war3mapImported\\Fuhua_7-1.mp3")
        call SoundStart("war3mapImported\\Fuhua_7-2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call GroupEnumUnitsInRange(gGroup, x, y, 800, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call lockUnit(gUnit, 1, false)
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 5 then
        call Effect("war3mapImported\\0454.mdx", x, y, 25, a, 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Fuhua_7-3.mp3")
        call SetUnitAnimationByIndex(c, 11)
        call Effect("war3mapImported\\Mr.War3_JSSTZS.mdx", x, y, 25, randomAngle(), 0, 0, 6, 2, 255, 255, 255, 255)
        call Effect("war3mapImported\\Mr.War3_JSSTZS.mdx", x, y, 25, randomAngle(), 0, 0, 6, 2, 255, 255, 255, 255)
    endif
    if count == 50 then
        call Effect("war3mapImported\\File00002084.mdx", x, y, 100, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, x, y, 800, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 8 * GetHeroInt(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 60 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_FuhuaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0BK' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_FuhuaD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_FuhuaD takes nothing returns nothing
    set gg_trg_FuhuaD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FuhuaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_FuhuaD, function Trig_FuhuaD_Actions )
endfunction