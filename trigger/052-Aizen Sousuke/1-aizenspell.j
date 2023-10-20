scope aizenspell initializer init
   
    private function period1 takes nothing returns nothing
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
        if count == 1 then
            call SoundStart("war3mapImported\\Aizen_1.mp3")
            call SoundStart("war3mapImported\\Aizen_1-1.mp3")
            call SoundStart("war3mapImported\\Aizen_1-2.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 17)
            call SetUnitTimeScale(u, 2)
            call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\az_cocochristmas_d_impact_red.mdx", u, "hand right"))
            call Effect("war3mapImported\\white-qiquan-juhuang_red.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\xtyball.mdl", GetUnitX(u), GetUnitY(u), 50, a + 20, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\xtyball.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapimported\\az_cocochristmas_d_impact_red.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\xtyball.mdl", GetUnitX(u), GetUnitY(u), 50, a - 20, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set x = PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 1)
                call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
                call GroupEnumUnitsInRange(gGroup, x, y, 200, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A03U'))
                        call GroupAddUnit(g, gUnit)
                    endif
                endloop
                call GroupClear(gGroup)
                if iterator == 3 then
                    call Effect("war3mapImported\\az_cocochristmas_d_impact_red.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                endif
                set i = i + 1
            endloop
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
            endif
        endif
        if count == 15 then 
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call SetSpecialEffectAnimation(e, "death")
                call SetSpecialEffectTimeScale(e, 0.75)
                call Effect("war3mapImported\\W_Effect05.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\bymutou_huozhu_siwang-red.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
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
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Aizen_2.mp3")
            call SoundStart("war3mapImported\\Aizen_2-1.mp3")
            call SetUnitAnimationByIndex(u, 17)
            call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\white-shandian-qiquan-yellow.mdx", u, "hand right"))
            call Effect("war3mapimported\\whiteslice_yellow.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\white-qiquan-juhuang_yellow.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\white-shandian-qiquan-yellow.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 30, a)
            set y = PolarY(GetEffectY(e), dist / 30, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Aizen_2-2.mp3")
            call Effect("war3mapimported\\white-qiquan-juhuang_yellow.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\RaitonAizen2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\az_kaldr_blast_t2_yellow.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 35 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A03P')) * GetHeroAgi(u, true))
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
        set e = null
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Aizen_4.mp3")
            call SetUnitAnimationByIndex(u, 16)
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_huozhu_purple.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_huozhu_purple.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 0)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Aizen_4-1.mp3")
            call Effect("war3mapimported\\[DoFT]Kurohitsugib.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 3, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.4, 0.6)
            call TimeScaleEffect(bj_lastCreatedEffect, 1.2, 0.9)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.9, 1.2)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Aizen_4-2.mp3")
        endif
        if count == 70 then
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\[DoFT]blood132.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 80 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A03Q')) * GetHeroAgi(u, true))
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
        local real x2
        local real y2
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Aizen_5.mp3")
            call SoundStart("war3mapImported\\Aizen_5-1.mp3")
            call SetUnitAnimationByIndex(u, 16)
            call Effect("war3mapimported\\[DoFT]twist.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_huozhu_purple.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 0)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 20 then
            set x = PolarX(GetUnitX(u), - 600, a)
            set y = PolarY(GetUnitY(u), - 600, a)
            set dist = Distance(x, y, GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, zid, 100, dist)
            call Effect("war3mapimported\\[DoFT]HadoDragon.mdx", x, y, 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3.5)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            set x2 = PolarX(x, 400, a + 90)
            set y2 = PolarY(y, 400, a + 90)
            call Effect("war3mapimported\\[DoFT]HadoDragon.mdx", x2, y2, 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3.5)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x2, y2, 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            set x2 = PolarX(x, 400, a - 90)
            set y2 = PolarY(y, 400, a - 90)
            call Effect("war3mapimported\\[DoFT]HadoDragon.mdx", x2, y2, 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3.5)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x2, y2, 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count >= 20 and count <= 60 then
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set dist = LoadReal(ht, zid, 100)
                set x = PolarX(GetEffectX(e), dist / 40, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), dist / 40, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                set i = i + 1
            endloop
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Aizen_5-2.mp3")
            call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[DoFT]DaoGuang_BaoZha_purple.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 400, a + 90)
            set y = PolarY(GetUnitY(t), 400, a + 90)
            call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x, y, 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[DoFT]DaoGuang_BaoZha_purple.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 400, a - 90)
            set y = PolarY(GetUnitY(t), 400, a - 90)
            call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x, y, 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[DoFT]DaoGuang_BaoZha_purple.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 70 then 
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
        set e = null
    endfunction

    private function period5 takes nothing returns nothing
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Aizen_6.mp3")
            set x = PolarX(GetUnitX(t), - 800, a)
            set y = PolarY(GetUnitY(t), - 800, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count <= 90 then
            set x = PolarX(GetUnitX(u), 5, a)
            set y = PolarY(GetUnitY(u), 5, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\[DoFT]cf.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(50))
                call Effect("war3mapimported\\DustWaveNew.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(20))
                call Effect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, PercentTo255(20))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call Effect("war3mapimported\\white-qiquan-juhuang.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(20))
                call Effect("war3mapimported\\Aizen_Form_squished.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 0.4, 255, 255, 255, 125)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 12)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            endif
        endif
        if count == 100 then
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapimported\\[DoFT]dingzhi_by_wood_effect_blood_biaoxue_2.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 110 then
            call SoundStart("war3mapImported\\Aizen_6-1.mp3")
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\[DoFT]t_thunderclapcaster.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\[DoFT]az_hit-blue-blade.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        endif
        if count == 120 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
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

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        if not IsUnitInvulnerable(t) then 
            set count = count + 1
            call SaveInteger(ht, zid, 0, count)
        endif
        if count >= 50 or not IsUnitAlive(t) or GetUnitAbilityLevel(t, 'B016') == 0 then 
            call UnitRemoveAbility(t, 'A07Q')
            call UnitRemoveAbility(t, 'B016')
            call FlushChildHashtable(ht, zid) 
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
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A03U' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A03P' then
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

        if abilId == 'A03Q' then
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

        if abilId == 'A03R' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A03S' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A00U' then
            set z = CreateTimer()
            call SoundStart("war3mapImported\\Aizen_7.mp3")
            call UnitAddAbility(t, 'A07Q')
            call UnitMakeAbilityPermanent(t, true, 'A07Q')
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveUnitHandle(ht, StringHash("AizenD"), GetHandleId(t), u)
            call TimerStart(z, 0.1, true, function period6)
        endif
        
        set z = null
        set u = null
        set t = null
    endfunction
        
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope