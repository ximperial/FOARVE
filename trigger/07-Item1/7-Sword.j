scope Sword initializer init

    globals
        private integer array piece
        private integer array piece2
    endglobals

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local integer userid = GetUnitUserData(u)

        if GetItemTypeId(it) == 'I02V' then
            call UnitAddStat(u, 10, 10, 10)
        elseif GetItemTypeId(it) == 'I02W' then
            call UnitAddStat(u, 20, 20, 20)
        elseif GetItemTypeId(it) == 'I01Q' or GetItemTypeId(it) == 'I02T' then
            call UnitAddStat(u, 30, 30, 30)
        elseif GetItemTypeId(it) == 'I06N' then
            call UnitAddStat(u, 30, 30, 30)
            call UnitAddBonus(u, BONUS_HEALTH, 200)
            set piece[userid] = piece[userid] + 1
            if piece[userid] == 1 then
                set OmniVamp[userid] = OmniVamp[userid] + 0.15
            endif
        elseif GetItemTypeId(it) == 'I00T' then
            call UnitAddStat(u, 30, 30, 30)
            set piece2[userid] = piece2[userid] + 1
            if piece2[userid] == 1 then
                set CritRATE[userid] = CritRATE[userid] + 12
                set CritDMG[userid] = CritDMG[userid] + 0.18
            endif
        endif
        if GetItemTypeId(it) == 'I00S' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02W') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02W'))
                call UnitAddItemByIdSwapped('I00T', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I007' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02W') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02W'))
                call UnitAddItemByIdSwapped('I06N', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I00M' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02W') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02W'))
                call UnitAddItemByIdSwapped('I02T', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I005' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02W') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02W'))
                call UnitAddItemByIdSwapped('I01Q', u)
            else
                call AdjustPlayerStateBJ(2000, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        if GetItemTypeId(it) == 'I013' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I02V') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I02V'))
                call UnitAddItemByIdSwapped('I02W', u)
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

        if GetItemTypeId(it) == 'I02V' then
            call UnitAddStat(u, - 10, - 10, - 10)
        elseif GetItemTypeId(it) == 'I02W' then
            call UnitAddStat(u, - 20, - 20, - 20)
        elseif GetItemTypeId(it) == 'I01Q' or GetItemTypeId(it) == 'I02T' then
            call UnitAddStat(u, - 30, - 30, - 30)
        elseif GetItemTypeId(it) == 'I06N' then
            call UnitAddStat(u, - 30, - 30, - 30)
            call UnitAddBonus(u, BONUS_HEALTH, -200)
            set piece[userid] = piece[userid] - 1
            if piece[userid] == 0 then
                set OmniVamp[userid] = OmniVamp[userid] - 0.15
            endif
        elseif GetItemTypeId(it) == 'I00T' then
            call UnitAddStat(u, - 30, - 30, - 30)
            set piece2[userid] = piece2[userid] - 1
            if piece2[userid] == 0 then
                set CritRATE[userid] = CritRATE[userid] - 12
                set CritDMG[userid] = CritDMG[userid] - 0.18
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