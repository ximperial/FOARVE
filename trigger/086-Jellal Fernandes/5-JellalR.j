//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_JellalR_Func001 takes nothing returns nothing
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
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Jellal_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 10 then
        call Effect("war3mapimported\\skymgs.mdx", x, y, 1200, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\grandchariotmissile.mdx", x, y, 1200, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set x1 = PolarX(x, 300, a + 90)
        set y1 = PolarY(y, 300, a + 90)
        set x1 = PolarX(x1, 400, a)
        set y1 = PolarY(y1, 400, a)
        call Effect("war3mapimported\\skymgs.mdx", x1, y1, 1200, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\grandchariotmissile.mdx", x1, y1, 1200, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set x1 = PolarX(x, 800, a + 90)
        set y1 = PolarY(y, 800, a + 90)
        set x1 = PolarX(x1, 300, a)
        set y1 = PolarY(y1, 300, a)
        call Effect("war3mapimported\\skymgs.mdx", x1, y1, 1200, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\grandchariotmissile.mdx", x1, y1, 1200, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        set x1 = PolarX(x, 950, a + 90)
        set y1 = PolarY(y, 950, a + 90)
        set x1 = PolarX(x1, 200, a + 180)
        set y1 = PolarY(y1, 200, a + 180)
        call Effect("war3mapimported\\skymgs.mdx", x1, y1, 1200, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\grandchariotmissile.mdx", x1, y1, 1200, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        set x1 = PolarX(x, 500, a - 90)
        set y1 = PolarY(y, 500, a - 90)
        set x1 = PolarX(x1, 100, a - 180)
        set y1 = PolarY(y1, 100, a - 180)
        call Effect("war3mapimported\\skymgs.mdx", x1, y1, 1200, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\grandchariotmissile.mdx", x1, y1, 1200, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
        set x1 = PolarX(x, 1000, a - 90)
        set y1 = PolarY(y, 1000, a - 90)
        set x1 = PolarX(x1, 200, a)
        set y1 = PolarY(y1, 200, a)
        call Effect("war3mapimported\\skymgs.mdx", x1, y1, 1200, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\grandchariotmissile.mdx", x1, y1, 1200, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 7, bj_lastCreatedEffect)
        set x1 = PolarX(x, 1150, a - 90)
        set y1 = PolarY(y, 1150, a - 90)
        set x1 = PolarX(x1, 300, a)
        set y1 = PolarY(y1, 300, a)
        call Effect("war3mapimported\\skymgs.mdx", x1, y1, 1200, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\grandchariotmissile.mdx", x1, y1, 1200, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 8, bj_lastCreatedEffect)
    endif
    if count >= 10 and count <= 50 then
        loop
            exitwhen i > 6
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 30)
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Jellal_4-1.mp3")
        set i = 0 
        loop
            exitwhen i > 6
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call Effect("war3mapimported\\az_tormentedsoul_t1.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1.8, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 400, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A079')) * GetHeroInt(c, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set i = i + 1
        endloop
    endif
    if count == 50 then
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
    set g = null
    set e = null
endfunction

function Trig_JellalR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A079' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_JellalR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_JellalR takes nothing returns nothing
    set gg_trg_JellalR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JellalR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_JellalR, function Trig_JellalR_Actions )
endfunction