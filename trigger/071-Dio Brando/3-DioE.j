//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_DioE_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_DioE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x = LoadReal(ht, GetHandleId(z) , 0)
    local real y = LoadReal(ht, GetHandleId(z) , 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , x, y)
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        if GetRandomInt(1, 2) == 1 then
            call SoundStart("war3mapImported\\Dio_3.mp3")
        else
            call SoundStart("war3mapImported\\Dio_3-1.mp3")
        endif
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapimported\\twd.mdx", x , y , 200, a, 0, 0, 4.2, 4.6, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call AnimEffect(bj_lastCreatedEffect, 1, 5.2)
    endif
    if count == 205 then
        call SoundStart("war3mapImported\\Dio_3-2.mp3")
    endif
    if count >= 30 and count <= 205 then
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        call GroupRemoveUnit(gGroup, c)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                call PauseUnit(gUnit, true)
                if not IsUnitInGroup(gUnit, g) then
                    call SetUnitTimeScale(gUnit, 0)
                    call GroupAddUnit(g, gUnit)
                endif
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 210 then 
        call ForGroup(g, function Trig_DioE_Func002)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction

function Trig_DioE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0FA' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_DioE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_DioE takes nothing returns nothing
    set gg_trg_DioE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DioE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_DioE, function Trig_DioE_Actions)
endfunction