scope gloveshaste initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I03S' then
            call UnitAddStat(u, 5, 5, 5)
        elseif GetItemTypeId(it) == 'I03T' then
            call UnitAddStat(u, 10, 10, 10)
        elseif GetItemTypeId(it) == 'I03X' then
            call UnitAddStat(u, 15, 15, 15)
        endif
        if GetItemTypeId(it) == 'I019' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I03T') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03T'))
                call UnitAddItemByIdSwapped('I03X', u)
            elseif UnitHasItemOfTypeBJ(u, 'I03S') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03S'))
                call UnitAddItemByIdSwapped('I03T', u)
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
        
        if GetItemTypeId(it) == 'I03S' then
            call UnitAddStat(u, - 5, - 5, - 5)
        elseif GetItemTypeId(it) == 'I03T' then
            call UnitAddStat(u, - 10, - 10, - 10)
        elseif GetItemTypeId(it) == 'I03X' then
            call UnitAddStat(u, - 15, - 15, - 15)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope