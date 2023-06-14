scope desolator initializer init
    
    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a

        if GetItemTypeId(it) == 'I02T' then
            call UnitAddStat(u, 20, 20, 20)
            call UnitAddBonus(u, BONUS_ATTACK, 200)
        elseif GetItemTypeId(it) == 'I02U' then
            call UnitAddStat(u, 25, 25, 25)
            call UnitAddBonus(u, BONUS_ATTACK, 250)
            set a = GetItemAbility(it, 'A0IL')
            call SetAbilityLevel(a, 2)
        elseif GetItemTypeId(it) == 'I04O' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_ATTACK, 300)
            set a = GetItemAbility(it, 'A0IL')
            call SetAbilityLevel(a, 3)
        endif
        if GetItemTypeId(it) == 'I00M' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02U') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02U'))
                call UnitAddItemByIdSwapped('I04O', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02T') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02T'))
                call UnitAddItemByIdSwapped('I02U', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02X') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02X'))
                call UnitAddItemByIdSwapped('I02T', u)
            else
                call AdjustPlayerStateBJ(1500, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif

        set u = null
        set it = null
        set a = null
    endfunction

    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I02T' then
            call UnitAddStat(u, - 20, - 20, - 20)
            call UnitAddBonus(u, BONUS_ATTACK, - 200)
        elseif GetItemTypeId(it) == 'I02U' then
            call UnitAddStat(u, - 25, - 25, - 25)
            call UnitAddBonus(u, BONUS_ATTACK, - 250)
        elseif GetItemTypeId(it) == 'I04O' then
            call UnitAddStat(u, - 30, - 30, - 30)
            call UnitAddBonus(u, BONUS_ATTACK, - 300)
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope