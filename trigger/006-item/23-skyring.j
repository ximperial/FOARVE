scope skyring initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a
        
        if GetItemTypeId(it) == 'I03O' then
            call UnitAddStat(u, 40, 40, 40)
        elseif GetItemTypeId(it) == 'I03P' then
            call UnitAddStat(u, 50, 50, 50)
            set a = GetItemAbility(it, 'A080')
            call SetAbilityRealLevelField(a, ABILITY_RLF_COOLDOWN, 0, 110)
        elseif GetItemTypeId(it) == 'I04J' then
            call UnitAddStat(u, 60, 60, 60)
            set a = GetItemAbility(it, 'A080')
            call SetAbilityRealLevelField(a, ABILITY_RLF_COOLDOWN, 0, 100)
        endif
        if GetItemTypeId(it) == 'I01V' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I03P') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03P'))
                call UnitAddItemByIdSwapped('I04J', u)
            elseif UnitHasItemOfTypeBJ(u, 'I03O') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03O'))
                call UnitAddItemByIdSwapped('I03P', u)
            elseif UnitHasItemOfTypeBJ(u, 'I023') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I023'))
                call UnitAddItemByIdSwapped('I03O', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        
        set u = null
        set it = null
        set a = null
    endfunction
    
    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I03O' then
            call UnitAddStat(u, - 40, - 40, - 40)
        elseif GetItemTypeId(it) == 'I03P' then
            call UnitAddStat(u, - 50, - 50, - 50)
        elseif GetItemTypeId(it) == 'I04J' then
            call UnitAddStat(u, - 60, - 60, - 60)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope