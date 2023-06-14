scope sunring initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I02M' then
            call UnitAddStat(u, 50, 40, 30)
        elseif GetItemTypeId(it) == 'I02N' then
            call UnitAddStat(u, 60, 50, 40)
        elseif GetItemTypeId(it) == 'I04L' then
            call UnitAddStat(u, 70, 60, 50)
        endif
        if GetItemTypeId(it) == 'I01X' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02N') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02N'))
                call UnitAddItemByIdSwapped('I04L', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02M') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02M'))
                call UnitAddItemByIdSwapped('I02N', u)
            elseif UnitHasItemOfTypeBJ(u, 'I023') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I023'))
                call UnitAddItemByIdSwapped('I02M', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I02M' then
            call UnitAddStat(u, - 50, - 40, - 30)
        elseif GetItemTypeId(it) == 'I02N' then
            call UnitAddStat(u, - 60, - 50, - 40)
        elseif GetItemTypeId(it) == 'I04L' then
            call UnitAddStat(u, - 70, - 60, - 50)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope