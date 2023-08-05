scope mikuspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, zid, 1)
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\miku_1.mp3")
            call SoundStart("war3mapImported\\miku_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.9)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A092'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\blizzard.mdl", x, y, 0, a + 180, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
                call Effect("war3mapImported\\effect_IRui03.mdl", x, y, 50, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SoundStart("war3mapImported\\miku_1-2.mp3")
            call Effect("war3mapImported\\afbbxks.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call SetUnitTimeScale(u, 1)
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\miku_2.mp3")
            call SetUnitVertexColor(u, 255, 255, 255, 0)
        endif
        if count == 5 then
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 10 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 30 then
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 35 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 55 then
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 60 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 80 then
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 300)
            set y = PolarY(GetUnitY(t), - 200, a + 300)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 85 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 95 then
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
        if count == 100 then
            call SoundStart("war3mapImported\\miku_2-1.mp3")
        endif
        if count == 110 then
            call SoundStart("war3mapImported\\miku_2-2.mp3")
            call Effect("war3mapImported\\effect_IRui02.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\62.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 115 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0IZ')) * GetHeroInt(u, true))
            call knockbackUnit(t, 600, a, 0.6)
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A092' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0IZ' then
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

        if abilId == 'A0J7' then
            call SoundStart("war3mapImported\\miku_3.mp3")
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope