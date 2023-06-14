scope stingspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local effect e
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local real dmg
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer uid = LoadInteger(ht, GetHandleId(z), 2)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 3)
            set x = PolarX(GetUnitX(u), 100, a)
            set y = PolarY(GetUnitY(u), 100, a)
            if uid != 'H0CS' then
                if GetRandomInt(1, 2) == 1 then
                    call SoundStart("war3mapImported\\Sting_1.mp3")
                else
                    call SoundStart("war3mapImported\\Sting_1-1.mp3")
                endif
                call Effect("war3mapimported\\a(whiteblue)1.mdx", x, y, 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\windnewfaw3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            else
                call SoundStart("war3mapImported\\Sting_1-2.mp3")
                call Effect("war3mapimported\\a(whiteblue)1.mdx", x, y, 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\SuperShinyThingy2.mdx", x, y, 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 0, 0, 0, 255)
                call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\windnewfaw3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            endif
            set x = PolarX(GetUnitX(u), 100, a)
            set y = PolarY(GetUnitY(u), 100, a)
            call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", x, y, 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            set dmg = 0.2 * GetUnitBuffLevel(u, 'B00G') * GetHeroStr(u, true)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, dmg + 100 * GetUnitAbilityLevel(u, 'A020')) 
                    call GroupAddUnit(g, gUnit)
                endif
            endloop 
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                if uid != 'H0CS' then 
                    call Effect("war3mapimported\\stingroar.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 0.1 + count * 0.1, 1, 255, 255, 255, 255)
                    call Effect("war3mapimported\\FawEffects (3).mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, 0.15 + count * 0.15, 1, 255, 255, 255, 255)
                    call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, 0.15 + count * 0.1, 1, 255, 255, 255, 255)
                else
                    call Effect("war3mapimported\\stingroar.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 0.1 + count * 0.1, 1, 255, 255, 255, 255)
                    call Effect("war3mapimported\\FawEffects (3).mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, 0.15 + count * 0.15, 1, 255, 255, 255, 255)
                    call Effect("war3mapimported\\StingEffect1.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 0.25 + count * 0.25, 1, 255, 255, 255, 255)
                    call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, 0.15 + count * 0.1, 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 15 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
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
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x 
        local real y 
        local real dmg
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer uid = LoadInteger(ht, GetHandleId(z), 2)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SetUnitAnimationByIndex(u, 20)
            call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\buff_bai.mdx", u, "hand right")) 
            if uid != 'H0CS' then
                call SoundStart("war3mapImported\\Sting_2.mp3")
                call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            else
                call SoundStart("war3mapImported\\Sting_2-5.mp3")
                call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 0, 0, 0, 255)
                call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 0, 0, PercentTo255(10), 255)
                call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 40 then
            call SetUnitAnimationByIndex(u, 22)
        endif
        if count == 50 then 
            call SetUnitAnimationByIndex(u, 18)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 40 and count == 60 then 
            if uid != 'H0CS' then 
                call Effect("war3mapimported\\CF2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, .6, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(u), - 100, a)
                set y = PolarY(GetUnitY(u), - 100, a)
                call Effect("war3mapimported\\BY_Wood_GongChengSiPai_5.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            else
                call Effect("war3mapimported\\[A]ZoroEf2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\CF2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, .6, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(u), - 100, a)
                set y = PolarY(GetUnitY(u), - 100, a)
                call Effect("war3mapimported\\BY_Wood_GongChengSiPai_5.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count >= 40 and count <= 70 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 70 then 
            if uid != 'H0CS' then
                call SoundStart("war3mapImported\\Sting_2-1.mp3")
                call SoundStart("war3mapImported\\Sting_2-2.mp3")
                call Effect("war3mapimported\\StingEffect.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\FawEffects (11).mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\SuperBigExplosion4.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\icytouch.mdx", GetUnitX(t), GetUnitY(t), 100, a + 180, - 90, 0, 2, 1, 255, 255, 255, 255)
            else
                call SoundStart("war3mapImported\\Sting_2-6.mp3")
                set x = PolarX(GetUnitX(t), - 200, a)
                set y = PolarY(GetUnitY(t), - 200, a)
                call Effect("war3mapimported\\StingClaws.mdx", x, y, 50, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]ZoroEf2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]ama boom.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 80 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            set dmg = 0.2 * GetUnitBuffLevel(u, 'B00G')
            call DamageUnit(u, t, (dmg + 1 + GetUnitAbilityLevel(u, 'A025')) * GetHeroStr(u, true))
            if uid != 'H0CS' then
                call knockbackUnit(t, 600, a, 0.6)
            endif
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local ability ab
        local effect e
        local real a = GetUnitFacing(u)
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real cd = 0

        call SaveInteger(ht, GetHandleId(z), 0, count)
        if count == 1 then
            call SoundStart( "war3mapImported\\Sting_7-3.mp3" )
            call SetUnitAnimationByIndex(u, 17)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]DarkPulseMisogi.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]ZoroEf3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SetUnitTimeScale(u, 1)
            if GetUnitTypeId(u) != 'H0CS' then
                call MorphUnit(u, 'H0CS')
            endif
            if GetUnitAbilityLevel(u, 'A023') > 0 then
                set ab = GetUnitAbility(u, 'A023')
                if IsAbilityOnCooldown(ab) then
                    set cd = GetAbilityRemainingCooldown(ab)
                endif
                call DisableAbility(ab, true, true)
                call UnitAddAbility(u, 'A0EY')
                call UnitMakeAbilityPermanent(u, true, 'A0EY')
                call SetUnitAbilityLevel(u, 'A0EY', GetUnitAbilityLevel(u, 'A023'))
                if cd != 0 then
                    set ab = GetUnitAbility(u, 'A0EY')
                    call StartAbilityCooldown(ab, cd)
                endif
                set cd = 0
            endif
            if GetUnitAbilityLevel(u, 'A02F') > 0 then
                set ab = GetUnitAbility(u, 'A02F')
                if IsAbilityOnCooldown(ab) then
                    set cd = GetAbilityRemainingCooldown(ab)
                endif
                call DisableAbility(ab, true, true)
                call UnitAddAbility(u, 'A0EZ')
                call UnitMakeAbilityPermanent(u, true, 'A0EZ')
                if cd != 0 then
                    set ab = GetUnitAbility(u, 'A0EZ')
                    call StartAbilityCooldown(ab, cd)
                endif
                set cd = 0
            endif
            if LoadInteger(ht, StringHash("specialitem"), GetHandleId(u)) != 0 then
                set ab = GetUnitAbility(u, 'A00T')
                if IsAbilityOnCooldown(ab) then
                    set cd = GetAbilityRemainingCooldown(ab)
                endif
                call DisableAbility(ab, true, true)
                call UnitAddAbility(u, 'A0F0')
                call UnitMakeAbilityPermanent(u, true, 'A0F0')
                if cd != 0 then
                    set ab = GetUnitAbility(u, 'A0F0')
                    call StartAbilityCooldown(ab, cd)
                endif
            endif
            call SaveEffectHandle(ht, GetHandleId(z), 10, AddSpecialEffectTarget("war3mapimported\\AuraCyan.mdx", u, "origin"))
        endif
        if count > 10 and GetUnitAbilityLevel(u, 'B00G') == 0 and IsUnitAlive(u) then 
            call MorphUnit(u, 'H03B')
            if GetUnitAbilityLevel(u, 'A023') > 0 then
                set ab = GetUnitAbility(u, 'A0EY')
                if IsAbilityOnCooldown(ab) then
                    set cd = GetAbilityRemainingCooldown(ab)
                endif
                call UnitRemoveAbility(u, 'A0EY')
                set ab = GetUnitAbility(u, 'A023')
                call EnableAbility(ab, true, true)
                if cd != 0 then
                    call StartAbilityCooldown(ab, cd)
                endif
                set cd = 0
            endif
            if GetUnitAbilityLevel(u, 'A02F') > 0 then
                set ab = GetUnitAbility(u, 'A0EZ')
                if IsAbilityOnCooldown(ab) then
                    set cd = GetAbilityRemainingCooldown(ab)
                endif
                call UnitRemoveAbility(u, 'A0EZ')
                set ab = GetUnitAbility(u, 'A02F')
                call EnableAbility(ab, true, true)
                if cd != 0 then
                    call StartAbilityCooldown(ab, cd)
                endif
                set cd = 0
            endif
            if LoadInteger(ht, StringHash("specialitem"), GetHandleId(u)) != 0 then
                set ab = GetUnitAbility(u, 'A0F0')
                if IsAbilityOnCooldown(ab) then
                    set cd = GetAbilityRemainingCooldown(ab)
                endif
                call UnitRemoveAbility(u, 'A0F0')
                set ab = GetUnitAbility(u, 'A00T')
                call EnableAbility(ab, true, true)
                if cd != 0 then
                    call StartAbilityCooldown(ab, cd)
                endif
            endif
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call DestroyEffect(e)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set ab = null
        set e = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local effect e
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real z1
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart( "war3mapImported\\Sting_4.mp3" )
            call SetUnitAnimationByIndex(u, 9)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 then
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, 0, .8, 1, 255, 255, 255, 255)
        endif
        if count == 50 or count == 70 or count == 90 then
            call Effect("war3mapimported\\a(whiteblue)1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u) + 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255) 
        endif
        if count <= 60 then 
            if dist < 600 then 
                set x = PolarX(GetUnitX(u), - 12, a)
                set y = PolarY(GetUnitY(u), - 12, a)
                call SetUnitXY(u, x, y, 2)
            endif
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 10, 0)
        endif
        if count == 70 then 
            call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u) + 50, a, - 135, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 600, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count >= 70 and count <= 100 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            set x = PolarX(GetEffectX(e), dist / 20, a)
            set y = PolarY(GetEffectY(e), dist / 20, a)
            set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e), GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
            if dist > 50 then
                call SetEffectXY(e, x, y, 0)
            endif
            call SetSpecialEffectZ(e, z1 - 20)
            call Effect("war3mapimported\\stingroar.mdx", x, y, GetEffectZ(e), a, 0, 0, 0.1 + (count - 70) * 0.05, 1, 255, 255, 255, 255)
        endif
        if count == 90 then 
            call SoundStart("war3mapImported\\Sting_4-1.mp3")
        endif
        if count == 100 then 
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\EarthSlamWhiteNew.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Almagest.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 110 then 
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A023')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
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
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit d
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local effect e
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local real dmg
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart( "war3mapImported\\Sting_4-2.mp3" )
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 17)
            call SetUnitTimeScale(u, .5)
            call Effect("war3mapimported\\stingroar.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), a)
            call SaveUnitHandle(ht, GetHandleId(z), 10, d)
            call EnableUnitMovement(d, false)
            call UnitApplyTimedLife(d, 'BTLF', 2.5)
            if GetLocalPlayer() == GetOwningPlayer(u) then 
                call ClearSelection()
                call SelectUnit(d, true)
            endif
        endif
        if count == 30 or count == 60 or count == 90 then
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 then
            set d = LoadUnitHandle(ht, GetHandleId(z), 10)
            if GetLocalPlayer() == GetOwningPlayer(u) then 
                call ClearSelection()
                call SelectUnit(d, true)
            endif
        endif
        if count <= 100 then 
            set d = LoadUnitHandle(ht, GetHandleId(z), 10)
            call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(d))
            call SetUnitFacing(u, GetUnitFacing(d))
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2000, null)
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
        if count == 100 then 
            call SoundStart("war3mapImported\\Sting_4-3.mp3")
            call ForGroup(g, function ResetMoveSpeed)
            call GroupClear(g)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a + 180, - 180, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 180, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a + 180, - 180, 0, 2.75, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 180, 0, 2.25, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 20, bj_lastCreatedEffect)
        endif
        if count >= 100 and count <= 150 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 20)
            set x = PolarX(GetEffectX(e), 50, a)
            set y = PolarY(GetEffectY(e), 50, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 400, null)
            set dmg = 0.2 * GetUnitBuffLevel(u, 'B00G')
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (dmg + 6 + 2 * GetUnitAbilityLevel(u, 'A023')) * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\StingRForm1.mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, GetRandomReal(2.25, 3.25), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\StingEffect1.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, GetRandomReal(2, 2.5), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, GetRandomReal(1.75, 2.25), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\stingroar.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 150 then 
            set e = LoadEffectHandle(ht, GetHandleId(z), 20)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\EarthSlamWhiteNew.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 4.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StingEffect1.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\az_slb.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Sand3.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Almagest.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 155 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set d = null
        set g = null
        set e = null
    endfunction

    private struct stingT extends Missiles
        
    unit u
                    
    method onPeriod takes nothing returns boolean
        return false
    endmethod
                    
    method onRemove takes nothing returns nothing
        call Effect("war3mapimported\\by_wood_effect_qigongbo_lan.mdx", .x, .y, .z, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx", .x, .y, .z, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, .x , .y , 400, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(u, gUnit) then
                call DamageUnit(u, gUnit, 15 * GetHeroStr(u, true) / 25)
                call IssueImmediateOrderById(gUnit, 851972)
            endif
        endloop
        call GroupClear(gGroup)
            
        set u = null
    endmethod
    
endstruct

private function period6 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local real x1 = LoadReal(ht, GetHandleId(z), 0)
    local real y1 = LoadReal(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), x1, y1)
    local real dist = Distance(GetUnitX(u), GetUnitY(u), x1, y1)
    local real x2
    local real y2
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local stingT move

    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Sting_5.mp3" )
        call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
        call SetUnitAnimationByIndex(u, 12)
    endif
    if count == 20 or count == 50 or count == 80 then
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\windnewfaw3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, .8, 1, 255, 255, 255, 255)
    endif
    if count == 40 or count == 80 or count == 120 then 
        call Effect("war3mapimported\\ChargeWhite.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count <= 60 then 
        if dist < 600 then 
            set x2 = PolarX(GetUnitX(u), - 12, a)
            set y2 = PolarY(GetUnitY(u), - 12, a)
            call SetUnitXY(u, x2, y2, 2)
        endif
    endif
    if count == 70 then 
        call SoundStart("war3mapImported\\Sting_5-1.mp3")
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\stingroar.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, .6, 1, 255, 255, 255, 255)
    endif
    if count >= 70 and count <= 130 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x2 = PolarX(x1, GetRandomReal(- 500, 500), randomAngle())
            set y2 = PolarY(y1, GetRandomReal(- 500, 500), randomAngle())
            set move = stingT.create(GetUnitX(u), GetUnitY(u), 100, x2, y2, GetRandomReal(100, 150))
            set move.u = u
            set move.duration = 0.4
            set move.model = "war3mapimported\\by_wood_effect_qigongbo_lan.mdl"
            set move.scale = 2
            if GetRandomInt(1, 2) == 1 then
                set move.curve = 20
            else
                set move.curve = - 20
            endif
            call move.launch()
        endif
    endif
    if count <= 130 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2000, null)
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
    if count == 130 then
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g) 
    endif
    if count == 135 then 
        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)
        call SetUnitInvulnerable(u, false)
        call IssueImmediateOrderById(u, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif

    set z = null
    set u = null
    set g = null
endfunction

private function period7 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local real dmg
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Sting_5-2.mp3" )
        call SetUnitAnimationByIndex(u, 25)
        call SetUnitTimeScale(u, .5)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 30 or count == 60 or count == 90 or count == 120 then
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 50 then
        call SoundStart( "war3mapImported\\Sting_5-3.mp3" )
    endif
    if count == 150 then 
        call SoundStart( "war3mapImported\\Sting_5-4.mp3" )
    endif
    if count >= 150 and count <= 300 then
        if dist > 140 then 
            set x = PolarX(GetUnitX(u), dist / 30, a)
            set y = PolarY(GetUnitY(u), dist / 30, a)
            call SetUnitXY(u, x, y, 0)
        else
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]ZoroEf2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\CF2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), - 100, a)
            set y = PolarY(GetUnitY(u), - 100, a)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_5.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 300 then 
        call SoundStart("war3mapImported\\Sting_5-5.mp3")
        call SetUnitTimeScale(u, 5)
        call Effect("war3mapimported\\by_wood_yangguangpuzhao.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, .5, 1.5, 255, 255, 255, 255)
    endif
    if count == 290 or count == 320 or count == 350 then 
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(1, 1.5), 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(1, 1.5), 1, 0, 0, 0, 255)
    endif
    if count >= 300 and count <= 350 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapimported\\bule-dark-salsh.mdx", x, y, GetRandomReal(100, 300), randomAngle(), 0, 0, GetRandomReal(.3, .4), 1, 0, 0, 0, 255)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapimported\\zhanji-pink-lizi.mdx", x, y, GetRandomReal(100, 300), randomAngle(), 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 360 then 
        call PauseUnit(u, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(u, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 15 + 0.2 * GetUnitBuffLevel(u, 'B00G')
        call DamageUnit(u, t, dmg * GetHeroStr(u, true))
        call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
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

private function period8 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 230 then 
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Sting_6.mp3")
        call SetUnitTimeScale(u, 3)
    endif
    if count <= 220 then
        set x = PolarX(GetUnitX(t), 3, a)
        set y = PolarY(GetUnitY(t), 3, a)
        call SetUnitXY(t, x, y, 2)
        set x = PolarX(GetUnitX(t), - 120, a)
        set y = PolarY(GetUnitY(t), - 120, a)
        call SetUnitXY(u, x, y, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitAnimationByIndex(u, GetRandomInt(2, 5))
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), a + 90)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), a + 90)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_2.mdx", x, y, GetRandomReal(150, 250), a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", x, y, GetRandomReal(150, 250), a, 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), a - 90)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), a - 90)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_2.mdx", x, y, GetRandomReal(150, 250), a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", x, y, GetRandomReal(150, 250), a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindWeak2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindWeak(Thicker).mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 220 then
        call SoundStart("war3mapImported\\Sting_6-1.mp3")
        call SetUnitAnimationByIndex(u, 18)
        call SetUnitTimeScale(u, 1.5)
    endif
    if count == 230 then 
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 0, a + 180, - 180, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\EffecthPush.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\FawEffects (11).mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(u, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(u, t, 11 * GetHeroStr(u, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(u, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 260 then 
        set a = LoadReal(ht, GetHandleId(z), 0)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\EarthSlamWhiteNew.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\FawEffects (11).mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\az_slb.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif

    set z = null
    set u = null
    set t = null
endfunction

private function period9 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local real dmg
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 230 then 
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Sting_6-2.mp3")
        call SetUnitTimeScale(u, 2)
    endif
    if count <= 150 then
        set x = PolarX(GetUnitX(t), 3, a)
        set y = PolarY(GetUnitY(t), 3, a)
        call SetUnitXY(t, x, y, 2)
        set x = PolarX(GetUnitX(t), - 120, a)
        set y = PolarY(GetUnitY(t), - 120, a)
        call SetUnitXY(u, x, y, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitAnimationByIndex(u, GetRandomInt(2, 5))
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), a + 90)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), a + 90)
            call Effect("war3mapimported\\amx (345).mdx", x, y, 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_2.mdx", x, y, GetRandomReal(100, 200), a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", x, y, GetRandomReal(100, 200), a, 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), a - 90)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), a - 90)
            call Effect("war3mapimported\\amx (345).mdx", x, y, 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_2.mdx", x, y, GetRandomReal(100, 200), a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", x, y, GetRandomReal(100, 200), a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 0, 0, 0, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Sting_6-3.mp3")
        call SetUnitAnimationByIndex(u, 2)
        call SetUnitTimeScale(u, .2)
    endif
    if count == 230 then 
        call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\FawEffects (11).mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]ama boom.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 3, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(u, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 11 + 0.2 * GetUnitBuffLevel(u, 'B00G')
        call DamageUnit(u, t, dmg * GetHeroStr(u, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(u, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 230 and count <= 260 then 
        if count > 245 then 
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        else
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
    endif
    if count == 260 then
        set a = LoadReal(ht, GetHandleId(z), 0) 
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\EarthSlamWhiteNew.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\FawEffects (11).mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\az_slb.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]Sand3.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif

    set z = null
    set u = null
    set t = null
endfunction

private function period10 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real x1 = LoadReal(ht, GetHandleId(z), 0)
    local real y1 = LoadReal(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), x1, y1)
    local real dist = Distance(GetUnitX(u), GetUnitY(u), x1, y1)
    local real x2
    local real y2
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Sting_3.mp3")
        call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
        call SetUnitAnimationByIndex(u, 11)
        call SetUnitTimeScale(u, 6)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ChargeWhite.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 15 then 
        call SetUnitXY(u, x1, y1, 1)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(u, gUnit) then
                call DamageUnit(u, gUnit, 8 * GetHeroStr(u, true))
            endif
        endloop
        call GroupClear(gGroup)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ArcaneExplosion_Boss_Base.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, .5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\az_slb.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Almagest.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\EarthSlamWhiteSlashes.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StingEffect.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\FawEffects (11).mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(u, 1)
        call SetUnitInvulnerable(u, false)
        call PauseUnit(u, false)
        call IssueImmediateOrderById(u, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif

    set z = null
    set u = null
endfunction

private function period11 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = GetUnitFacing(u)
    local real dmg
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Sting_3-1.mp3")
        call SetUnitAnimationByIndex(u, 16)
        call SetUnitTimeScale(u, 0.5)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 50 or count == 80 or count == 110 or count == 140 then 
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 0, 0, 0, 255)
        call Effect("war3mapimported\\by_wood_flame_explosion_2_1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count <= 80 then 
        call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1500, null)
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
    if count == 80 then 
        call ForGroup(g, function ResetMoveSpeed)
        call GroupClear(g)
        call Effect("war3mapimported\\File00000283.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\ChuShou_BY_Wood_Effect_Unusual_Kof_BaShenAn_BaJiuBei_13.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
    endif
    if count >= 80 and count <= 160 then 
        call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
        set dmg = 8 + 0.2 * GetUnitBuffLevel(u, 'B00G')
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(u, gUnit) then
                if not IsUnitInGroup(gUnit, g) then
                    call knockupUnit(gUnit, 1.6, 1000)
                    call DamageUnit(u, gUnit, dmg * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 110 or count == 140 then 
        call Effect("war3mapimported\\ChuShou_BY_Wood_Effect_Unusual_Kof_BaShenAn_BaJiuBei_13.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
    endif
    if count == 160 then 
        call SetUnitTimeScale(u, 1)
        call SetUnitInvulnerable(u, false)
        call PauseUnit(u, false)
        call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
        call IssueImmediateOrderById(u, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif

    set z = null
    set u = null
    set g = null
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

    if abilId == 'A020' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, GetUnitTypeId(u))
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function period1)
    endif

    if abilId == 'A025' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, GetUnitTypeId(u))
        call TimerStart(z, 0.02, true, function period2)
    endif

    if abilId == 'A02E' then
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function period3)
    endif

    if abilId == 'A023' then
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

    if abilId == 'A0EY' then
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

    if abilId == 'A02F' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function period6)
    endif

    if abilId == 'A0EZ' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function period7)
    endif

    if abilId == 'A024' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if GetUnitTypeId(u) != 'H0CS' then
            call TimerStart(z, 0.02, true, function period8)
        else
            call TimerStart(z, 0.02, true, function period9)
        endif
    endif

    if abilId == 'A00T' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function period10)
    endif

    if abilId == 'A0F0' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function period11)
    endif

    set z = null
    set u = null
    set t = null
endfunction

private function init takes nothing returns nothing
    call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
endfunction
endscope