//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NarutoE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Naruto_3.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 3)
        call SaveReal(ht, GetHandleId(z), 1, 20)
    endif
    if count == 5 or count == 10 or count == 15 then
        call SoundStart("war3mapImported\\Naruto_3-1.mp3")
        set x = PolarX(GetUnitX(c) , 400, a + LoadReal(ht, GetHandleId(z), 1))
        set y = PolarY(GetUnitY(c) , 400, a + LoadReal(ht, GetHandleId(z), 1))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call Effect("war3mapimported\\AFB_shanguang6_1.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 1, - LoadReal(ht, GetHandleId(z), 1))
    endif
    if count == 15 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_NarutoE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0DF' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NarutoE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_NarutoE takes nothing returns nothing
    set gg_trg_NarutoE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NarutoE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NarutoE, function Trig_NarutoE_Actions)
endfunction