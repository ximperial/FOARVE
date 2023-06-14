scope ringprotect initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I039' then
            call UnitAddStat(u, 5, 5, 5)
            call UnitAddBonus(u, BONUS_ARMOR, 5)
        elseif GetItemTypeId(it) == 'I03A' then
            call UnitAddStat(u, 10, 10, 10)
            call UnitAddBonus(u, BONUS_ARMOR, 10)
        elseif GetItemTypeId(it) == 'I03B' then
            call UnitAddStat(u, 15, 15, 15)
            call UnitAddBonus(u, BONUS_ARMOR, 15)
        endif
        if GetItemTypeId(it) == 'I01U' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I03A') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03A'))
                call UnitAddItemByIdSwapped('I03B', u)
            elseif UnitHasItemOfTypeBJ(u, 'I039') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I039'))
                call UnitAddItemByIdSwapped('I03A', u)
            else
                call AdjustPlayerStateBJ(1000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I039' then
            call UnitAddStat(u, - 5, - 5, - 5)
            call UnitAddBonus(u, BONUS_ARMOR, - 5)
        elseif GetItemTypeId(it) == 'I03A' then
            call UnitAddStat(u, - 10, - 10, - 10)
            call UnitAddBonus(u, BONUS_ARMOR, - 10)
        elseif GetItemTypeId(it) == 'I03B' then
            call UnitAddStat(u, - 15, - 15, - 15)
            call UnitAddBonus(u, BONUS_ARMOR, - 15)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope