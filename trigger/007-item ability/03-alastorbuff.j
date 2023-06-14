scope alastorbuff initializer init

    private function period takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)

        if GetUnitAbilityLevel(t, 'B010') > 0 then
            call DamageUnit(u, t, GetUnitMaxLife(t) * 0.03 / 10)
        else
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function receive takes nothing returns nothing
        local timer z
        local unit u = GetTriggerBuffSourceUnit()
        local unit t = GetTriggerBuffTarget()
        local buff buffs = GetTriggerBuff()
        local integer abilId = GetBuffTypeId(buffs)

        if abilId == 'B010' and t != gg_unit_H0DS_0066 then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call TimerStart(z, 0.1, true, function period)
        endif

        set z = null
        set u = null
        set t = null
        set buffs = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_BUFF_RECEIVED, function receive)
    endfunction
endscope