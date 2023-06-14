//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_SistinaF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Sistina_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call Effect("war3mapimported\\windgreen.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 3, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count >= 30 and count <= 150 then 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 20 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SoundStart("war3mapImported\\Sistina_6-1.mp3")
            call GroupEnumUnitsInRange(gGroup, GetUnitX(t), GetUnitY(t), 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) then 
                    call DamageUnit(c, gUnit, 2.5 * GetHeroStr(c, true))
                    call IssueImmediateOrderById(gUnit, 851972)
                endif 
            endloop
            call GroupClear(gGroup)
            call Effect("war3mapImported\\Cyclon Explosion_green.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\WDFZL_green.mdl", GetUnitX(t), GetUnitY(t), - 400, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\[A]dustexplosion.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
    endif
    if count == 150 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueTargetOrderById(c, 851983, t)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_SistinaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HD' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_SistinaF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_SistinaF takes nothing returns nothing
    set gg_trg_SistinaF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SistinaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_SistinaF, function Trig_SistinaF_Actions )
endfunction