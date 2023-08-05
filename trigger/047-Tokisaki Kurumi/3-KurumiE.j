//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KurumiE_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kurumi_3.mp3")
        call SoundStart("war3mapImported\\Kurumi_3-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("war3mapImported\\BlackHoles.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 10 then 
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call Effect("war3mapImported\\BlackHoles.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\ShockwavePurple.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Asuma-Explosion4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\a7_zisekuosan.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\dtpurplenoring.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, (1 + 0.5 * GetUnitAbilityLevel(c, 'A02I')) * GetHeroAgi(c, true))
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
endfunction

function Trig_KurumiE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A02I' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_KurumiE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_KurumiE takes nothing returns nothing
    set gg_trg_KurumiE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KurumiE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KurumiE, function Trig_KurumiE_Actions )
endfunction