scope bossspell initializer init

    private function period1 takes nothing returns nothing
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ushiwakamaru_3.mp3")
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 20 or count == 40 or count == 60 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.6, 0.8), 1.5, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        endif
        if count == 10 or count == 30 or count == 50 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1.5, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
        if count == 50 then
            call Effect("war3mapImported\\red-smoke1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.6, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count == 75 or count == 90 or count == 105 or count == 120 or count == 135 then 
            if count > 120 then 
                set a = LoadReal(ht, GetHandleId(z), 100)
            endif
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 0.7, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, 1.15, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 75 then 
            call SaveReal(ht, GetHandleId(z), 100, a)
        endif
        if count >= 75 and count <= 145 then 
            set a = LoadReal(ht, GetHandleId(z), 100)
            set x = PolarX(GetUnitX(u), 20, a)
            set y = PolarY(GetUnitY(u), 20, a)
            if count > 120 then
                call SetUnitXY(u, x, y, 1)
            else
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 105 then
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 0.5) 
        endif
        if count == 115 then 
            call Effect("war3mapImported\\az_pa_c-black2.mdl", GetUnitX(u), GetUnitY(u), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        endif
        if count == 145 then 
            call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 60, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapImported\\dunno1.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 155 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, GetUnitMaxLife(t) * 0.3)
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

    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit d
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local effect e
        local real a
        local real dist
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer index
        local integer lastIndex
        local integer pid
        local integer i
        
        call SaveInteger(ht, GetHandleId(z), 0, count)
        if count <= 110 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call GroupEnumUnitsInRect(gGroup, gg_rct_Boss_Arena, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                set pid = GetPlayerId(GetOwningPlayer(gUnit))
                if FilterGeneral(u, gUnit) and gUnit == MainHero[pid] then
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            if GroupGetCount(g) == 0 then
                call SetUnitTimeScale(u, 1)
                call PauseUnit(u, false)
                call SetUnitInvulnerable(u, false)
                call IssueImmediateOrderById(u, 851972)
                call DestroyGroup(g)
                call FlushChildHashtable(ht, GetHandleId(z))
                call PauseTimer(z)
                call DestroyTimer(z)
            endif
        endif
        if count == 2 then
            call SoundStart("war3mapImported\\Ushiwakamaru_4.mp3")
            call SetUnitAnimationByIndex(u, 11)
            call SaveReal(ht, GetHandleId(z), 100, GetUnitFacing(u))
            call SaveInteger(ht, GetHandleId(z), 100, - 1)
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 or count == 100 then
            set a = LoadReal(ht, GetHandleId(z), 100) + 72
            call SaveReal(ht, GetHandleId(z), 100, a)
            set index = LoadInteger(ht, GetHandleId(z), 100) + 1
            call SaveInteger(ht, GetHandleId(z), 100, index)
            set x = PolarX(GetUnitX(u), 300, a)
            set y = PolarY(GetUnitY(u), 300, a)
            set d = GroupGetUnitByIndex(g, index)
            if d == null then
                set lastIndex = LoadInteger(ht, GetHandleId(z), 101)
                set d = LoadUnitHandle(ht, GetHandleId(z), 100 + lastIndex)
                call SaveUnitHandle(ht, GetHandleId(z), 100 + index, d)
            else
                call SaveUnitHandle(ht, GetHandleId(z), 100 + index, d)
                call SaveInteger(ht, GetHandleId(z), 101, index)
            endif
            call Effect("war3mapImported\\ShadowStar-DustWave.mdl", x, y, 0, randomAngle(), 0, 0, 0.8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\AFBRedCharge.mdl", x, y, 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapImported\\Ushiwakamaru.mdl", x, y, 0, a, 0, 0, 1, 3, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SaveEffectHandle(ht, GetHandleId(z), 200 + index, bj_lastCreatedEffect)
        endif
        if count == 110 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
        endif
        if count == 120 then
            set i = 0
            set index = LoadInteger(ht, GetHandleId(z), 100)
            loop
                exitwhen i > index
                set d = LoadUnitHandle(ht, GetHandleId(z), 100 + i)
                set e = LoadEffectHandle(ht, GetHandleId(z), 200 + i)
                call PauseUnit(d, true)
                call SetUnitInvulnerable(d, true)
                call SetSpecialEffectAnimationByIndex(e, 10)
                call SetSpecialEffectTimeScale(e, 1)
                set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(d), GetUnitY(d))
                call SaveReal(ht, GetHandleId(z), 200 + i, a)
                set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(d), GetUnitY(d))
                call SaveReal(ht, GetHandleId(z), 300 + i, dist)
                set i = i + 1
            endloop
        endif
        if count >= 120 and count <= 140 then 
            set i = 0
            set index = LoadInteger(ht, GetHandleId(z), 100)
            loop
                exitwhen i > index
                set d = LoadUnitHandle(ht, GetHandleId(z), 100 + i)
                set e = LoadEffectHandle(ht, GetHandleId(z), 200 + i)
                set a = LoadReal(ht, GetHandleId(z), 200 + i)
                set dist = LoadReal(ht, GetHandleId(z), 300 + i)
                call PauseUnit(d, true)
                call SetUnitInvulnerable(d, true)
                set x = PolarX(GetEffectX(e), 10 + dist / 20, a)
                set y = PolarY(GetEffectY(e), 10 + dist / 20, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                call SetSpecialEffectYaw(e, a)
                if count == 130 then
                    set x = PolarX(GetUnitX(d), - 300, a)
                    set y = PolarY(GetUnitY(d), - 300, a)
                    call Effect("war3mapImported\\[DoFT]e_slashred.mdl", x, y, 50, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                endif
                set i = i + 1
            endloop
        endif
        if count == 140 then 
            set i = 0
            set index = LoadInteger(ht, GetHandleId(z), 100)
            loop
                exitwhen i > index
                set d = LoadUnitHandle(ht, GetHandleId(z), 100 + i)
                if d != LoadUnitHandle(ht, GetHandleId(z), 100 + i - 1) then
                    call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(d), GetUnitY(d), 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\Shade Bomb.mdl", GetUnitX(d), GetUnitY(d), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                    call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
                    call Effect("war3mapImported\\ShadowAssault.mdl", GetUnitX(d), GetUnitY(d), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\DevilSlam.mdl", GetUnitX(d), GetUnitY(d), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\blacksphere.mdl", GetUnitX(d), GetUnitY(d), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                endif
                set i = i + 1
            endloop
        endif
        if count == 150 then
            set i = 0
            set index = LoadInteger(ht, GetHandleId(z), 100)
            loop
                exitwhen i > index
                set d = LoadUnitHandle(ht, GetHandleId(z), 100 + i)
                if IsUnitInGroup(d, g) then
                    call PauseUnit(d, false)
                    call SetUnitInvulnerable(d, false)
                    call DamageUnit(u, d, GetUnitMaxLife(d) * 0.3)
                    call IssueImmediateOrderById(d, 851972)
                    call GroupRemoveUnit(g, d)
                endif
                set i = i + 1
            endloop
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
    
    private function period3 takes nothing returns nothing
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ushiwakamaru_5.mp3")
            call SoundStart("war3mapImported\\Ushiwakamaru_5-1.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 20 or count == 40 or count == 60 then
            call Effect("war3mapImported\\ShadowStar-DustWave.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ShadowStar-DustWave.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ShadowStar-DustWave.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ShadowStar-DustWave.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 80 then
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dimension Slash.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dimension Slash.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 90 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, GetUnitMaxLife(t) * 0.3)
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

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ushiwakamaru_6.mp3")
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 20 or count == 50 then
            call SetUnitTimeScale(u, 0.2)
        endif
        if count == 1 or count == 15 or count == 30 or count == 50 or count == 70 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count <= 30 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), 10, a)
                set y = PolarY(GetUnitY(u), 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 then
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 500, a)
            set y = PolarY(GetUnitY(t), 500, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.5)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.7, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count > 30 and count <= 70 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), 10, a)
                set y = PolarY(GetUnitY(u), 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Ushiwakamaru_6-1.mp3")
            call Effect("war3mapImported\\blacksphere.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 0.35, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set i = 1
            loop
                exitwhen i > 8
                set x = PolarX(GetUnitX(u), GetRandomReal(- 400, 400), randomAngle())
                set y = PolarY(GetUnitY(u), GetRandomReal(- 400, 400), randomAngle())
                call Effect("war3mapImported\\blacksphere.mdl", x, y, GetRandomReal(100, 350), randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.15)
                set i = i + 1
            endloop
        endif
        if count == 85 then
            call Effect("war3mapImported\\dunno2.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.35, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
        endif
        if count == 90 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, GetUnitMaxLife(t) * 0.3)
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
        local unit d
        local ability a
        local real x
        local real y
        local integer i
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A03O' then
            call SoundStart("war3mapImported\\Ushiwakamaru_1.mp3")
            set d = DummyCall(GetOwningPlayer(u), GetUnitX(u), GetUnitY(u))
            set i = 1
            loop
                exitwhen i > 2
                call UnitAddAbility(d, 'A0EX')
                set a = GetUnitAbility(d, 'A0EX')
                call CastAbilityTarget(a, u)
                call UnitRemoveAbility(d, 'A0EX')
                set i = i + 1
            endloop
            call DummyRecycle(d)
            set x = PolarX(GetUnitX(u), 200, randomAngle())
            set y = PolarY(GetUnitY(u), 200, randomAngle())
            call SetUnitXY(u, x, y, 2)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1000, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitIllusion(gUnit) and GetOwningPlayer(gUnit) == GetOwningPlayer(u) then
                    call UnitAddBonus(gUnit, BONUS_ATTACKSPEED, 5)
                    call UnitAddGuard(u, gUnit, 1, 900, 1200, 1500) 
                endif
            endloop
            call GroupClear(gGroup)
        endif

        if abilId == 'A03Z' then
            call SoundStart("war3mapImported\\Ushiwakamaru_2.mp3")
            if GetUnitTypeId(u) != 'H0G7' then
                call MorphUnit(u, 'H0G7')
            endif
        endif

        if abilId == 'A03N' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A04B' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0DK' then
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

        if abilId == 'A0DL' then
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

        set z = null
        set u = null
        set t = null
        set d = null
        set a = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope