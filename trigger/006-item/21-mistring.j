scope mistring initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a
        
        if GetItemTypeId(it) == 'I028' then
            call UnitAddStat(u, 40, 50, 30)
        elseif GetItemTypeId(it) == 'I029' then
            call UnitAddStat(u, 50, 60, 40)
            set a = GetItemAbility(it, 'A0IQ')
            call SetAbilityLevel(a, 2)
        elseif GetItemTypeId(it) == 'I04H' then
            call UnitAddStat(u, 60, 70, 50)
            set a = GetItemAbility(it, 'A0IQ')
            call SetAbilityLevel(a, 3)
        endif
        if GetItemTypeId(it) == 'I017' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I029') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I029'))
                call UnitAddItemByIdSwapped('I04H', u)
            elseif UnitHasItemOfTypeBJ(u, 'I028') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I028'))
                call UnitAddItemByIdSwapped('I029', u)
            elseif UnitHasItemOfTypeBJ(u, 'I023') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I023'))
                call UnitAddItemByIdSwapped('I028', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        
        set u = null
        set it = null
        set a = null
    endfunction
    
    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        
        if GetItemTypeId(it) == 'I028' then
            call UnitAddStat(u, - 40, - 50, - 30)
        elseif GetItemTypeId(it) == 'I029' then
            call UnitAddStat(u, - 50, - 60, - 40)
        elseif GetItemTypeId(it) == 'I04H' then
            call UnitAddStat(u, - 60, - 70, - 50)
        endif
        
        set u = null
        set it = null
    endfunction
    
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope