//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_DiegoE_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_DiegoE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real a = GetUnitFacing(c)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Diego_3.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        set x = PolarX(GetUnitX(c), 70, a - 120)
        set y = PolarY(GetUnitY(c), 70, a - 120)
        call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind2.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, a, 0, 0, 1, 5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 3.2, 5.2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 1.1, 2.4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 1.9, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.6, 1.6, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
    endif
    if count <= 60 then
        set i = 3
        loop
            exitwhen i > 6
            call SetSpecialEffectVertexColour(LoadEffectHandle(ht, GetHandleId(z), i), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(40, 60)))
            set i = i + 1
        endloop
    endif
    if count >= 20 and count <= 270 then
        if count <= 60 then
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), (count-20) * 30, null)
            call GroupRemoveUnit(gGroup, c)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        else
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 1200, null)
            call GroupRemoveUnit(gGroup, c)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        endif
    endif
    if count == 60 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 6), 1)
    endif
    if count == 80 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 5), 1)
    endif
    if count == 100 then
        call SetSpecialEffectVertexColour(e, 255, 255, 255, 0)
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 4), 1)
    endif
    if count == 220 then
        call SoundStart("war3mapImported\\Diego_3-1.mp3")
    endif
    if count == 250 then
        call SetSpecialEffectAnimationByIndex(LoadEffectHandle(ht, GetHandleId(z), 3), 1)
    endif
    if count == 270 then
        call ForGroup(g, function Trig_DiegoE_Func002)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
    set e2 = null
endfunction

function Trig_DiegoE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0D1' then
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_DiegoE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_DiegoE takes nothing returns nothing
    set gg_trg_DiegoE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_DiegoE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_DiegoE, function Trig_DiegoE_Actions )
endfunction