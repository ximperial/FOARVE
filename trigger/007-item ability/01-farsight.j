scope farsight initializer init

    private function period takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
        local real a = GetSpecialEffectYaw(e)
        local real distance = LoadReal(ht, GetHandleId(z), 0) + 50
        local real x = PolarX(GetEffectX(e), 50, a)
        local real y = PolarY(GetEffectY(e), 50, a)

        call SaveReal(ht, GetHandleId(z), 0, distance)
        if distance < 4000 then
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
            call VisionArea(GetOwningPlayer(u), 800, 5, x, y)
        else
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
        set e = null
    endfunction

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()

        if GetSpellAbilityId() == 'A0G3' then
            set z = CreateTimer()
            call Effect("war3mapImported\\[Plagiat]Effect569.mdl", GetUnitX(u), GetUnitY(u), 100, GetUnitFacing(u), 0, 0, 2, 2, 255, 255, 255, 255)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
            call SaveReal(ht, GetHandleId(z), 0, 0)
            call TimerStart(z, 0.02, true, function period)
        endif

        set z = null
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope