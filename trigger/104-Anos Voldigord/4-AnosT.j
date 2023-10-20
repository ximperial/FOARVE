//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AnosT_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Anos_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 1.2)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
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
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_YueYun_1.mdx", x, y, 1300, a, 0, 0, 1, 1, 255, 255, 255, 0)
        call MoveEffect3(bj_lastCreatedEffect, 0, - 40, 0.6, 0)
        call Effect("war3mapImported\\asknhq.mdx", x, y, 1300, a, 0, 0, 15, 2.8, 255, 255, 255, 255)
        call MoveEffect3(bj_lastCreatedEffect, 0, - 40, 0.6, 0)
    endif
    if count == 35 or count == 55 or count == 75 or count == 95 or count == 115 then
        call SoundStart("war3mapImported\\Anos_4-1.mp3")
    endif
    if count >= 35 and count <= 135 then
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 15 * GetHeroInt(c, true) / 100)
                call IssueImmediateOrderById(gUnit, 851972)
            endif 
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2_2.mdx", x, y, 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 135 then
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

function Trig_AnosT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0ET' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_AnosT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_AnosT takes nothing returns nothing
    set gg_trg_AnosT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AnosT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AnosT, function Trig_AnosT_Actions )
endfunction