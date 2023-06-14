scope bootpirate initializer init
    
    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I038' then
            call UnitAddStat(u, 20, 20, 20)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.3)
            endif
        elseif GetItemTypeId(it) == 'I044' then
            call UnitAddStat(u, 35, 35, 35)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.35)
            endif
        endif
        if GetItemTypeId(it) == 'I035' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I038') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I038'))
                call UnitAddItemByIdSwapped('I044', u)
            elseif UnitHasItemOfTypeBJ(u, 'I01Z') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01Z'))
                call UnitAddItemByIdSwapped('I038', u)
            else
                call AdjustPlayerStateBJ(1200, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif
        
        set u = null
        set it = null
    endfunction

    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I038' then
            call UnitAddStat(u, - 20, - 20, - 20)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.3)
            endif
        elseif GetItemTypeId(it) == 'I044' then
            call UnitAddStat(u, - 35, - 35, - 35)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.35)
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