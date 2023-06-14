//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_IzayoiT_Func001 takes nothing returns nothing
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
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Satomi_4.mp3")
        call SetUnitAnimationByIndex(c, 15)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call Effect("war3mapImported\\a_new_k3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1.4, 255, 255, 255, 255)
    endif
    if count == 10 then
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\punchshot.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 40 then 
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 25, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 25, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1.3, 1.7), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 40 then 
        call SoundStart("war3mapImported\\Izayoi_5.mp3")
        call SoundStart("war3mapImported\\Satomi_5-1.mp3")
    endif
    if count == 60 then 
        call SetUnitAnimationByIndex(c, 7)
        call SoundStart("war3mapImported\\Izayoi_5-1.mp3")
    endif
    if count >= 40 and count <= 120 then 
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
        if count >= 60 then 
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 14, 0)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 100 then 
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 1.2)
    endif
    if count == 110 then 
        call SoundStart("war3mapImported\\Izayoi_5-2.mp3")
        call SetUnitAnimationByIndex(c, 9)
    endif
    if count == 120 then 
        call SetUnitFlyHeight(c, 0, 840 / 0.6)
    endif
    if count >= 120 and count <= 150 then 
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 25, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set pitch = Slope(GetUnitX(c), GetUnitY(c), 840, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
            call Effect("war3mapImported\\flashaura.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 25, a, pitch, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 25, a, pitch, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 150 then
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapImported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\EarthDetonation.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SZBYAFB2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroStr(c, true))
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

function Trig_IzayoiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A01S' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_IzayoiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_IzayoiT takes nothing returns nothing
    set gg_trg_IzayoiT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_IzayoiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_IzayoiT, function Trig_IzayoiT_Actions )
endfunction