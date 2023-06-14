scope periapt initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I032' then
            call UnitAddStat(u, 10, 10, 10)
        elseif GetItemTypeId(it) == 'I033' then
            call UnitAddStat(u, 15, 15, 15)
        elseif GetItemTypeId(it) == 'I034' then
            call UnitAddStat(u, 20, 20, 20)
        endif
        if GetItemTypeId(it) == 'I01S' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I033') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I033'))
                call UnitAddItemByIdSwapped('I034', u)
            elseif UnitHasItemOfTypeBJ(u, 'I032') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I032'))
                call UnitAddItemByIdSwapped('I033', u)
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

        if GetItemTypeId(it) == 'I032' then
            call UnitAddStat(u, - 10, - 10, - 10)
        elseif GetItemTypeId(it) == 'I033' then
            call UnitAddStat(u, - 15, - 15, - 15)
        elseif GetItemTypeId(it) == 'I034' then
            call UnitAddStat(u, - 20, - 20, - 20)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope