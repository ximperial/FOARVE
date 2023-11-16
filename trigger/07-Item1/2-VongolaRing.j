scope VongolaRing initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I020' then
            call UnitAddStat(u, 10, 10, 10)
        elseif GetItemTypeId(it) == 'I022' then
            call UnitAddStat(u, 20, 20, 20)
        endif
        if GetItemTypeId(it) == 'I015' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I020') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I020'))
                call UnitAddItemByIdSwapped('I022', u)
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

        if GetItemTypeId(it) == 'I020' then
            call UnitAddStat(u, - 10, - 10, - 10)
        elseif GetItemTypeId(it) == 'I022' then
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