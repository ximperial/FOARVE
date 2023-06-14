scope thunderring initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a
        local integer gold
        
        if GetItemTypeId(it) == 'I02P' then
            call UnitAddStat(u, 50, 30, 40)
        elseif GetItemTypeId(it) == 'I02Q' then
            call UnitAddStat(u, 60, 40, 50)
            set a = GetItemAbility(it, 'A058')
            call SetAbilityRealLevelField(a, ABILITY_RLF_COOLDOWN, 0, 110)
        elseif GetItemTypeId(it) == 'I04M' then
            call UnitAddStat(u, 70, 50, 60)
            set a = GetItemAbility(it, 'A058')
            call SetAbilityRealLevelField(a, ABILITY_RLF_COOLDOWN, 0, 100)
        endif
        if GetItemTypeId(it) == 'I021' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02Q') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02Q'))
                call UnitAddItemByIdSwapped('I04M', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02P') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02P'))
                call UnitAddItemByIdSwapped('I02Q', u)
            elseif UnitHasItemOfTypeBJ(u, 'I023') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I023'))
                call UnitAddItemByIdSwapped('I02P', u)
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
        
        if GetItemTypeId(it) == 'I02P' then
            call UnitAddStat(u, - 50, - 30, - 40)
        elseif GetItemTypeId(it) == 'I02Q' then
            call UnitAddStat(u, - 60, - 40, - 50)
        elseif GetItemTypeId(it) == 'I04M' then
            call UnitAddStat(u, - 70, - 50, - 60)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope