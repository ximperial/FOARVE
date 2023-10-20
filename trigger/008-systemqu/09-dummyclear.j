scope dummyclear initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        
        if GetUnitTypeId(u) == 'h0CO' or GetUnitAbilityLevel(u, 'Aloc') > 0 then
            call RemoveUnit(u)
        endif
    
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DEATH, function action)
    endfunction
endscope