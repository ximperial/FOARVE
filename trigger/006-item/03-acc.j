scope acc initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I04R' then
            call UnitAddStat(u, 3, 0, 0)
        elseif GetItemTypeId(it) == 'I02G' then
            call UnitAddStat(u, 5, 3, 3)
        elseif GetItemTypeId(it) == 'I02E' then
            call UnitAddStat(u, 0, 3, 0)
        elseif GetItemTypeId(it) == 'I02H' then
            call UnitAddStat(u, 3, 5, 3)
        elseif GetItemTypeId(it) == 'I02F' then
            call UnitAddStat(u, 0, 0, 3)
        elseif GetItemTypeId(it) == 'I02I' then
            call UnitAddStat(u, 3, 3, 5)
        endif
        if GetItemTypeId(it) == 'I03I' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I04R') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I04R'))
                call UnitAddItemByIdSwapped('I02G', u)
            else
                call AdjustPlayerStateBJ(200, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I008' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02E') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02E'))
                call UnitAddItemByIdSwapped('I02H', u)
            else
                call AdjustPlayerStateBJ(200, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I004' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02F') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02F'))
                call UnitAddItemByIdSwapped('I02I', u)
            else
                call AdjustPlayerStateBJ(200, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif

        set u = null
        set it = null
    endfunction

    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I04R' then
            call UnitAddStat(u, - 3, 0, 0)
        elseif GetItemTypeId(it) == 'I02G' then
            call UnitAddStat(u, - 5, - 3, - 3)
        elseif GetItemTypeId(it) == 'I02E' then
            call UnitAddStat(u, 0, - 3, 0)
        elseif GetItemTypeId(it) == 'I02H' then
            call UnitAddStat(u, - 3, - 5, - 3)
        elseif GetItemTypeId(it) == 'I02F' then
            call UnitAddStat(u, 0, 0, - 3)
        elseif GetItemTypeId(it) == 'I02I' then
            call UnitAddStat(u, - 3, - 3, - 5)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope