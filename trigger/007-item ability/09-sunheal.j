scope sunheal initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local real heal

        if GetSpellAbilityId() == 'A057' then
            if UnitHasItemOfTypeBJ(u, 'I04L') then
                set heal = 8 * GetHeroStr(u, true)
            elseif UnitHasItemOfTypeBJ(u, 'I02N') then
                set heal = 7 * GetHeroStr(u, true)
            else
                set heal = 6 * GetHeroStr(u, true)
            endif
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1000, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlly(gUnit, GetOwningPlayer(u)) and IsUnitAlive(gUnit) and not IsUnitTower(gUnit) then
                    call Effect("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call SetUnitCurrentLife(gUnit, GetUnitCurrentLife(gUnit) + heal)
                endif
            endloop
            call GroupClear(gGroup)
        endif

        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope