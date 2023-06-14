scope skyshield initializer init

    private function period takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t
        local real time = LoadReal(ht, GetHandleId(z), 0)
        local real dmg

        if not IsUnitInvulnerable(u) then
            set time = time + 0.1
            call SaveReal(ht, GetHandleId(z), 0, time)
        endif
        if time >= 5 or not IsUnitAlive(u) then
            call UnitRemoveAbility(u, 'A0BJ')
            call UnitRemoveAbility(u, 'B002')
            set t = LoadUnitHandle(ht, StringHash("sky"), GetHandleId(u))
            set dmg = LoadReal(ht, StringHash("sky"), GetHandleId(u))
            call DamageUnit(t, u, dmg)
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

        if GetSpellAbilityId() == 'A080' then
            set z = CreateTimer()
            call SaveReal(ht, StringHash("sky"), GetHandleId(u), 0)
            call RemoveSavedHandle(ht, StringHash("sky"), GetHandleId(u))
            call UnitAddAbility(u, 'A0BJ')
            call UnitMakeAbilityPermanent(u, true, 'A0BJ')
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveReal(ht, GetHandleId(z), 0, 0)
            call TimerStart(z, 0.1, true, function period)
        endif

        set z = null
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope