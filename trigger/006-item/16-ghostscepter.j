scope ghostscepter initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I01A' then
            call UnitAddStat(u, 20, 20, 20)
            call UnitAddBonus(u, BONUS_ARMOR, 20)
        elseif GetItemTypeId(it) == 'I01B' then
            call UnitAddStat(u, 25, 25, 25)
            call UnitAddBonus(u, BONUS_ARMOR, 25)
        elseif GetItemTypeId(it) == 'I04S' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_ARMOR, 30)
        endif
        if GetItemTypeId(it) == 'I01C' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I01B') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01B'))
                call UnitAddItemByIdSwapped('I04S', u)
            elseif UnitHasItemOfTypeBJ(u, 'I01A') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01A'))
                call UnitAddItemByIdSwapped('I01B', u)
            elseif UnitHasItemOfTypeBJ(u, 'I03B') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03B'))
                call UnitAddItemByIdSwapped('I01A', u)
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
        
        if GetItemTypeId(it) == 'I01A' then
            call UnitAddStat(u, - 20, - 20, - 20)
            call UnitAddBonus(u, BONUS_ARMOR, - 20)
        elseif GetItemTypeId(it) == 'I01B' then
            call UnitAddStat(u, - 25, - 25, - 25)
            call UnitAddBonus(u, BONUS_ARMOR, - 25)
        elseif GetItemTypeId(it) == 'I04S' then
            call UnitAddStat(u, - 30, - 30, - 30)
            call UnitAddBonus(u, BONUS_ARMOR, - 30)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope