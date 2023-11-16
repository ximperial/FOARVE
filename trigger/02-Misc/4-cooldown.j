scope cooldown initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local ability ab = GetSpellAbility()
        local integer alvl = GetAbilityLevel(ab)
        local integer orderId = GetUnitCurrentOrder(u)
        local integer aid = GetSpellAbilityId()
        local integer userid = GetUnitUserData(u)
        local real val
        local real baseCD
        local real realCD

        if orderId != 852008 and orderId != 852009 and orderId != 852010 and orderId != 852011 and orderId != 852012 and orderId != 852013 then
            set val = 100 / (100 + AbilityHaste[userid])
            set baseCD = GetAbilityBaseRealLevelFieldById(aid, ABILITY_RLF_COOLDOWN, alvl - 1)
            set realCD = GetAbilityRealLevelField(ab, ABILITY_RLF_COOLDOWN, alvl - 1)
            if realCD != baseCD * val then
                call SetAbilityRealLevelField(ab, ABILITY_RLF_COOLDOWN, alvl - 1, baseCD * val)
            endif
        endif
        
        set u = null
        set ab = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope