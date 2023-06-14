scope alastor initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I03E' then
            call UnitAddStat(u, 20, 20, 20)
            call UnitAddBonus(u, BONUS_HEALTH, 100)
        elseif GetItemTypeId(it) == 'I03F' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_HEALTH, 200)
        elseif GetItemTypeId(it) == 'I04N' then
            call UnitAddStat(u, 40, 40, 40)
            call UnitAddBonus(u, BONUS_HEALTH, 300)
        endif
        if GetItemTypeId(it) == 'I057' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I03F') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03F'))
                call UnitAddItemByIdSwapped('I04N', u)
            elseif UnitHasItemOfTypeBJ(u, 'I03E') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I03E'))
                call UnitAddItemByIdSwapped('I03F', u)
            elseif UnitHasItemOfTypeBJ(u, 'I034') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I034'))
                call UnitAddItemByIdSwapped('I03E', u)
            else
                call AdjustPlayerStateBJ(1500, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif

        set u = null
        set it = null
    endfunction

    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I03E' then
            call UnitAddStat(u, - 20, - 20, - 20)
            call UnitAddBonus(u, BONUS_HEALTH, - 100)
        elseif GetItemTypeId(it) == 'I03F' then
            call UnitAddStat(u, - 30, - 30, - 30)
            call UnitAddBonus(u, BONUS_HEALTH, - 200)
        elseif GetItemTypeId(it) == 'I04N' then
            call UnitAddStat(u, - 40, - 40, - 40)
            call UnitAddBonus(u, BONUS_HEALTH, - 300)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope