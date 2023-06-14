scope sword initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I02V' then
            call UnitAddStat(u, 5, 5, 5)
            call UnitAddBonus(u, BONUS_ATTACK, 50)
        elseif GetItemTypeId(it) == 'I02W' then
            call UnitAddStat(u, 10, 10, 10)
            call UnitAddBonus(u, BONUS_ATTACK, 100)
        elseif GetItemTypeId(it) == 'I02X' then
            call UnitAddStat(u, 15, 15, 15)
            call UnitAddBonus(u, BONUS_ATTACK, 150)
        endif
        if GetItemTypeId(it) == 'I013' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02W') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02W'))
                call UnitAddItemByIdSwapped('I02X', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02V') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02V'))
                call UnitAddItemByIdSwapped('I02W', u)
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

        if GetItemTypeId(it) == 'I02V' then
            call UnitAddStat(u, - 5, - 5, - 5)
            call UnitAddBonus(u, BONUS_ATTACK, - 50)
        elseif GetItemTypeId(it) == 'I02W' then
            call UnitAddStat(u, - 10, - 10, - 10)
            call UnitAddBonus(u, BONUS_ATTACK, - 100)
        elseif GetItemTypeId(it) == 'I02X' then
            call UnitAddStat(u, - 15, - 15, - 15)
            call UnitAddBonus(u, BONUS_ATTACK, - 150)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope