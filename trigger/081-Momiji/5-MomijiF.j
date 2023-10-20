//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MomijiF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local real randomA
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SetUnitTimeScale(c, 2)
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
    endif
    if count == 1 or count == 12 or count == 24 or count == 36 or count == 48 then
        call SoundStart("war3mapImported\\Momiji_2-2.mp3")
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        set randomA = randomAngle()
        set x1 = PolarX(x , GetRandomReal(- 500, 500), randomA)
        set y1 = PolarY(y , GetRandomReal(- 500, 500), randomA)
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x1)
            call SetUnitY(t, y1)
        endif
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, randomA))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, randomA))
        call SetUnitAnimationByIndex(c, GetRandomInt(7, 8))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 6, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 52 then
        call SoundStart("war3mapImported\\Momiji_6.mp3")
        call SoundStart("war3mapImported\\Momiji_6-1.mp3")
        set x = GetUnitX(t)
        set y = GetUnitY(t)
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(x , 500, randomA))
        call SetUnitY(c, PolarY(y , 500, randomA))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 0.9)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
    endif
    if count >= 60 and count <= 80 then
        set x = PolarX(GetUnitX(c), 50, GetUnitFacing(c))
        set y = PolarY(GetUnitY(c), 50, GetUnitFacing(c))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(c), GetUnitY(c), 25, GetUnitFacing(c), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 80 then
        call Effect("war3mapimported\\SKSKSK1.mdx", GetUnitX(t), GetUnitY(t), 40, GetUnitFacing(c), 0, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(t), GetUnitY(t), 25, GetUnitFacing(c), 0, 0, 1.8, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 85 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MomijiF_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 25 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Momiji_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 0.9)
    endif
    if count <= 20 then
        set x = PolarX(GetUnitX(c), 70, a)
        set y = PolarY(GetUnitY(c), 70, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 25 then
        call SoundStart("war3mapImported\\Tohno_6-3.mp3")
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        set x = PolarX(GetUnitX(c), - 700, a)
        set y = PolarY(GetUnitY(c), - 700, a)
        call Effect("war3mapimported\\SKSKSK1.mdx", x, y, 40, a, 0, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", x, y, 25, a, 0, 0, 1.8, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count >= 25 and count <= 35 then
        call GroupEnumUnitsInRange(gGroup, x, y, 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 11 * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 35 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction

function Trig_MomijiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0HK' then 
        set z = CreateTimer()
        if t != null then
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function Trig_MomijiF_Func001)
        else
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, c)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function Trig_MomijiF_Func002)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MomijiF takes nothing returns nothing
    set gg_trg_MomijiF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MomijiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MomijiF, function Trig_MomijiF_Actions)
endfunction