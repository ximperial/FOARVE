//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_JellalF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real z1
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local effect e
    local integer i = 0
    local integer sizeG = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 70 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Jellal_7.mp3")
        call SoundStart("war3mapImported\\Jellal_7-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\[Plagiat]Effect105.mdx", GetUnitX(c) , GetUnitY(c), 300, randomAngle(), 0, 0, 3, 2.6, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\[Plagiat]Effect42.mdx", GetUnitX(c) , GetUnitY(c), 500, randomAngle(), 0, 0, 1, 2.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        call Effect("war3mapimported\\[Plagiat]Effect42.mdx", GetUnitX(c) , GetUnitY(c), 500, randomAngle(), 0, 0, 1, 2.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 4, bj_lastCreatedEffect)
        call Effect("war3mapimported\\[Plagiat]Effect42.mdx", GetUnitX(c) , GetUnitY(c), 500, randomAngle(), 0, 0, 1, 2.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 5, bj_lastCreatedEffect)
        call Effect("war3mapimported\\[Plagiat]Effect81.mdx", GetUnitX(c) , GetUnitY(c), 300, randomAngle(), 0, 0, 1, 2.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 6, bj_lastCreatedEffect)
        call Effect("war3mapimported\\[Plagiat]Effect569.mdx", GetUnitX(c) , GetUnitY(c), 450, randomAngle(), 0, 0, 1, 2.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 7, bj_lastCreatedEffect)
        call Effect("war3mapimported\\[Plagiat]Effect41.mdx", GetUnitX(c) , GetUnitY(c), 50, randomAngle(), 0, 0, 3, 2.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 8, bj_lastCreatedEffect)
    endif
    if count == 25 or count == 50 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 0)
    endif
    if count <= 60 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.03)
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.03)
        set e = LoadEffectHandle(ht, GetHandleId(z), 5)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.03)
        set e = LoadEffectHandle(ht, GetHandleId(z), 6)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.04)
        set e = LoadEffectHandle(ht, GetHandleId(z), 7)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.075)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count <= 70 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2000, null)
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
    if count == 70 then
        call ForGroup(g, function ResetMoveSpeed)
        call GroupClear(g)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count >= 70 and count <= 120 then
        loop
            exitwhen i > 6
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set x = PolarX(GetEffectX(e) , 60, a)
            set y = PolarY(GetEffectY(e) , 60, a)
            set z1 = GetEffectZ(e) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e)) + GetAxisZ(GetEffectX(e), GetEffectY(e))
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetEffectX(e, x)
                call SetEffectY(e, y)
            endif
            call SetSpecialEffectZ(e, z1)
            set i = i + 1
        endloop
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set i = 0
        set sizeG = 0
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 350, null)
        loop
            exitwhen sizeG == GroupGetCount(gGroup)
            set gUnit = GroupGetUnitByIndex(gGroup, sizeG)
            if FilterGeneral(c, gUnit) then
                loop
                    exitwhen i > 6
                    set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
                    set z1 = GetEffectZ(e) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e)) + GetAxisZ(GetEffectX(e), GetEffectY(e))
                    call SetEffectX(e, GetUnitX(gUnit))
                    call SetEffectY(e, GetUnitY(gUnit))
                    call SetSpecialEffectZ(e, z1)
                    set i = i + 1
                endloop
                set count = 120
                exitwhen true
            endif
            set sizeG = sizeG + 1
        endloop
        call GroupClear(gGroup)
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Jellal_7-2.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set sizeG = 0
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e) , 700, null)
        loop
            exitwhen sizeG == GroupGetCount(gGroup)
            set gUnit = GroupGetUnitByIndex(gGroup, sizeG)
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 11 * GetHeroInt(c, true))
            endif
            set sizeG = sizeG + 1
        endloop
        call GroupClear(gGroup)
        call Effect("war3mapimported\\[Plagiat]Effect43.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\[Plagiat]Effect45.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapimported\\[Plagiat]Effect82.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 6, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\[Plagiat]Effect83.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\[Plagiat]Effect77.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\[Plagiat]Effect78.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
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

function Trig_JellalF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A07B' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_JellalF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_JellalF takes nothing returns nothing
    set gg_trg_JellalF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JellalF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_JellalF, function Trig_JellalF_Actions)
endfunction