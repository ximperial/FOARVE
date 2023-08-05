scope cooldown initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local ability a = GetSpellAbility()
        local integer alvl = GetAbilityLevel(a)
        local integer orderId = GetUnitCurrentOrder(u)
        local integer aid = GetSpellAbilityId()
        local real value 
        local real value2
        local real bcd
        local real rcd

        if orderId != 852008 and orderId != 852009 and orderId != 852010 and orderId != 852011 and orderId != 852012 and orderId != 852013 then
            set value = 1
            if UnitHasItemOfTypeBJ(u, 'I04T') then
                set value = 0.75
            elseif UnitHasItemOfTypeBJ(u, 'I01L') then
                set value = 0.8
            elseif UnitHasItemOfTypeBJ(u, 'I01K') then
                set value = 0.85
            elseif UnitHasItemOfTypeBJ(u, 'I03X') then
                set value = 0.85
            elseif UnitHasItemOfTypeBJ(u, 'I03T') then
                set value = 0.9
            elseif UnitHasItemOfTypeBJ(u, 'I03S') then
                set value = 0.95
            endif
            set value2 = 0
            if GetUnitAbilityLevel(u, 'B00Y') > 0 then
                if aid == 'A0AH' or aid == 'A0AI' then
                    set value2 = 5
                endif
            endif
            set bcd = GetAbilityBaseRealLevelFieldById(aid, ABILITY_RLF_COOLDOWN, alvl - 1)
            set rcd = GetAbilityRealLevelField(a, ABILITY_RLF_COOLDOWN, alvl - 1)
            if rcd != value2 + bcd * value then
                call SetAbilityRealLevelField(a, ABILITY_RLF_COOLDOWN, alvl - 1, value2 + bcd * value)
            endif
        endif
        
        set u = null
        set a = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope