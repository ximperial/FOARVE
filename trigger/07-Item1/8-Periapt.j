scope Periapt initializer init

    globals
        private integer array piece
        private integer array piece2
    endglobals

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local integer userid = GetUnitUserData(u)

        if GetItemTypeId(it) == 'I00I' then
            call UnitAddStat(u, 10, 10, 10)
        elseif GetItemTypeId(it) == 'I00J' then
            call UnitAddStat(u, 20, 20, 20)
        elseif GetItemTypeId(it) == 'I00N' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_MANA, 200)
            set piece[userid] = piece[userid] + 1
            if piece[userid] == 1 then
                set AbilityHaste[userid] = AbilityHaste[userid] + 10
            endif
        elseif GetItemTypeId(it) == 'I00P' or GetItemTypeId(it) == 'I00R' then
            call UnitAddStat(u, 30, 30, 30)
        elseif GetItemTypeId(it) == 'I00V' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_HEALTH, 200)
            set piece2[userid] = piece2[userid] + 1
            if piece2[userid] == 1 then
                set CritResist[userid] = CritResist[userid] + 0.15
            endif
        endif
        if GetItemTypeId(it) == 'I00U' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I00J') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I00J'))
                call UnitAddItemByIdSwapped('I00V', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I00Q' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I00J') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I00J'))
                call UnitAddItemByIdSwapped('I00R', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I00O' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I00J') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I00J'))
                call UnitAddItemByIdSwapped('I00P', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I00L' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I00J') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I00J'))
                call UnitAddItemByIdSwapped('I00N', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I00K' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I00I') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I00I'))
                call UnitAddItemByIdSwapped('I00J', u)
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
        local integer userid = GetUnitUserData(u)

        if GetItemTypeId(it) == 'I00I' then
            call UnitAddStat(u, -10, -10, -10)
        elseif GetItemTypeId(it) == 'I00J' then
            call UnitAddStat(u, -20, -20, -20)
        elseif GetItemTypeId(it) == 'I00N' then
            call UnitAddStat(u, -30, -30, -30)
            call UnitAddBonus(u, BONUS_MANA, -200)
            set piece[userid] = piece[userid] - 1
            if piece[userid] == 0 then
                set AbilityHaste[userid] = AbilityHaste[userid] - 10
            endif
        elseif GetItemTypeId(it) == 'I00P' or GetItemTypeId(it) == 'I00R' then
            call UnitAddStat(u, -30, -30, -30)
        elseif GetItemTypeId(it) == 'I00V' then
            call UnitAddStat(u, -30, -30, -30)
            call UnitAddBonus(u, BONUS_HEALTH, -200)
            set piece2[userid] = piece2[userid] - 1
            if piece2[userid] == 0 then
                set CritResist[userid] = CritResist[userid] - 0.15
            endif
        endif

        set u = null
        set it = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function pickItem)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, function dropItem)
    endfunction
endscope