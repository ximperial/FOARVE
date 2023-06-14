scope etherglove initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I01K' then
            call UnitAddStat(u, 20, 20, 20)
        elseif GetItemTypeId(it) == 'I01L' then
            call UnitAddStat(u, 25, 25, 25)
        elseif GetItemTypeId(it) == 'I04T' then
            call UnitAddStat(u, 30, 30, 30)
        endif
        if GetItemTypeId(it) == 'I01D' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I01L') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01L'))
                call UnitAddItemByIdSwapped('I04T', u)
            elseif UnitHasItemOfTypeBJ(u, 'I01K') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01K'))
                call UnitAddItemByIdSwapped('I01L', u)
            elseif UnitHasItemOfTypeBJ(u, 'I03X') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03X'))
                call UnitAddItemByIdSwapped('I01K', u)
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
        
        if GetItemTypeId(it) == 'I01K' then
            call UnitAddStat(u, - 20, - 20, - 20)
        elseif GetItemTypeId(it) == 'I01L' then
            call UnitAddStat(u, - 25, - 25, - 25)
        elseif GetItemTypeId(it) == 'I04T' then
            call UnitAddStat(u, - 30, - 30, - 30)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope