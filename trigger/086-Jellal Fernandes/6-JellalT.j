//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_JellalT_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Jellal_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\az_blacksmoke.mdx", x, y, 1200, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 10 then
        call Effect("war3mapimported\\firesphere.mdx", x, y, 1200, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
        call Effect("war3mapimported\\holylightred.mdx", x, y, 1200, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\lightingspark.mdx", x, y, 1200, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count >= 10 and count <= 50 then
        loop
            exitwhen i > 2
            set e = LoadEffectHandle(ht, GetHandleId(z), 1 + i)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 30)
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\bigboom.mp3")
        call Effect("war3mapimported\\AZ_WSY_Misslie.mdx", x, y, 25, a, 0, 0, .8, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\SuperBigExplosion2.mdx", x, y, 25, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 15 * GetHeroInt(c, true))
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
    set e = null
endfunction

function Trig_JellalT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A07A' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_JellalT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_JellalT takes nothing returns nothing
    set gg_trg_JellalT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JellalT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_JellalT, function Trig_JellalT_Actions )
endfunction