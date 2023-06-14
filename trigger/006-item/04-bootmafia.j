scope bootmafia initializer init

    private function pickItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a

        if GetItemTypeId(it) == 'I036' then
            call UnitAddStat(u, 15, 15, 15)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.25)
            endif
        elseif GetItemTypeId(it) == 'I043' then
            call UnitAddStat(u, 25, 25, 25)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 1 then
                call UnitAddBonus(u, BONUS_MOVESPEED, 0.30)
            endif
            set a = GetItemAbility(it, 'A018')
            call SetAbilityRealLevelField(a, ABILITY_RLF_COOLDOWN, 0, 25)
        endif
        if GetItemTypeId(it) == 'I02R' then
            call RemoveItem(it)
            if UnitHasItemOfTypeBJ(u, 'I036') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I036'))
                call UnitAddItemByIdSwapped('I043', u)
            elseif UnitHasItemOfTypeBJ(u, 'I01Z') then
                call Effect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call RemoveItem(GetItemOfTypeFromUnitBJ(u, 'I01Z'))
                call UnitAddItemByIdSwapped('I036', u)
            else
                call AdjustPlayerStateBJ(1200, GetOwningPlayer(u) , PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif

        set u = null
        set it = null
        set a = null
    endfunction

    private function dropItem takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()

        if GetItemTypeId(it) == 'I036' then
            call UnitAddStat(u, - 15, - 15, - 15)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.25)
            endif
        elseif GetItemTypeId(it) == 'I043' then
            call UnitAddStat(u, - 25, - 25, - 25)
            call SaveInteger(ht, StringHash("boot"), GetHandleId(u), LoadInteger(ht, StringHash("boot"), GetHandleId(u)) - 1)
            if LoadInteger(ht, StringHash("boot"), GetHandleId(u)) == 0 then
                call UnitAddBonus(u, BONUS_MOVESPEED, - 0.30)
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