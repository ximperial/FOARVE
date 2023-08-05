//TESH.scrollpos=15
//TESH.alwaysfold=0
function Trig_ByakuranD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a
    local real x
    local real y
    local integer i = 0
    local boolean b = LoadBoolean(ht, GetHandleId(z), 0)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        if b then
            call SoundStart("war3mapImported\\Byakuran_7-1.mp3")
            call SetUnitAnimationByIndex(c, 10)
            call Effect("war3mapImported\\fireworksblack.mdl", GetUnitX(c), GetUnitY(c), 40, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\shadowdrive2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 40, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 140, 180, - 90, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 140, 270, - 90, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 140, 360, - 90, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 140, 90, - 45, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 140, 180, - 45, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 140, 270, - 45, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(c), GetUnitY(c), 140, 360, - 45, 0, 3, 2, 255, 255, 255, 255)
        else
            call SoundStart("war3mapImported\\Byakuran_7.mp3")
            call SetUnitAnimationByIndex(c, 4)
            call Effect("war3mapImported\\fireworkswhite.mdl", GetUnitX(c), GetUnitY(c), 40, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\WhiteDrive.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 40, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 140, 180, - 90, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 140, 270, - 90, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 140, 360, - 90, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 140, 90, - 45, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 140, 180, - 45, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 140, 270, - 45, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(c), GetUnitY(c), 140, 360, - 45, 0, 3, 2, 255, 255, 255, 255)
        endif
    endif
    if count >= 10 and count <= 20 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                if b then
                    call DamageUnit(c, gUnit, (8 + 0.3 * GetUnitAbilityLevel(c, 'A0AJ')) * GetHeroStr(c, true))
                else
                    call DamageUnit(c, gUnit, 8 * GetHeroStr(c, true))
                endif
                set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(gUnit), GetUnitY(gUnit))
                call knockbackUnit(gUnit, 300, a, 0.6)
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 20 then
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
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

function Trig_ByakuranD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0AN' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(c, 'B00Y') > 0)
        call TimerStart(z, 0.02, true, function Trig_ByakuranD_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ByakuranD takes nothing returns nothing
    set gg_trg_ByakuranD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ByakuranD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ByakuranD, function Trig_ByakuranD_Actions )
endfunction