scope DamageLib
    function AliceF_Func2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a2
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then 
            call SoundStart("war3mapImported\\Alice_6-1.mp3")
            call SetUnitTimeScale(u, 2)
        endif
        if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 or count == 110 or count == 130 then 
            call ShakeCamera(0.5, GetOwningPlayer(u) , 5)
            call ShakeCamera(0.5, GetOwningPlayer(t) , 5)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            set a2 = randomAngle()
            set x = PolarX(GetUnitX(t) , 140, a2)
            set y = PolarY(GetUnitY(t) , 140, a2)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, GetRandomInt(3, 4))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t) , GetUnitY(t) , 150, a, - 90, 0, 1, 1, 213, 204, 73, PercentTo255(GetRandomReal(70, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.85))
            call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t) , GetUnitY(t) , 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count >= 10 and count <= 130 then
            set x = PolarX(GetUnitX(t) , 10, a)
            set y = PolarY(GetUnitY(t) , 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 140 or count == 150 or count == 160 or count == 170 or count == 180 then 
            call SetUnitAnimationByIndex(u, GetRandomInt(3, 4))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, 1, 1, 213, 204, 73, PercentTo255(GetRandomReal(70, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.85))
            call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\effect_alice08.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, GetRandomReal(1.5, 2) , 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count >= 140 and count <= 180 then
            set x = PolarX(GetUnitX(t) , 10, a)
            set y = PolarY(GetUnitY(t) , 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t) , - 120, a)
            set y = PolarY(GetUnitY(t) , - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count >= 180 and count <= 220 then
            set x = PolarX(GetUnitX(t) , 20, a)
            set y = PolarY(GetUnitY(t) , 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 190 then
            call SoundStart("war3mapImported\\Alice_6-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.65)
            call Effect("war3mapimported\\effect_alice05.mdx", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 200 and count <= 230 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 15, a)
                set y = PolarY(GetUnitY(u) , dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , -120, a)
                set y = PolarY(GetUnitY(t) , -120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\punchshot.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                call Effect("war3mapimported\\effect_alice08.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
        endif
        if count == 230 then
            call SoundStart("war3mapImported\\Escanor_3-2.mp3")
            call SetSoundVolume(DummySound, 100)
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapimported\\AliceFSFX1.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\AliceFSFX2.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 0.9, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 240 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u , t, 11 * GetHeroAgi(u, true))
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
    
    function AliceF_Func1 takes unit u, unit t returns nothing
        local timer z = CreateTimer()

        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function AliceF_Func2)

        set z = null
    endfunction
    
    function AizenD_Func2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local unit d
        local real x
        local real y
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then 
            call SoundStart("war3mapImported\\Aizen_7-1.mp3")
            call SetUnitAnimationByIndex(u, 11)
            call Effect("war3mapimported\\[DoFT]az_xuanfeng1.mdx", GetUnitX(u) , GetUnitY(u) , 0, 270, 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count >= 80 then 
            call SoundStart("war3mapImported\\Aizen_7-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call Effect("war3mapimported\\white-qiquan-juhuang.mdx", GetUnitX(t) , GetUnitY(t) , 0, 270, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]blinkcasterWhite.mdx", GetUnitX(t) , GetUnitY(t) , 0, 270, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t) , GetUnitY(t) , 0, 270, 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            call SetUnitX(t, GetUnitX(u))
            call SetUnitY(t, GetUnitY(u))
            call SetUnitX(u, x)
            call SetUnitY(u, y)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            set d = LoadUnitHandle(ht, StringHash("AizenD") , GetHandleId(u))
            if d == null then
                set d = LoadUnitHandle(ht, StringHash("AizenD") , GetHandleId(t))
            endif
            call DamageUnit(d, t, (8 + B2I(GetUnitAbilityLevel(d, 'B00O') > 0) * 2) * GetHeroAgi(d, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call RemoveSavedHandle(ht, StringHash("AizenD") , GetHandleId(u))
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set u = null
        set t = null
        set d = null
    endfunction
    
    function AizenD_Func1 takes unit u, unit t returns nothing
        local timer z = CreateTimer()

        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call TimerStart(z, 0.02, true, function AizenD_Func2)

        set z = null
    endfunction

    globals
        boolean array echosabre
    endglobals

    function EchoSabre takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local real val

        if IsUnitAlive(t) and GetUnitAbilityLevel(t, 'B012') > 0 and t != null and count < 18 then
            if IsUnitInvulnerable(t) then
                set count = count + 1
                call SaveInteger(ht, zid, 0, count)
                set val = 0.09 * GetUnitMaxLife(t) / 18 * 0.75
                if val < GetUnitCurrentLife(t) then
                    call SetUnitCurrentLife(t, GetUnitCurrentLife(t) - val)
                endif
            else
                set echosabre[pid] = true
                call DamageUnit(u, t, 0.09 * GetUnitMaxLife(t) / 18)
                set echosabre[pid] = false
            endif
        else
            call RemoveSavedInteger(ht, StringHash("Echosabre_" + I2S(pid)) , GetHandleId(t))
            if count >= 18 then
                call UnitRemoveAbility(t, 'B012')
            endif
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    function FilterDamage takes integer id returns boolean
        return echosabre[id]
    endfunction
endscope