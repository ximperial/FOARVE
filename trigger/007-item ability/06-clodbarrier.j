scope clodbarrier initializer init

    private function period takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real time = LoadReal(ht, GetHandleId(z), 0)

        if not IsUnitInvulnerable(u) then
            set time = time + 0.1
            call SaveReal(ht, GetHandleId(z), 0, time)
        endif
        if time >= 5 or not IsUnitAlive(u) or GetUnitAbilityLevel(u, 'B01E') == 0 then
            call RemoveSavedReal(ht, StringHash("cloud"), GetHandleId(u))
            call UnitRemoveAbility(u, 'A051')
            call UnitRemoveAbility(u, 'B01E')
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction
    
    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()

        if GetSpellAbilityId() == 'A050' then
            set z = CreateTimer()
            if UnitHasItemOfTypeBJ(u, 'I04C') then
                call SaveReal(ht, StringHash("cloud"), GetHandleId(u), 5000)
            elseif UnitHasItemOfTypeBJ(u, 'I026') then
                call SaveReal(ht, StringHash("cloud"), GetHandleId(u), 4000)
            else
                call SaveReal(ht, StringHash("cloud"), GetHandleId(u), 3000)
            endif
            call UnitAddAbility(u, 'A051')
            call UnitMakeAbilityPermanent(u, true, 'A051')
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