scope holylocket initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a

        if GetItemTypeId(it) == 'I01N' then
            call UnitAddStat(u, 20, 20, 20)
            call UnitAddBonus(u, BONUS_HEALTH, 100)
        elseif GetItemTypeId(it) == 'I01O' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_HEALTH, 200)
            set a = GetItemAbility(it, 'A00S')
            call SetAbilityLevel(a, 2)
        elseif GetItemTypeId(it) == 'I04U' then
            call UnitAddStat(u, 40, 40, 40)
            call UnitAddBonus(u, BONUS_HEALTH, 300)
            set a = GetItemAbility(it, 'A00S')
            call SetAbilityLevel(a, 3)
        endif
        if GetItemTypeId(it) == 'I01H' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I01O') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01O'))
                call UnitAddItemByIdSwapped('I04U', u)
            elseif UnitHasItemOfTypeBJ(u, 'I01N') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01N'))
                call UnitAddItemByIdSwapped('I01O', u)
            elseif UnitHasItemOfTypeBJ(u, 'I034') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I034'))
                call UnitAddItemByIdSwapped('I01N', u)
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

        if GetItemTypeId(it) == 'I01N' then
            call UnitAddStat(u, - 20, - 20, - 20)
            call UnitAddBonus(u, BONUS_HEALTH, - 100)
        elseif GetItemTypeId(it) == 'I01O' then
            call UnitAddStat(u, - 30, - 30, - 30)
            call UnitAddBonus(u, BONUS_HEALTH, - 200)
        elseif GetItemTypeId(it) == 'I04U' then
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