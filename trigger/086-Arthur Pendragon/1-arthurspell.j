scope arthurspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arthur_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 3)
            call Effect("war3mapImported\\CF2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e) , 80, a)
            set y = PolarY(GetEffectY(e) , 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0JX'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapImported\\WindExploreEffect(Bigger).mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\a_new_k3.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                call Effect("war3mapImported\\az_slb.mdx", x, y, 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", x, y, 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\az_pafeathermoon_b.mdx", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
        set e = null
    endfunction

    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arthur_2.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 40 then
            set x = PolarX(GetUnitX(t) , 20, a)
            set y = PolarY(GetUnitY(t) , 20, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 45 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            call SaveReal(ht, zid, 10, a)
            set x = PolarX(GetUnitX(t) , - 120, a - 70)
            set y = PolarY(GetUnitY(t) , - 120, a - 70)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 55 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set a = LoadReal(ht, zid, 10)
            set x = PolarX(GetUnitX(t) , - 120, a + 70)
            set y = PolarY(GetUnitY(t) , - 120, a + 70)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 65 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set a = LoadReal(ht, zid, 10)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 70 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0JY')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arthur_4.mp3")
        endif
        if count == 5 then
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t) , - 120, a)
            set y = PolarY(GetUnitY(t) , - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count >= 5 and count <= 20 then
            set x = PolarX(GetUnitX(t) , 20, a)
            set y = PolarY(GetUnitY(t) , 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set x = PolarX(GetUnitX(t) , - 120, a)
            set y = PolarY(GetUnitY(t) , - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Arthur_4-1.mp3")
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(50))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 50 or count == 80 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set x = PolarX(GetUnitX(t), - 120, a + 60)
            set y = PolarY(GetUnitY(t), - 120, a + 60)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\Arthur Pendragon.mdx", x, y, 0, a, 0, 0, 1, 0.4, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", x, y, 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 65 or count == 95 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set x = PolarX(GetUnitX(t), - 120, a - 60)
            set y = PolarY(GetUnitY(t), - 120, a - 60)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\Arthur Pendragon.mdx", x, y, 0, a, 0, 0, 1, 0.4, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", x, y, 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 30 and count <= 110 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            endif
        endif
        if count == 110 then
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.9)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
        endif
        if count == 125 then
            call SoundStart("war3mapImported\\Arthur_4-2.mp3")
            call Effect("war3mapImported\\ArthurSlam.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 135 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\anspdbb.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\AncientExplodeOrange&Yellow.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 140 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0K0')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Arthur_5.mp3")
            call SoundStart("war3mapImported\\Arthur_5-1.mp3")
            call SetUnitAnimationByIndex(u, 13)
            call Effect("war3mapImported\\ArthurLight2.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 4, 13, 255, 255, 255, 255)
            call Effect("war3mapImported\\HolyBlessing.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 13, 255, 255, 255, 255)
            call Effect("war3mapImported\\EX light.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 3, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]judgement.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 13, 255, 255, 255, 255)
        endif
        if count == 100 or count == 200 or count == 300 or count == 400 then
            call Effect("war3mapImported\\EX light.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 3, 255, 255, 255, 255)
        endif
        if count == 156 or count == 204 or count == 250 or count == 300 or count == 354 or count == 509 then
            call SoundStart("war3mapImported\\Arthur_5-2.mp3")
            call Effect("war3mapImported\\ArthurLight.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\AFB_shanguang6_1.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dunno2.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 550 then
            call SoundStart("war3mapImported\\Arthur_5-3.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call Effect("war3mapImported\\yellowql.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\GoldenFlameWave.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 615 then
            call SoundStart("war3mapImported\\Arthur_5-4.mp3")
            call SetUnitAnimationByIndex(u, 15)
            call Effect("war3mapImported\\fanty (86).mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 3, 255, 215, 0, 255)
        endif
        if count == 760 then
            call SetUnitAnimationByIndex(u, 16)
            call Effect("war3mapImported\\aliceswordslam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\BlinkCaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
        endif
        if count == 760 then
            call ShakeCamera(1.5, GetOwningPlayer(u), 10)
            call ShakeCamera(1.5, GetOwningPlayer(t), 10)
            set i = 0
            loop
                exitwhen i > 5
                set x = PolarX(GetUnitX(u), 300 + 250 * i, a)
                set y = PolarY(GetUnitY(u), 300 + 250 * i, a)
                call Effect("war3mapImported\\yellowql.mdx", x, y, 200, a, 90, 0, 0.35, 2, 255, 255, 255, 255)
                call AnimEffectEx(bj_lastCreatedEffect, "birth", 1)
                set i = i + 1
            endloop
        endif
        if count >= 760 and count <= 820 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\white-qiquan-juhuang_yellow.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.35, 2.25), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\white-qiquan-juhuang_yellow.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 820 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arthur_6.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call VisionArea(GetOwningPlayer(u), 1200, 4, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 15)
            call Effect("war3mapImported\\nlygpz.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 215, 0, 255)
            call Effect("war3mapImported\\yellow-guagnzhu-special.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 215, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\fanty (86).mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 215, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 then
            call Effect("war3mapImported\\2953.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 215, 0, 255)
        endif
        if count == 45 then
            call SetUnitAnimationByIndex(u, 16)
        endif
        if count == 50 then
            call ShakeCamera(1.5, GetOwningPlayer(u), 15)
            call Effect("war3mapImported\\yellow-guagnzhu-special.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 60 then
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 60 and count <= 120 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 30, a)
            set y = PolarY(GetEffectY(e), 30, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 350, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 11 * GetHeroAgi(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\WindExploreEffect(Bigger).mdx", x, y, 100, a, 0, 0, 1, 1.5, 255, 215, 0, 255)
                call Effect("war3mapImported\\a_new_k3.mdx", y, x, 0, a, 0, 0, 1, 1, 255, 215, 0, 255)
                call Effect("war3mapImported\\Xuanfeng_whitewind.mdx", x, y, 100, a, 0, 0, 4, 2, 255, 215, 0, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.2, 0.5)
                call Effect("war3mapImported\\az_pafeathermoon_b.mdx", x, y, 100, a, - 90, 0, 4, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
                call Effect("war3mapImported\\white-qiquan-juhuang_yellow.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            endif
        endif
        if count == 125 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
        set e = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
        local real x
        local real y
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local integer i = 0
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arthur_7.mp3")
            call SetUnitVertexColor(u, 255, 255, 255, 0)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\Arthur Pendragon.mdx", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", x, y, 50, a, 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 215, 0, 255)
        endif
        if count == 10 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\Arthur Pendragon.mdx", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", x, y, 50, a, 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 215, 0, 255)
        endif
        if count == 20 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\Arthur Pendragon.mdx", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", x, y, 50, a, 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 215, 0, 255)
        endif
        if count == 30 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Arthur_2-1.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 300)
            set y = PolarY(GetUnitY(t), - 200, a + 300)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\Arthur Pendragon.mdx", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\az_pa_c-black2.mdx", x, y, 50, a, 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 215, 0, 255)
        endif
        if count == 40 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 45 then
            set x = PolarX(GetUnitX(t), - 200, a + 300)
            set y = PolarY(GetUnitY(t), - 200, a + 300)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 140, a)
            set y = PolarY(GetUnitY(t), - 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Arthur_7-1.mp3")
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Arthur_7-2.mp3")
            call Effect("war3mapImported\\62.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 215, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\AncientExplodeOrange&Yellow.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 80 then
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call Effect("war3mapImported\\[DoFT]e_slashred.mdx", x, y, 100, a, 0, 0, 2.25, 1.5, 255, 215, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 85 then
            call SoundStart("war3mapImported\\Arthur_7-3.mp3")
            call SoundStart("war3mapImported\\Kirito_7-2.mp3")
            set x = PolarX(GetUnitX(t), 450, a)
            set y = PolarY(GetUnitY(t), 450, a)
            call SetUnitXY(u, x, y, 1)
        endif
        if count == 90 then
            call Effect("war3mapimported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 95 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set u = null
        set t = null
    endfunction

    private function action takes nothing returns nothing
        local timer z 
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real x1 = GetUnitX(u)
        local real y1 = GetUnitY(u)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0JX' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0JY' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0K0' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0K1' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0K2' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0K3' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period6)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope