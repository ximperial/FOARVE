//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_SasukeF_Func001 takes nothing returns nothing
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
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Sasuke_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, .5)
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapimported\\Black.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        loop
            exitwhen i > 5
            set x1 = PolarX(x, 400, i * 60)
            set y1 = PolarY(y, 400, i * 60)
            call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_1.mdx", x1, y1, 1000, a, 0, 0, .6, 2, 255, 255, 255, 255)
            call MoveEffect3(bj_lastCreatedEffect, 0, - 30, 0.6, 0)
            call AnimEffect(bj_lastCreatedEffect, 1, 0.6)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.4, 0.6)
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Sasuke_7-1.mp3")
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx", x, y, 25, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 60 then
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                set dmg = 0.4 * GetUnitAbilityLevel(c, 'A070')
                call DamageUnit(c, gUnit, (dmg + 11) * GetHeroInt(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
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

function Trig_SasukeF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A073' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_SasukeF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_SasukeF takes nothing returns nothing
    set gg_trg_SasukeF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SasukeF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_SasukeF, function Trig_SasukeF_Actions )
endfunction