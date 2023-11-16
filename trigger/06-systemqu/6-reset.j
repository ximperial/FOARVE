scope reset initializer init
    private function action takes nothing returns nothing
        local player p = GetTriggerPlayer()
        call GroupEnumUnitsSelected(gGroup, p, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            call AdjustPlayerStateBJ(1000000, GetOwningPlayer(gUnit), PLAYER_STATE_RESOURCE_GOLD)
            call SetHeroLevel(gUnit, 40, false)
            call SetUnitCurrentLife(gUnit, GetUnitMaxLife(gUnit))
            call SetUnitCurrentMana(gUnit, GetUnitMaxMana(gUnit))
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