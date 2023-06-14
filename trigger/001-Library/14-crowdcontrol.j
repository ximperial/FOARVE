scope crowdcontrol

    private function knockap takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real airTime = LoadReal(ht, GetHandleId(z), 0)
        local real duration = LoadReal(ht, GetHandleId(z), 1)
        local real fly = LoadReal(ht, GetHandleId(z), 2)

        if duration > 0 and IsUnitAlive(u) then
            set duration = duration - 0.02
            call SaveReal(ht, GetHandleId(z), 1, duration)
            if duration > airTime / 2 then
                call IssueImmediateOrderById(u, 851972)
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + fly, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - fly, 0)
            endif
        else
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    function knockupUnit takes unit u, real duration, real refHeight returns nothing
        local timer z = CreateTimer()
        local real rate = refHeight / (refHeight / duration)
        local real fly = refHeight / (rate / 0.02)

        call UnitAddAbility(u, 'Amrf')
        call UnitRemoveAbility(u, 'Amrf')
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveReal(ht, GetHandleId(z), 0, duration)
        call SaveReal(ht, GetHandleId(z), 1, duration)
        call SaveReal(ht, GetHandleId(z), 2, fly)
        call TimerStart(z, 0.02, true, function knockap)

        set z = null
    endfunction

    private function knockbak takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real distance = LoadReal(ht, GetHandleId(z), 0)
        local real angle = LoadReal(ht, GetHandleId(z), 1)
        local real speed = LoadReal(ht, GetHandleId(z), 2)
        local real travel = LoadReal(ht, GetHandleId(z), 10) + speed
        local real x
        local real y

        call SaveReal(ht, GetHandleId(z), 10, travel)
        if travel >= distance or not IsUnitAlive(u) then
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        else
            set x = PolarX(GetUnitX(u), speed, angle)
            set y = PolarY(GetUnitY(u), speed, angle)
            call SetUnitXY(u, x, y, 2)
        endif

        set z = null
        set u = null
    endfunction

    function knockbackUnit takes unit u, real distance, real angle, real duration returns nothing
        local timer z = CreateTimer()
        local real speed = distance / (duration / 0.02)

        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveReal(ht, GetHandleId(z), 0, distance)
        call SaveReal(ht, GetHandleId(z), 1, angle)
        call SaveReal(ht, GetHandleId(z), 2, speed)
        call TimerStart(z, 0.02, true, function knockbak)

        set z = null
    endfunction

    function stunUnit takes unit u, real duration returns nothing
        local unit dummy = DummyCall(Player(15), GetUnitX(u), GetUnitY(u))
        local ability a
        
        call UnitAddAbility(dummy, 'A048')
        set a = GetUnitAbility(dummy, 'A048')
        call SetAbilityRealLevelField(a, ABILITY_RLF_DURATION_HERO, 0, duration)
        call SetAbilityRealLevelField(a, ABILITY_RLF_DURATION_NORMAL, 0, duration)
        call CastAbilityTarget(a, u)
        call UnitRemoveAbility(dummy, 'A048')
        call DummyRecycle(dummy)
        
        set dummy = null
        set a = null
    endfunction
    
    function silenceUnit takes unit u, real duration returns nothing
        local unit dummy = DummyCall(Player(15), GetUnitX(u), GetUnitY(u))
        local ability a
        
        call UnitAddAbility(dummy, 'A081')
        set a = GetUnitAbility(dummy, 'A081')
        call SetAbilityRealLevelField(a, ABILITY_RLF_DURATION_HERO, 0, duration)
        call SetAbilityRealLevelField(a, ABILITY_RLF_DURATION_NORMAL, 0, duration)
        call CastAbilityTarget(a, u)
        call UnitRemoveAbility(dummy, 'A081')
        call DummyRecycle(dummy)
        
        set dummy = null
        set a = null
    endfunction

    function disarmUnit takes unit u, real duration returns nothing
        local unit dummy = DummyCall(Player(15), GetUnitX(u), GetUnitY(u))
        local ability a
        
        call UnitAddAbility(dummy, 'A0IJ')
        set a = GetUnitAbility(dummy, 'A0IJ')
        call SetAbilityRealLevelField(a, ABILITY_RLF_DURATION_HERO, 0, duration)
        call SetAbilityRealLevelField(a, ABILITY_RLF_DURATION_NORMAL, 0, duration)
        call CastAbilityTarget(a, u)
        call UnitRemoveAbility(dummy, 'A0IJ')
        call DummyRecycle(dummy)
        
        set dummy = null
        set a = null
    endfunction

    private function locked takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
        local real duration = LoadReal(ht, GetHandleId(z), 0) - 0.02
        local boolean stop = LoadBoolean(ht, GetHandleId(z), 0)
        local integer count

        if duration <= 0 or not IsUnitAlive(u) then
            call SetUnitMoveSpeed(u, GetUnitDefaultMoveSpeed(u))
            call DestroyEffect(e)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        else
            call SaveReal(ht, GetHandleId(z), 0, duration)
            call SetUnitMoveSpeed(u, 0)
            if stop then
                call IssueImmediateOrderById(u, 851972)
            endif
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    function lockUnit takes unit u, real duration, boolean stop returns nothing
        local timer z = CreateTimer()
        local effect e = AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\EntanglingRoots\\EntanglingRootsTarget.mdl", u, "origin")

        call SetUnitMoveSpeed(u, 0)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveEffectHandle(ht, GetHandleId(z), 1, e)
        call SaveReal(ht, GetHandleId(z), 0, duration)
        call SaveBoolean(ht, GetHandleId(z), 0, stop)
        call TimerStart(z, 0.02, true, function locked)

        set z = null
        set e = null
    endfunction
endscope