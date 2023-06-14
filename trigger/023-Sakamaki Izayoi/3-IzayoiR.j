//TESH.scrollpos=27
//TESH.alwaysfold=0
function Trig_IzayoiR_Func001 takes nothing returns nothing
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
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Izayoi_4.mp3")
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 20 then
        call Effect("war3mapImported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\valkdustNew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 190 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count <= 200 then 
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
            call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        else
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitX(c, x)
            call SetUnitY(c, y)
            call Effect("war3mapimported\\wind2.mdx", GetUnitX(c), GetUnitY(c), 125, a, - 90, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 20 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                if count <= 190 then
                    call SetUnitAnimationByIndex(c, 1)
                endif
                call Effect("war3mapimported\\EarthDetonation.mdx", GetUnitX(c), GetUnitY(c), 125, a, - 90, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(.8, 1.2), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[a]sandpoff123.mdx", GetUnitX(c), GetUnitY(c), 125, a, - 90, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            endif
        endif
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Izayoi_4-1.mp3")
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\odamarasengannormal.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\SZBYAFB2.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\SBXZAFB2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 210 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A01R')) * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_IzayoiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A01R' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_IzayoiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_IzayoiR takes nothing returns nothing
    set gg_trg_IzayoiR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_IzayoiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_IzayoiR, function Trig_IzayoiR_Actions )
endfunction