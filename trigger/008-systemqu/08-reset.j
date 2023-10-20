scope reset initializer init
    private function action takes nothing returns nothing
        local player p = GetTriggerPlayer()
        call GroupEnumUnitsSelected(gGroup, p, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            call AdjustPlayerStateBJ(1000000, GetOwningPlayer(gUnit), PLAYER_STATE_RESOURCE_GOLD)
            call SetHeroLevel(gUnit, 40, false)
            call SetWidgetLife(gUnit, 999999)
            call SetUnitState(gUnit, UNIT_STATE_MANA, 999999)
            call UnitResetCooldown(gUnit)
            call SetPlayerAllianceStateFullControlBJ(GetOwningPlayer(gUnit), p, true)
            call SetPlayerAllianceStateControlBJ(GetOwningPlayer(gUnit), p, true)
            call SetPlayerAllianceStateVisionBJ(GetOwningPlayer(gUnit), p, true)
        endloop
        call GroupClear(gGroup)
        set p = null
    endfunction

    globals
        trigger resetmode = null
    endglobals

    private function init takes nothing returns nothing
        set resetmode = CreateTrigger()
        call DisableTrigger(resetmode)
        call TriggerRegisterPlayerEventEndCinematic(resetmode, Player(1))
        call TriggerAddAction(resetmode, function action)
    endfunction
endscope