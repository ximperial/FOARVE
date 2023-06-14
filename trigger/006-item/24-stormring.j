scope stormring initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I02J' then
            call UnitAddStat(u, 40, 50, 30)
        elseif GetItemTypeId(it) == 'I02K' then
            call UnitAddStat(u, 50, 60, 40)
        elseif GetItemTypeId(it) == 'I04K' then
            call UnitAddStat(u, 60, 70, 50)
        endif
        if GetItemTypeId(it) == 'I01W' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02K') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02K'))
                call UnitAddItemByIdSwapped('I04K', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02J') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02J'))
                call UnitAddItemByIdSwapped('I02K', u)
            elseif UnitHasItemOfTypeBJ(u, 'I023') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I023'))
                call UnitAddItemByIdSwapped('I02J', u)
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
        
        if GetItemTypeId(it) == 'I02J' then
            call UnitAddStat(u, - 40, - 50, - 30)
        elseif GetItemTypeId(it) == 'I02K' then
            call UnitAddStat(u, - 50, - 60, - 40)
        elseif GetItemTypeId(it) == 'I04K' then
            call UnitAddStat(u, - 60, - 70, - 40)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope