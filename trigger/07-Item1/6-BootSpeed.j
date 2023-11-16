scope BootSpeed initializer init

    globals
        private integer array piece
    endglobals

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local integer userid = GetUnitUserData(u)

        if GetItemTypeId(it) == 'I000' then
            call UnitAddStat(u, 3, 3, 3)
            set piece[userid] = piece[userid] + 1
            if piece[userid] == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.04)
            endif
        elseif GetItemTypeId(it) == 'I002' then
            call UnitAddStat(u, 6, 6, 6)
            set piece[userid] = piece[userid] + 1
            if piece[userid] == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.08)
            endif
        elseif GetItemTypeId(it) == 'I01Y' then
            call UnitAddStat(u, 9, 9, 9)
            set piece[userid] = piece[userid] + 1
            if piece[userid] == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.12)
            endif
        elseif GetItemTypeId(it) == 'I01Z' then
            call UnitAddStat(u, 12, 12, 12)
            set piece[userid] = piece[userid] + 1
            if piece[userid] == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.16)
            endif
        elseif GetItemTypeId(it) == 'I038' then
            call UnitAddStat(u, 15, 15, 15)
            set piece[userid] = piece[userid] + 1
            if piece[userid] == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.20)
            endif
        endif
        if GetItemTypeId(it) == 'I035' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I01Z') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01Z'))
                call UnitAddItemByIdSwapped('I038', u)
            else
                call AdjustPlayerStateBJ(600, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I001' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I01Y') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01Y'))
                call UnitAddItemByIdSwapped('I01Z', u)
            elseif UnitHasItemOfTypeBJ(u, 'I002') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I002'))
                call UnitAddItemByIdSwapped('I01Y', u)
            elseif UnitHasItemOfTypeBJ(u, 'I000') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I000'))
                call UnitAddItemByIdSwapped('I002', u)
            else
                call AdjustPlayerStateBJ(400, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif

        set u = null
        set it = null
    endfunction

    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local integer userid = GetUnitUserData(u)

        if GetItemTypeId(it) == 'I000' then
            call UnitAddStat(u, - 3, - 3, - 3)
            set piece[userid] = piece[userid] - 1
            if piece[userid] == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.04)
            endif
        elseif GetItemTypeId(it) == 'I002' then
            call UnitAddStat(u, - 6, - 6, - 6)
            set piece[userid] = piece[userid] - 1
            if piece[userid] == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.08)
            endif
        elseif GetItemTypeId(it) == 'I01Y' then
            call UnitAddStat(u, - 9, - 9, - 9)
            set piece[userid] = piece[userid] - 1
            if piece[userid] == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.12)
            endif
        elseif GetItemTypeId(it) == 'I01Z' then
            call UnitAddStat(u, - 12, - 12, - 12)
            set piece[userid] = piece[userid] - 1
            if piece[userid] == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.16)
            endif
        elseif GetItemTypeId(it) == 'I038' then
            call UnitAddStat(u, - 15, - 15, - 15)
            set piece[userid] = piece[userid] - 1
            if piece[userid] == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.20)
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