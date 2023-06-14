scope bootspeed initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I000' then
            call UnitAddStat(u, 3, 3, 3)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.05)
            endif
        elseif GetItemTypeId(it) == 'I002' then
            call UnitAddStat(u, 6, 6, 6)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.10)
            endif
        elseif GetItemTypeId(it) == 'I01Y' then
            call UnitAddStat(u, 9, 9, 9)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.15)
            endif
        elseif GetItemTypeId(it) == 'I01Z' then
            call UnitAddStat(u, 12, 12, 12)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.20)
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
                call AdjustPlayerStateBJ(400, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif

        set u = null
        set it = null
    endfunction
    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I000' then
            call UnitAddStat(u, - 3, - 3, - 3)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.05)
            endif
        elseif GetItemTypeId(it) == 'I002' then
            call UnitAddStat(u, - 6, - 6, - 6)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.10)
            endif
        elseif GetItemTypeId(it) == 'I01Y' then
            call UnitAddStat(u, - 9, - 9, - 9)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.15)
            endif
        elseif GetItemTypeId(it) == 'I01Z' then
            call UnitAddStat(u, - 12, - 12, - 12)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
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