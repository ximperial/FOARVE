scope specialitem initializer init
    
    private function heroItem takes unit u returns nothing
        local ability a

        if GetUnitTypeId(u) == 'H0EQ' then 
            call UnitAddItemByIdSwapped('I01F', u)
        elseif GetUnitTypeId(u) == 'H0B4' then 
            call UnitAddItemByIdSwapped('I04E', u)
        elseif GetUnitTypeId(u) == 'H0EG' then 
            call UnitAddItemByIdSwapped('I059', u)
        elseif GetUnitTypeId(u) == 'H0FC' then 
            call UnitAddItemByIdSwapped('I05A', u)
        elseif GetUnitTypeId(u) == 'H05G' then 
            call UnitAddItemByIdSwapped('I00A', u)
        elseif GetUnitTypeId(u) == 'H02Q' then 
            call UnitAddItemByIdSwapped('I00J', u)
        elseif GetUnitTypeId(u) == 'H07C' then 
            call UnitAddItemByIdSwapped('I03W', u)
        elseif GetUnitTypeId(u) == 'H0CX' then 
            call UnitAddItemByIdSwapped('I00Q', u)
        elseif GetUnitTypeId(u) == 'H0D2' then 
            call UnitAddItemByIdSwapped('I00Z', u)
        elseif GetUnitTypeId(u) == 'H0D1' then 
            call UnitAddItemByIdSwapped('I00U', u)
        elseif GetUnitTypeId(u) == 'H03A' then 
            call UnitAddItemByIdSwapped('I00F', u)
        elseif GetUnitTypeId(u) == 'H030' then 
            call UnitAddItemByIdSwapped('I00D', u)
        elseif GetUnitTypeId(u) == 'H0AN' then 
            call UnitAddItemByIdSwapped('I04D', u)
        elseif GetUnitTypeId(u) == 'H0BM' then 
            call UnitAddItemByIdSwapped('I04F', u)
        elseif GetUnitTypeId(u) == 'H0D0' then 
            call UnitAddItemByIdSwapped('I00T', u)
        elseif GetUnitTypeId(u) == 'H0CU' then 
            call UnitAddItemByIdSwapped('I00O', u)
        elseif GetUnitTypeId(u) == 'H04R' then 
            call UnitAddItemByIdSwapped('I00L', u)
        elseif GetUnitTypeId(u) == 'H0FS' then 
            call UnitAddItemByIdSwapped('I05B', u)
        elseif GetUnitTypeId(u) == 'H01Z' then 
            call UnitAddItemByIdSwapped('I03Y', u)
        elseif GetUnitTypeId(u) == 'H063' then 
            call UnitAddItemByIdSwapped('I03V', u)
        elseif GetUnitTypeId(u) == 'H046' then 
            call UnitAddItemByIdSwapped('I00V', u)
        elseif GetUnitTypeId(u) == 'H01L' or GetUnitTypeId(u) == 'H01M' then 
            call UnitAddItemByIdSwapped('I010', u)
        elseif GetUnitTypeId(u) == 'H0CT' then 
            call UnitAddItemByIdSwapped('I00N', u)
        elseif GetUnitTypeId(u) == 'H04M' then 
            call UnitAddItemByIdSwapped('I00K', u)
        elseif GetUnitTypeId(u) == 'H05R' then 
            call UnitAddItemByIdSwapped('I03U', u)
        elseif GetUnitTypeId(u) == 'H0CY' then 
            call UnitAddItemByIdSwapped('I00R', u)
        elseif GetUnitTypeId(u) == 'H0D3' then 
            call UnitAddItemByIdSwapped('I011', u)
        elseif GetUnitTypeId(u) == 'H0CZ' then 
            call UnitAddItemByIdSwapped('I00S', u)
        elseif GetUnitTypeId(u) == 'H02L' then 
            call UnitAddItemByIdSwapped('I00B', u)
        elseif GetUnitTypeId(u) == 'H0CA' then 
            call UnitAddItemByIdSwapped('I04G', u)
        elseif GetUnitTypeId(u) == 'H0CW' then 
            call UnitAddItemByIdSwapped('I00P', u)
        elseif GetUnitTypeId(u) == 'H02E' then 
            call UnitAddItemByIdSwapped('I00C', u)
        elseif GetUnitTypeId(u) == 'H029' then 
            call UnitAddItemByIdSwapped('I009', u)
        elseif GetUnitTypeId(u) == 'H0A1' then 
            call UnitAddItemByIdSwapped('I048', u)
        elseif GetUnitTypeId(u) == 'H09Y' then 
            call UnitAddItemByIdSwapped('I045', u)
        elseif GetUnitTypeId(u) == 'H042' then 
            call UnitAddItemByIdSwapped('I00H', u)
        elseif GetUnitTypeId(u) == 'H03B' or GetUnitTypeId(u) == 'H0CS' then 
            call UnitAddItemByIdSwapped('I00I', u)
        elseif GetUnitTypeId(u) == 'H02V' then 
            call UnitAddItemByIdSwapped('I00G', u)
        elseif GetUnitTypeId(u) == 'H03E' then 
            call UnitAddItemByIdSwapped('I03H', u)
        elseif GetUnitTypeId(u) == 'H05Z' then 
            call UnitAddItemByIdSwapped('I03K', u)
        elseif GetUnitTypeId(u) == 'H0CN' then 
            call UnitAddItemByIdSwapped('I03L', u)
        elseif GetUnitTypeId(u) == 'H0CP' then 
            call UnitAddItemByIdSwapped('I03M', u)
        elseif GetUnitTypeId(u) == 'H0CQ' then 
            call UnitAddItemByIdSwapped('I03N', u)
        elseif GetUnitTypeId(u) == 'H0CR' then 
            call UnitAddItemByIdSwapped('I047', u)
        elseif GetUnitTypeId(u) == 'H0CV' then 
            call UnitAddItemByIdSwapped('I049', u)
        elseif GetUnitTypeId(u) == 'H0D4' then 
            call UnitAddItemByIdSwapped('I04A', u)
        elseif GetUnitTypeId(u) == 'H0D5' then 
            call UnitAddItemByIdSwapped('I04B', u)
        elseif GetUnitTypeId(u) == 'H0D6' then 
            call UnitAddItemByIdSwapped('I050', u)
        elseif GetUnitTypeId(u) == 'H0DH' then 
            call UnitAddItemByIdSwapped('I052', u)
        elseif GetUnitTypeId(u) == 'H0EF' then 
            call UnitAddItemByIdSwapped('I053', u)
        elseif GetUnitTypeId(u) == 'H0FU' or GetUnitTypeId(u) == 'H0FV' then 
            call UnitAddItemByIdSwapped('I054', u)
        elseif GetUnitTypeId(u) == 'H0FX' then 
            call UnitAddItemByIdSwapped('I05K', u)
            call UnitAddAbility(u, 'A0I3')
            call UnitMakeAbilityPermanent(u, true, 'A0I3')
            set a = GetUnitAbility(u, 'A0I3')
            call DisableAbility(a, true, true)
        elseif GetUnitTypeId(u) == 'H0FY' then 
            call UnitAddItemByIdSwapped('I05L', u)
        elseif GetUnitTypeId(u) == 'H0G0' then 
            call UnitAddItemByIdSwapped('I05M', u)
        elseif GetUnitTypeId(u) == 'H0G1' then 
            call UnitAddItemByIdSwapped('I05N', u)
        elseif GetUnitTypeId(u) == 'H0G2' then 
            call UnitAddItemByIdSwapped('I05O', u)
        elseif GetUnitTypeId(u) == 'H0G3' then 
            call UnitAddItemByIdSwapped('I05P', u)
        elseif GetUnitTypeId(u) == 'H001' then 
            call UnitAddItemByIdSwapped('I04V', u)
        elseif GetUnitTypeId(u) == 'H002' then 
            call UnitAddItemByIdSwapped('I051', u)
        elseif GetUnitTypeId(u) == 'H003' then 
            call UnitAddItemByIdSwapped('I055', u)
        elseif GetUnitTypeId(u) == 'H004' then 
            call UnitAddItemByIdSwapped('I056', u)
        elseif GetUnitTypeId(u) == 'H005' then 
            call UnitAddItemByIdSwapped('I05I', u)
        elseif GetUnitTypeId(u) == 'H007' then 
            call UnitAddItemByIdSwapped('I05T', u)
        elseif GetUnitTypeId(u) == 'H008' then 
            call UnitAddItemByIdSwapped('I067', u)
        elseif GetUnitTypeId(u) == 'H009' then 
            call UnitAddItemByIdSwapped('I06C', u)
        elseif GetUnitTypeId(u) == 'H00B' then 
            call UnitAddItemByIdSwapped('I06D', u)
        elseif GetUnitTypeId(u) == 'H00C' then 
            call UnitAddItemByIdSwapped('I06E', u)
        elseif GetUnitTypeId(u) == 'H00E' then 
            call UnitAddItemByIdSwapped('I06F', u)
        elseif GetUnitTypeId(u) == 'H00G' then 
            call UnitAddItemByIdSwapped('I06G', u)
        elseif GetUnitTypeId(u) == 'H00H' then 
            call UnitAddItemByIdSwapped('I06H', u)
        elseif GetUnitTypeId(u) == 'H00I' then 
            call UnitAddItemByIdSwapped('I072', u)
        elseif GetUnitTypeId(u) == 'H00J' then 
            call UnitAddItemByIdSwapped('I073', u)
        elseif GetUnitTypeId(u) == 'H00K' then 
            call UnitAddItemByIdSwapped('I074', u)
        elseif GetUnitTypeId(u) == 'H00P' then 
            call UnitAddItemByIdSwapped('I02A', u)
        elseif GetUnitTypeId(u) == 'H00M' then 
            call UnitAddItemByIdSwapped('I03R', u)
        elseif GetUnitTypeId(u) == 'H00Q' then 
            call UnitAddItemByIdSwapped('I03Z', u)
        elseif GetUnitTypeId(u) == 'H00R' then 
            call UnitAddItemByIdSwapped('I04W', u)
            call UnitAddAbility(u, 'A0H2')
            call UnitMakeAbilityPermanent(u, true, 'A0H2')
            set a = GetUnitAbility(u, 'A0H2')
            call DisableAbility(a, true, true)
        elseif GetUnitTypeId(u) == 'H00T' then 
            call UnitAddItemByIdSwapped('I05E', u)
        elseif GetUnitTypeId(u) == 'H00N' then 
            call UnitAddItemByIdSwapped('I003', u)
        elseif GetUnitTypeId(u) == 'H00U' then 
            call UnitAddItemByIdSwapped('I006', u)
        elseif GetUnitTypeId(u) == 'H00V' then 
            call UnitAddItemByIdSwapped('I00W', u)
        elseif GetUnitTypeId(u) == 'H00W' then 
            call UnitAddItemByIdSwapped('I014', u)
        elseif GetUnitTypeId(u) == 'H00X' then 
            call UnitAddItemByIdSwapped('I01E', u)
        elseif GetUnitTypeId(u) == 'H00Y' then 
            call UnitAddItemByIdSwapped('I01G', u)
        elseif GetUnitTypeId(u) == 'H00Z' then 
            call UnitAddItemByIdSwapped('I01I', u)
        elseif GetUnitTypeId(u) == 'H011' then 
            call UnitAddItemByIdSwapped('I01J', u)
        elseif GetUnitTypeId(u) == 'H010' then 
            call UnitAddItemByIdSwapped('I01M', u)
        elseif GetUnitTypeId(u) == 'H00F' then 
            call UnitAddItemByIdSwapped('I00Y', u)
        endif
        call SetItemDroppable(bj_lastCreatedItem, false)

        set a = null
    endfunction
    private function action takes nothing returns nothing
        local unit u = GetManipulatingUnit()
        local item it = GetManipulatedItem()
        local ability a
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local integer i
        local integer abilId

        if GetItemTypeId(it) == 'I024' then
            call RemoveItem(it)
            if LoadInteger(ht, StringHash("specialitem"), GetHandleId(u)) == 0 then
                call SaveInteger(ht, StringHash("specialitem"), GetHandleId(u), 1)
                if GetRandomInt(1, 2) == 1 then
                    call SoundStartPlayer(HeroVoice2[MemoHero[pid]], GetOwningPlayer(u), true)
                else
                    call SoundStartPlayer(HeroVoice3[MemoHero[pid]], GetOwningPlayer(u), true)
                endif
                if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_STR then
                    call UnitAddStat(u, 80, 30, 30)
                elseif GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_INT then
                    call UnitAddStat(u, 30, 80, 30)
                else
                    call UnitAddStat(u, 30, 30, 80)
                endif
                call Effect("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("Abilities\\Spells\\Other\\Awaken\\Awaken.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 5) 
                set a = GetUnitAbility(u, abilId)
                call EnableAbility(a, true, true)
                set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 6)
                set a = GetUnitAbility(u, abilId)
                call EnableAbility(a, true, true)
                call heroItem(u)
            else
                call AdjustPlayerStateBJ(10000, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD)
            endif
        endif

        set u = null
        set it = null
        set a = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, function action)
    endfunction
endscope