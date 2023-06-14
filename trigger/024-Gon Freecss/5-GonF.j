//TESH.scrollpos=132
//TESH.alwaysfold=0
globals
    integer GonFHash = StringHash("GonF")
    integer GonFXHash = StringHash("GonFX")
    integer GonFYHash = StringHash("GonFY")
endglobals

function Trig_GonF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = LoadReal(ht, GetHandleId(z), 3)
    local real dist = LoadReal(ht, GetHandleId(z), 2)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local unit v = LoadUnitHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Gon_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 6, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 3)
        set x1 = PolarX(GetUnitX(c), - 30, a + 120)
        set y1 = PolarY(GetUnitY(c), - 30, a + 120)
        call Effect("war3mapImported\\[A]ymjfireball.mdl", x1, y1, 100, a, 0, 0, 1.5, 5.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        set v = CreateUnit(GetOwningPlayer(c), 'h0CO', GetUnitX(c), GetUnitY(c), 0)
        call SaveBoolean(ht, GonFHash, GetHandleId(v), true)
        call SaveReal(ht, GonFXHash, GetHandleId(v), x)
        call SaveReal(ht, GonFYHash, GetHandleId(v), y)
        call EnableUnitMovement(v, false)
        call UnitApplyTimedLife(v, 'BTLF', 5)
        call SaveUnitHandle(ht, GetHandleId(z), 3, v)
        if GetLocalPlayer() == GetOwningPlayer(c) then
            call ClearSelection()
            call SelectUnit(v, true) 
        endif
    endif
    if count == 20 or count == 60 or count == 100 or count == 140 or count == 180 or count == 220 then
        if GetLocalPlayer() == GetOwningPlayer(c) then
            call ClearSelection()
            call SelectUnit(v, true) 
        endif
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Gon_6-1.mp3")
    endif
    if count <= 240 then
        if x != LoadReal(ht, GonFXHash, GetHandleId(v)) or y != LoadReal(ht, GonFYHash, GetHandleId(v)) then
            set x = LoadReal(ht, GonFXHash, GetHandleId(v))
            set y = LoadReal(ht, GonFYHash, GetHandleId(v))
            set dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
            set a = Angle(GetUnitX(c), GetUnitY(c), x, y)
            if dist <= 1000 then
                call SaveReal(ht, GetHandleId(z), 0, x)
                call SaveReal(ht, GetHandleId(z), 1, y)
                call SaveReal(ht, GetHandleId(z), 2, Distance(GetUnitX(c), GetUnitY(c), x, y))
                call SaveReal(ht, GetHandleId(z), 3, Angle(GetUnitX(c), GetUnitY(c), x, y))
            else
                set x = PolarX(GetUnitX(c), 1000, a)
                set y = PolarY(GetUnitY(c), 1000, a)
                call SaveReal(ht, GetHandleId(z), 0, x)
                call SaveReal(ht, GetHandleId(z), 1, y)
                call SaveReal(ht, GetHandleId(z), 2, Distance(GetUnitX(c), GetUnitY(c), x, y))
                call SaveReal(ht, GetHandleId(z), 3, Angle(GetUnitX(c), GetUnitY(c), x, y))
            endif
        endif
        call SetUnitFacing(c, a)
        call SetSpecialEffectYaw(e, a)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            set x1 = PolarX(GetUnitX(c), - 30, a + 120)
            set y1 = PolarY(GetUnitY(c), - 30, a + 120)
            call Effect("war3mapimported\\MeteorGlow.mdx", x1, y1, 100, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 240 then
        call ForGroup(g, function ResetMoveSpeed)
        call GroupClear(g)
    endif
    if count >= 240 and count <= 270 then 
        set x1 = PolarX(GetUnitX(c), dist / 30, a)
        set y1 = PolarY(GetUnitY(c), dist / 30, a)
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x1)
            call SetUnitY(c, y1)
        endif
        set x1 = PolarX(GetUnitX(c), - 30, a + 120)
        set y1 = PolarY(GetUnitY(c), - 30, a + 120)
        call SetEffectXY(e, x1, y1, 0)
        call SetSpecialEffectZ(e, 100 + GetAxisZ(x1, y1))
    endif
    if count == 260 then
        call SoundStart("war3mapImported\\Gon_6-2.mp3")
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 270 then
        call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdx", GetUnitX(c), GetUnitY(c), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]Natsu ef roar.mdx", GetUnitX(c), GetUnitY(c), 200, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AceRef.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectMatrixScale(bj_lastCreatedEffect, 1.5, 1.5, 1)
        call Effect("war3mapimported\\AceRef.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectMatrixScale(bj_lastCreatedEffect, 3, 3, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\[A]GonFef.mdx", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count >= 270 and count <= 280 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null 
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then 
                call DamageUnit(c, gUnit, 11 * GetHeroStr(c, true))
                set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(gUnit), GetUnitY(gUnit))
                call knockbackUnit(gUnit, 20, a, 0.6)
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 280 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
    set v = null
endfunction

function Trig_GonF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A02N' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveReal(ht, GetHandleId(z), 2, Distance(x1, y1, x, y))
        call SaveReal(ht, GetHandleId(z), 3, Angle(x1, y1, x, y))
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_GonF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_GonF takes nothing returns nothing
    set gg_trg_GonF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GonF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GonF, function Trig_GonF_Actions )
endfunction