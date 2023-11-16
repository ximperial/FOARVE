scope StormRing initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I006' then
            call UnitAddStat(u, 20, 40, 20)
        elseif GetItemTypeId(it) == 'I02J' then
            call UnitAddStat(u, 20, 60, 20)
        elseif GetItemTypeId(it) == 'I00F' then
            call UnitAddStat(u, 30, 80, 30)
        endif
        if GetItemTypeId(it) == 'I00E' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02J') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02J'))
                call UnitAddItemByIdSwapped('I00F', u)
            else
                call AdjustPlayerStateBJ(3000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        elseif GetItemTypeId(it) == 'I01W' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I006') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I006'))
                call UnitAddItemByIdSwapped('I02J', u)
            else
                call AdjustPlayerStateBJ(2500, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        elseif GetItemTypeId(it) == 'I00A' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I022') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I022'))
                call UnitAddItemByIdSwapped('I006', u)
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

        if GetItemTypeId(it) == 'I006' then
            call UnitAddStat(u, - 20, - 40, - 20)
        elseif GetItemTypeId(it) == 'I02J' then
            call UnitAddStat(u, - 20, - 60, - 20)
        elseif GetItemTypeId(it) == 'I00F' then
            call UnitAddStat(u, - 30, - 80, - 30)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope