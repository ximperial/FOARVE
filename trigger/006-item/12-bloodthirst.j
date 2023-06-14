scope bloodthirst initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a

        if GetItemTypeId(it) == 'I06N' then
            call UnitAddStat(u, 20, 20, 20)
            call UnitAddBonus(u, BONUS_ATTACK, 200)
        elseif GetItemTypeId(it) == 'I06O' then
            call UnitAddStat(u, 25, 25, 25)
            call UnitAddBonus(u, BONUS_ATTACK, 250)
            set a = GetItemAbility(it, 'A055')
            call SetAbilityLevel(a, 2)
        elseif GetItemTypeId(it) == 'I06P' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_ATTACK, 300)
            set a = GetItemAbility(it, 'A055')
            call SetAbilityLevel(a, 3)
        endif
        if GetItemTypeId(it) == 'I007' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I06O') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I06O'))
                call UnitAddItemByIdSwapped('I06P', u)
            elseif UnitHasItemOfTypeBJ(u, 'I06N') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I06N'))
                call UnitAddItemByIdSwapped('I06O', u)
            elseif UnitHasItemOfTypeBJ(u, 'I02X') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02X'))
                call UnitAddItemByIdSwapped('I06N', u)
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

        if GetItemTypeId(it) == 'I06N' then
            call UnitAddStat(u, - 20, - 20, - 20)
            call UnitAddBonus(u, BONUS_ATTACK, - 200)
        elseif GetItemTypeId(it) == 'I06O' then
            call UnitAddStat(u, - 25, - 25, - 25)
            call UnitAddBonus(u, BONUS_ATTACK, - 250)
        elseif GetItemTypeId(it) == 'I06P' then
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