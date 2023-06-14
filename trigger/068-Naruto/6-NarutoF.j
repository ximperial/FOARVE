//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NarutoF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local real a2
    local effect e
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 30 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Naruto_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 3)
        set x1 = PolarX(GetUnitX(c), 200, a + 70)
        set y1 = PolarY(GetUnitY(c), 200, a + 70)
        set a2 = Angle(x1, y1, x, y)
        call Effect("war3mapimported\\jcnaruto7.mdx", x1, y1, 0, a2, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
        call Effect("war3mapimported\\7dmrslj.mdx", x1, y1, 300, a2, 0, 0, 3, 1.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
        set x1 = PolarX(GetUnitX(c), 400, a + 70)
        set y1 = PolarY(GetUnitY(c), 400, a + 70)
        set a2 = Angle(x1, y1, x, y)
        call Effect("war3mapimported\\jcnaruto7.mdx", x1, y1, 0, a2, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
        call Effect("war3mapimported\\7dmrslj.mdx", x1, y1, 300, a2, 0, 0, 3, 1.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set x1 = PolarX(GetUnitX(c), 200, a - 70)
        set y1 = PolarY(GetUnitY(c), 200, a - 70)
        set a2 = Angle(x1, y1, x, y)
        call Effect("war3mapimported\\jcnaruto7.mdx", x1, y1, 0, a2, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
        call Effect("war3mapimported\\7dmrslj.mdx", x1, y1, 300, a2, 0, 0, 3, 1.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set x1 = PolarX(GetUnitX(c), 400, a - 70)
        set y1 = PolarY(GetUnitY(c), 400, a - 70)
        set a2 = Angle(x1, y1, x, y)
        call Effect("war3mapimported\\jcnaruto7.mdx", x1, y1, 0, a2, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
        call Effect("war3mapimported\\7dmrslj.mdx", x1, y1, 300, a2, 0, 0, 3, 1.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count >= 30 and count <= 50 then
        loop
            exitwhen i > 3
            if not LoadBoolean(ht, GetHandleId(z), 1 + i) then
                set e = LoadEffectHandle(ht, GetHandleId(z) , 1 + i)
                set x = PolarX(GetEffectX(e), 90, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 90, GetSpecialEffectYaw(e))
                if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                    call SetEffectX(e, x)
                    call SetEffectY(e, y)
                endif
                call SetSpecialEffectZ(e, 300 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(c, gUnit) then
                        call DamageUnit(c, gUnit, 3.6 * GetHeroAgi(c, true))
                        if not LoadBoolean(ht, GetHandleId(z), 1 + i) then
                            call SaveBoolean(ht, GetHandleId(z), 1 + i, true)
                            call SetEffectX(e, PolarX(GetUnitX(gUnit), -100, GetSpecialEffectYaw(e)))
                            call SetEffectY(e, PolarY(GetUnitY(gUnit), -100, GetSpecialEffectYaw(e)))
                            call SetSpecialEffectZ(e, 300 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
                            call Effect("war3mapimported\\APblast2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
                            call Effect("war3mapimported\\zxd1.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(2, 2.5), 1, 255, 255, 255, 255)
                            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.35)
                        endif
                    endif
                endloop
                call GroupClear(gGroup)
            endif
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_NarutoF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0DI' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NarutoF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_NarutoF takes nothing returns nothing
    set gg_trg_NarutoF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NarutoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NarutoF, function Trig_NarutoF_Actions)
endfunction