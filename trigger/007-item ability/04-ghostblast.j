scope ghostblast initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()

        if GetSpellAbilityId() == 'A00F' then
            call Effect("war3mapImported\\Nature Blast - Classic.mdl", GetUnitX(u), GetUnitY(u), 50, GetUnitFacing(u), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call disarmUnit(gUnit, 5)
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