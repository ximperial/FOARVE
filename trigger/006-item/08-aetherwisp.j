scope aetherwisp initializer init
    
    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I058' then
            call UnitAddStat(u, 20, 20, 20)
            call UnitAddBonus(u, BONUS_HEALTH, 100)
        elseif GetItemTypeId(it) == 'I033' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_HEALTH, 200)
        elseif GetItemTypeId(it) == 'I034' then
            call UnitAddStat(u, 40, 40, 40)
            call UnitAddBonus(u, BONUS_HEALTH, 300)
        endif
        if GetItemTypeId(it) == 'I00E' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I05C') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I05C'))
                call UnitAddItemByIdSwapped('I05D', u)
            elseif UnitHasItemOfTypeBJ(u, 'I058') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I058'))
                call UnitAddItemByIdSwapped('I05C', u)
            elseif UnitHasItemOfTypeBJ(u, 'I034') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I034'))
                call UnitAddItemByIdSwapped('I058', u)
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

        if GetItemTypeId(it) == 'I058' then
            call UnitAddStat(u, - 20, - 20, - 20)
            call UnitAddBonus(u, BONUS_HEALTH, - 100)
        elseif GetItemTypeId(it) == 'I033' then
            call UnitAddStat(u, - 30, - 30, - 30)
            call UnitAddBonus(u, BONUS_HEALTH, - 200)
        elseif GetItemTypeId(it) == 'I034' then
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