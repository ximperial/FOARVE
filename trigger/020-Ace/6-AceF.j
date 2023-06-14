//TESH.scrollpos=57
//TESH.alwaysfold=0
function Trig_AceF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = GetUnitFacing(c)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ace_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\RedHarvest.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count == 50 then
        call SetUnitAnimationByIndex(c, 6)
    endif
    if count == 60 then
        call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\RedHarvest.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count <= 80 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 1500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Ace_6-1.mp3")
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AceRef.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]zhendi-fire-dici.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]zhendi-fire-dici.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call ForGroup(g, function ResetMoveSpeed)
        call GroupClear(g)
    endif
    if count >= 80 and count <= 100 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                if not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(c, gUnit, 11 * GetHeroStr(c, true))
                    call knockupUnit(gUnit, 1.4, 600)
                    call GroupAddUnit(g, gUnit)
                endif
                call IssueImmediateOrderById(gUnit, 851972)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 105 then
        call SetUnitInvulnerable(c, false)
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
endfunction

function Trig_AceF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0AD' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AceF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_AceF takes nothing returns nothing
    set gg_trg_AceF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AceF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AceF, function Trig_AceF_Actions )
endfunction