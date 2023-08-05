//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NarutoT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 1)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 40 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Naruto_5.mp3")
        call SetUnitAnimationByIndex(c, 6)
        set x = PolarX(GetUnitX(c), - 300, a)
        set y = PolarY(GetUnitY(c), - 300, a)
        call Effect("war3mapimported\\7djw.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 3)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_1.mdx", x, y, 250, a, 0, 0, 2, 1.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Naruto_5-1.mp3")
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count >= 40 and count <= 70 then
        set x = PolarX(GetEffectX(e), 60, a)
        set y = PolarY(GetEffectY(e), 60, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call SetSpecialEffectZ(e, 250 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 70 then
        call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_3.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 1000, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 15 * GetHeroAgi(c, true))
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 75 then
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetEffectX(e) , GetEffectY(e))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_NarutoT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0DH' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NarutoT_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_NarutoT takes nothing returns nothing
    set gg_trg_NarutoT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NarutoT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NarutoT, function Trig_NarutoT_Actions)
endfunction