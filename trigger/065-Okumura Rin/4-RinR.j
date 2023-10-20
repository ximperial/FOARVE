//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RinR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 6)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Rin_4.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call Effect("war3mapimported\\[A]RinRfire.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.55, 2, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.45, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.45, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", c, "left foot"))
        call SaveEffectHandle(ht, GetHandleId(z) , 3, AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", c, "right hand"))
        call SaveEffectHandle(ht, GetHandleId(z) , 4, AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\ZigguratMissile.mdl", c, "right hand"))
        call SaveEffectHandle(ht, GetHandleId(z) , 5, AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\ZigguratMissile.mdl", c, "left foot"))
    endif
    if count == 40 then
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 70 then
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.45, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.45, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\[A]ChuShou_Blue.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
    endif
    if count == 120 then
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\[A]RinRfire.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 8, 255, 255, 255, PercentTo255(70))
        call SaveEffectHandle(ht, GetHandleId(z) , 6, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 120 then
        call SetEffectX(e, GetUnitX(c))
        call SetEffectY(e, GetUnitY(c))
        call SetSpecialEffectZ(e, 25 + GetUnitZ(c))
    endif
    if count >= 120 and count <= 150 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 25, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 25, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
    endif
    if count == 130 then
        call SoundStart("war3mapImported\\Rin_4-1.mp3")
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 150 or count == 400 then
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\[A]GongChengBlue.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", x, y, 80, a, - 90, 0, 1.1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count >= 150 and count <= 170 then
        set x = PolarX(GetUnitX(t) , 15, a)
        set y = PolarY(GetUnitY(t) , 15, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 150 or count == 180 or count == 210 or count == 250 or count == 290 or count == 320 then
        if count == 150 then
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        else
            if count == 320 then
                call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
                call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
            else
                call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a + GetRandomReal(- 50, 50)))
                call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a + GetRandomReal(- 50, 50)))
                set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
                call SetUnitFacingEx(c, a, true)
            endif
        endif
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(t, a + 180, true)
        set x = PolarX(GetUnitX(t) , 100, a)
        set y = PolarY(GetUnitY(t) , 100, a)
        call Effect("war3mapimported\\huoyantuci.mdx", x, y, 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\huoyantuci.mdx", x, y, 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a + 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a - 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 1.35, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.65, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.45, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(50, 90)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.8))
        set x = PolarX(GetUnitX(t) , 100, a)
        set y = PolarY(GetUnitY(t) , 100, a)
        call Effect("war3mapimported\\blue-slash-more.mdx", x, y, 25, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 360, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 360, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 170 or count == 200 or count == 240 or count == 280 then
        if GetRandomInt(1, 2) == 1 then
            call SetUnitAnimationByIndex(c, 1)
        else
            call SetUnitAnimationByIndex(c, 2) 
        endif 
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitFacingEx(t, a + 180, true)
    endif
    if count >= 180 and count <= 320 then
        set x = PolarX(GetUnitX(t) , 5, a)
        set y = PolarY(GetUnitY(t) , 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Rin_4-2.mp3")
    endif
    if count == 310 or count == 330 or count == 350 then
        if GetRandomInt(1, 2) == 1 then 
            call SetUnitAnimationByIndex(c, 1)
        else
            call SetUnitAnimationByIndex(c, 2)
        endif
    endif
    if count >= 320 and count <= 380 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
    endif
    if count >= 330 and count <= 390 then
        set x = PolarX(GetUnitX(t) , 5, a)
        set y = PolarY(GetUnitY(t) , 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 330 or count == 340 or count == 360 or count == 400 then
        set x = PolarX(GetUnitX(t) , 100, a)
        set y = PolarY(GetUnitY(t) , 100, a)
        call Effect("war3mapimported\\huoyantuci.mdx", x, y, 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\huoyantuci.mdx", x, y, 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a + 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a - 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 1.35, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.65, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.45, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(50, 90)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.8))
        set x = PolarX(GetUnitX(t) , 100, a)
        set y = PolarY(GetUnitY(t) , 100, a)
        call Effect("war3mapimported\\blue-slash-more.mdx", x, y, 25, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\daoguang.mdx", x, y, 25, a, - 360, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\daoguang.mdx", x, y, 25, a, - 360, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 370 then
        call SoundStart("war3mapImported\\Rin_4-3.mp3")
        call SetUnitTimeScale(c, 0.8)
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count >= 400 and count <= 470 then
        set x = PolarX(GetUnitX(t) , 5, a)
        set y = PolarY(GetUnitY(t) , 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
    endif
    if count == 420 then
        call SetUnitTimeScale(c, 0.4)
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count == 430 then
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 1.55, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.65, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.45, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(50, 90)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.8))
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.3, 1, 255, 255, 255, PercentTo255(10))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.45, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.15, 1, PercentTo255(80) , PercentTo255(80) , 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, PercentTo255(80) , PercentTo255(80) , 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
    endif
    if count >= 430 and count <= 490 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 40, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 40, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
        if count > 470 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 20, 0) 
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
        endif
    endif
    if count == 490 then
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(30))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]GongChengBlue.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, - 270, 0, 3, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\huoyantuci.mdx", GetUnitX(t) , GetUnitY(t) , 25, a + 45, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\huoyantuci.mdx", GetUnitX(t) , GetUnitY(t) , 25, a - 45, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", GetUnitX(t) , GetUnitY(t) , 25, a + 45, 0, 0, 3.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", GetUnitX(t) , GetUnitY(t) , 25, a - 45, 0, 0, 3.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\[A]RinRfire.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.45, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.45, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 500 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A08P')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z) , 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z) , 3))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z) , 4))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z) , 5))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_RinR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08P' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_RinR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RinR takes nothing returns nothing
    set gg_trg_RinR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RinR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RinR, function Trig_RinR_Actions)
endfunction