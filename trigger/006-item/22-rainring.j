scope rainring initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I02B' then
            call UnitAddStat(u, 30, 40, 50)
        elseif GetItemTypeId(it) == 'I02C' then
            call UnitAddStat(u, 40, 50, 60)
        elseif GetItemTypeId(it) == 'I04I' then
            call UnitAddStat(u, 50, 60, 70)
        endif
        if GetItemTypeId(it) == 'I018' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02C') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02C'))
                call UnitAddItemByIdSwapped('I04I', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02B') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02B'))
                call UnitAddItemByIdSwapped('I02C', u)
            elseif UnitHasItemOfTypeBJ(u, 'I023') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I023'))
                call UnitAddItemByIdSwapped('I02B', u)
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
        
        if GetItemTypeId(it) == 'I02B' then
            call UnitAddStat(u, - 30, - 40, - 50)
        elseif GetItemTypeId(it) == 'I02C' then
            call UnitAddStat(u, - 40, - 50, - 60)
        elseif GetItemTypeId(it) == 'I04I' then
            call UnitAddStat(u, - 50, - 60, - 70)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope