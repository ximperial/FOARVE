scope CloudRing initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I009' then
            call UnitAddStat(u, 20, 20, 40)
        elseif GetItemTypeId(it) == 'I025' then
            call UnitAddStat(u, 20, 20, 60)
        elseif GetItemTypeId(it) == 'I00D' then
            call UnitAddStat(u, 30, 30, 80)
        endif
        if GetItemTypeId(it) == 'I00C' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I025') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I025'))
                call UnitAddItemByIdSwapped('I00D', u)
            else
                call AdjustPlayerStateBJ(3000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        elseif GetItemTypeId(it) == 'I016' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I009') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I009'))
                call UnitAddItemByIdSwapped('I025', u)
            else
                call AdjustPlayerStateBJ(2500, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        elseif GetItemTypeId(it) == 'I00B' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I022') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I022'))
                call UnitAddItemByIdSwapped('I009', u)
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

        if GetItemTypeId(it) == 'I009' then
            call UnitAddStat(u, - 20, - 20, - 40)
        elseif GetItemTypeId(it) == 'I025' then
            call UnitAddStat(u, - 20, - 20, - 60)
        elseif GetItemTypeId(it) == 'I00D' then
            call UnitAddStat(u, - 30, - 30, - 80)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope