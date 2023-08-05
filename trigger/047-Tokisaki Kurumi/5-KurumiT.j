//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_KurumiT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kurumi_5.mp3")
        call SetUnitAnimationByIndex(c, 7)
        call Effect("war3mapImported\\LS SQTX.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
    endif
    if count == 10 then
        call Effect("war3mapImported\\Kurumi Field.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Black.mdl", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 20 then
        call Effect("war3mapImported\\ShockwavePurple.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\PurpleExplode.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTPurpleNoRing.mdx", x, y, 200, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\A7_zisekuosan.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\OrbitalRay.mdx", x, y, 25, a, 0, 0, 8, 1, 255, 255, 255, 255)
    endif
    if count == 25 then
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 15 * GetHeroAgi(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 30 then
        call Effect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdx", x, y, 25, a, 0, 0, 6, 1, 255, 255, 255, 255)
    endif
    if count == 40 then
        call VisionArea(GetOwningPlayer(c), 1200, 2, x, y)
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

function Trig_KurumiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A02H' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_KurumiT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_KurumiT takes nothing returns nothing
    set gg_trg_KurumiT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KurumiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KurumiT, function Trig_KurumiT_Actions )
endfunction