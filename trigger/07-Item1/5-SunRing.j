scope SunRing initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local integer userid = GetUnitUserData(u)

        if GetItemTypeId(it) == 'I023' then
            call UnitAddStat(u, 40, 20, 20)
        elseif GetItemTypeId(it) == 'I02M' then
            call UnitAddStat(u, 60, 20, 20)
        elseif GetItemTypeId(it) == 'I00H' then
            call UnitAddStat(u, 80, 30, 30)
        endif
        if GetItemTypeId(it) == 'I00G' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02M') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02M'))
                call UnitAddItemByIdSwapped('I00H', u)
            else
                call AdjustPlayerStateBJ(3000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        elseif GetItemTypeId(it) == 'I01X' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I023') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I023'))
                call UnitAddItemByIdSwapped('I02M', u)
            else
                call AdjustPlayerStateBJ(2500, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        elseif GetItemTypeId(it) == 'I003' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I022') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I022'))
                call UnitAddItemByIdSwapped('I023', u)
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
        local integer userid = GetUnitUserData(u)

        if GetItemTypeId(it) == 'I023' then
            call UnitAddStat(u, - 40, - 20, - 20)
        elseif GetItemTypeId(it) == 'I02M' then
            call UnitAddStat(u, - 60, - 20, - 20)
        elseif GetItemTypeId(it) == 'I00H' then
            call UnitAddStat(u, - 80, - 30, - 30)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope