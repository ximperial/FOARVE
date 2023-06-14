//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ReimuQ_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Reimu_1.mp3")
        if GetRandomInt(1, 2) == 1 then
            call SoundStart("war3mapImported\\Reimu_1-1.mp3")
        else
            call SoundStart("war3mapImported\\Reimu_1-2.mp3")
        endif
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapImported\\Reimu_FZ.mdl", GetUnitX(c), GetUnitY(c), 150, a, 0, 0, 7, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapImported\\cursebolt1.mdl", GetUnitX(c), GetUnitY(c), 150, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call Effect("war3mapImported\\Reimu_FZ.mdl", GetUnitX(c), GetUnitY(c), 150, a + 20, 0, 0, 7, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapImported\\cursebolt1.mdl", GetUnitX(c), GetUnitY(c), 150, a + 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call Effect("war3mapImported\\Reimu_FZ.mdl", GetUnitX(c), GetUnitY(c), 150, a - 20, 0, 0, 7, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
        call Effect("war3mapImported\\cursebolt1.mdl", GetUnitX(c), GetUnitY(c), 150, a - 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 7, bj_lastCreatedEffect)
    endif
    if count <= 15 then
        loop
            exitwhen i > 7
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set x = PolarX(GetEffectX(e) , 80, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e) , 80, GetSpecialEffectYaw(e))
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetEffectX(e, x)
                call SetEffectY(e, y)
            endif
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call Effect("war3mapImported\\Asuma-Explosion4.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A08E'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set i = i + 1
        endloop
    endif
    if count == 15 then
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

function Trig_ReimuQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A08E' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_ReimuQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ReimuQ takes nothing returns nothing
    set gg_trg_ReimuQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ReimuQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ReimuQ, function Trig_ReimuQ_Actions)
endfunction