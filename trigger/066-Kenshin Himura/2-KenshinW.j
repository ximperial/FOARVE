//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    integer KenshinEHash = StringHash("KenshinE")
endglobals

function Trig_KenshinW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = GetUnitFacing(c)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kenshin_2.mp3")
        call SoundStart("war3mapImported\\Kenshin_2-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and IsUnitType(gUnit, UNIT_TYPE_HERO) and not IsUnitInGroup(gUnit, g) then
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set v = GetClosestUnitGroup(GetUnitX(c), GetUnitY(c), g)
        call SaveUnitHandle(ht, GetHandleId(z), 2, v)
    endif
    if count > 1 then
        if v != null then
            call PauseUnit(v, true)
            call SetUnitInvulnerable(v, true)
            if count == 5 then
                call SaveUnitHandle(ht, GetHandleId(z), 3, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
                set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(v), GetUnitY(v))
                call SetUnitX(c, PolarX(GetUnitX(v), 700, a))
                call SetUnitY(c, PolarY(GetUnitY(v), 700, a))
                set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(v), GetUnitY(v))
                call SetUnitFacingEx(c, a, true)
                call SetUnitAnimationByIndex(c, 1)
                call Effect("war3mapimported\\sxcf2.mdx", GetUnitX(c), GetUnitY(c) , 25, randomAngle() , 0, 0, 3, 1, 255, 0, 0, 255)
            endif
            if count >= 5 and count <= 25 then
                set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(v), GetUnitY(v))
                call SetUnitX(c, PolarX(GetUnitX(c), 28, a))
                call SetUnitY(c, PolarY(GetUnitY(c), 28, a))
            endif
            if count == 20 then
                call SetUnitAnimationByIndex(c, 3)
            endif
            if count == 25 then
                call SoundStart("war3mapImported\\Kenshin_2-2.mp3")
                call Effect("war3mapimported\\DGDDXZ4.mdx", GetUnitX(c), GetUnitY(c) , 320, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
                call Effect("war3mapimported\\FCJX_DG.mdx", GetUnitX(v), GetUnitY(v) , 200, randomAngle() , 0, 0, 1.4, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
                call SetUnitTimeScale(c, 1)
                call PauseUnit(c, false)
                call PauseUnit(v, false)
                call SetUnitInvulnerable(c, false)
                call SetUnitInvulnerable(v, false)
                call DamageUnit(c, v, (1 + GetUnitAbilityLevel(c, 'A0CT')) * GetHeroAgi(c, true))
                call IssueTargetOrderById(c, 851983, v)
                call IssueImmediateOrderById(v, 851972)
                if IsAbilityOnCooldown(GetUnitAbility(c, 'A0CU')) then
                    call SaveBoolean(ht, KenshinEHash, GetHandleId(c), true)
                    call StartAbilityCooldown(GetUnitAbility(c, 'A0CU'), 0)
                endif
                call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 3))
                call FlushChildHashtable(ht, GetHandleId(z))
                call PauseTimer(z)
                call DestroyTimer(z)
            endif
        else
            call SetUnitTimeScale(c, 1)
            call PauseUnit(c, false)
            call SetUnitInvulnerable(c, false)
            call IssueImmediateOrderById(c, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
    endif
    set z = null
    set c = null
    set g = null
    set v = null
endfunction

function Trig_KenshinW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0CT' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KenshinW_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KenshinW takes nothing returns nothing
    set gg_trg_KenshinW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshinW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KenshinW, function Trig_KenshinW_Actions)
endfunction