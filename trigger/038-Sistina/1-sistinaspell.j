scope sistinaspell initializer init
   
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Sistina_1.mp3")
            call SoundStart("war3mapImported\\Sistina_1-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 2)
            set x = PolarX(GetUnitX(u), 30, a)
            set y = PolarY(GetUnitY(u), 30, a)
            call Effect("war3mapimported\\MC 02.mdx", x, y, 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\SisTNld.mdx", x, y, 150, a, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0G4'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
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
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Sistina_2.mp3")
            call SoundStart("war3mapImported\\Sistina_2-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapimported\\baofeng.mdx", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, 2, 1.5, PercentTo255(20), 255, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
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
                    call DamageUnit(u, gUnit, (1 + GetUnitAbilityLevel(u, 'A0GR')) * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
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

    private function period3_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local effect e = LoadEffectHandle(ht, zid, 100)
        local integer count = LoadInteger(ht, zid, 0)
        local real dist = LoadReal(ht, zid, 0)
        local real x = LoadReal(ht, zid, 1)
        local real y = LoadReal(ht, zid, 2)
        local real a = Angle(GetEffectX(e), GetEffectY(e), x, y) + LoadReal(ht, zid, 100)
        local real x2 = PolarX(GetEffectX(e), dist / 20, a)
        local real y2 = PolarY(GetEffectY(e), dist / 20, a)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call SetEffectXY(e, x2, y2, 1)
        call SetSpecialEffectZ(e, 50 + GetAxisZ(x2, y2))
        call SetSpecialEffectYaw(e, a)
        if count == 20 then
            call SetSpecialEffectAnimation(e, "death")
            call Effect("war3mapImported\\sistinaboom.mdl", x2, y2, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call GroupEnumUnitsInRange(gGroup, x2, y2, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, ((6 + 2 * GetUnitAbilityLevel(u, 'A0GT')) * GetHeroStr(u, true)) / 30)
                    call IssueImmediateOrderById(gUnit, 851972)
                endif 
            endloop
            call GroupClear(gGroup)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    private function period3_1 takes unit u, real x, real y returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)

        call SaveUnitHandle(ht, zid, 0, u)
        call Effect("war3mapImported\\sistinatoushe.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        call SaveInteger(ht, zid, 0, 0)
        call SaveReal(ht, zid, 0, dist)
        call SaveReal(ht, zid, 1, x)
        call SaveReal(ht, zid, 2, y)
        call SaveReal(ht, zid, 100, GetRandomReal(- 20, 20))
        call TimerStart(z, 0.02, true, function period3_2)

        set z = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real x2 
        local real y2

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Sistina_4.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count == 10 or count == 20 or count == 30 then
            call SoundStart("war3mapImported\\Sistina_4-1.mp3")
        endif
        if count <= 30 then
            set a = randomAngle()
            set x2 = PolarX(x, GetRandomReal(- 500, 500), a)
            set y2 = PolarY(y, GetRandomReal(- 500, 500), a)
            call period3_1(u, x2, y2)
        endif
        if count == 30 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Sistina_5.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapimported\\windgreen.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 50 then
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call SaveReal(ht, zid, 0, a)
        endif
        if count >= 50 and count <= 90 then
            set e = LoadEffectHandle(ht, zid, 100)
            set a = LoadReal(ht, zid, 0)
            set x = PolarX(GetEffectX(e), 50, a)
            set y = PolarY(GetEffectY(e), 50, a)
            call SetEffectXY(e, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wzcfql2.mdl", x, y, 150, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\sistinaboom.mdl", x, y, 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            endif
        endif
        if count == 90 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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
        if count == 1 then
            call SoundStart("war3mapImported\\Sistina_6.mp3")
            call VisionArea(GetOwningPlayer(u), 1500, 4, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapimported\\windgreen.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count >= 30 and count <= 150 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 20 then
                call SaveInteger(ht, zid, 1, 0)
                call SoundStart("war3mapImported\\Sistina_6-1.mp3")
                call GroupEnumUnitsInRange(gGroup, GetUnitX(t), GetUnitY(t), 600, null)
                loop 
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) then 
                        call DamageUnit(u, gUnit, 11 * GetHeroStr(u, true) / 6)
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif 
                endloop
                call GroupClear(gGroup)
                call Effect("war3mapImported\\Cyclon Explosion_green.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\WDFZL_green.mdl", GetUnitX(t), GetUnitY(t), - 400, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                call Effect("war3mapImported\\[A]dustexplosion.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 12, 1, PercentTo255(30), 255, PercentTo255(30), 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            endif
        endif
        if count == 150 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueTargetOrderById(u, 851983, t)
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
            call SoundStart("war3mapImported\\Sistina_7.mp3")
            call SetUnitX(u, PolarX(GetUnitX(t) , 140, a))
            call SetUnitY(u, PolarY(GetUnitY(t) , 140, a))
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 0.9)
        endif
        if count == 5 then
            call SetUnitFacing(u, a)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Yomi_5-2.mp3")
            call Effect("war3mapimported\\123 (383)_2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set i = 0
            loop
                exitwhen i > 5
                set x = PolarX(GetUnitX(t), 300, i * 60)
                set y = PolarY(GetUnitY(t), 300, i * 60)
                call Effect("war3mapimported\\sistinaboom.mdx", x, y, 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                set i = i + 1
            endloop
        endif
        if count == 25 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0G4' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0GR' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0GT' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0HC' then
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

        if abilId == 'A0HD' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0HE' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
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