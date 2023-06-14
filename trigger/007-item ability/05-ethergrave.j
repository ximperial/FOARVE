scope ethergrave initializer init

    private function action takes nothing returns nothing
        local unit u = GetKillingUnit()
        local unit t = GetTriggerUnit()

        if IsUnitHero(t) and (UnitHasItemOfTypeBJ(u, 'I01K') or UnitHasItemOfTypeBJ(u, 'I01L') or UnitHasItemOfTypeBJ(u, 'I04T')) then
            call GroupEnumUnitsInRect(gGroup, bj_mapInitialPlayableArea, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlly(gUnit, GetOwningPlayer(t)) and IsUnitAlive(gUnit) and IsUnitHero(gUnit) then
                    call VisionArea(GetOwningPlayer(u), 1000, 4, GetUnitX(gUnit), GetUnitY(gUnit))
                endif
            endloop
            call GroupClear(gGroup)
        endif

        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DEATH, function action)
    endfunction
endscope