//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KuzanT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kuzan_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 11)
        call Effect("war3mapimported\\AFBBXKS.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\sbss_bingdongxili.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a + 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a - 20, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a + 40, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a - 40, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
    endif
    if count <= 30 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        loop
            exitwhen i > 4
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set x = PolarX(GetEffectX(e) , 60, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e) , 60, GetSpecialEffectYaw(e))
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetEffectX(e, x)
                call SetEffectY(e, y)
            endif
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(c, gUnit, 15 * GetHeroInt(c, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            if iterator >= 3 then
                call Effect("war3mapimported\\bkks.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1 + count * 0.08, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
            endif
            set i = i + 1
        endloop
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
        endif
    endif
    if count == 30 then
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

function Trig_KuzanT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0BY' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KuzanT_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KuzanT takes nothing returns nothing
    set gg_trg_KuzanT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KuzanT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KuzanT, function Trig_KuzanT_Actions)
endfunction