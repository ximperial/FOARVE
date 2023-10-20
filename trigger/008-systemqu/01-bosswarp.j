scope bosswarp initializer init
    private function action takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)
        call GroupEnumUnitsSelected(gGroup, p, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            call SetUnitBoundXY(gUnit, gg_rct_Boss_Warp, true)
        endloop
        call GroupClear(gGroup)
        set p = null
    endfunction

    globals
        trigger bosswarp = null
    endglobals

    private function init takes nothing returns nothing
        set bosswarp = CreateTrigger()
        call DisableTrigger(bosswarp)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(1), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(2), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(3), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(5), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(6), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(7), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(9), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(10), "-wrap", false)
        call TriggerRegisterPlayerChatEvent(bosswarp, Player(11), "-wrap", false)
        call TriggerAddAction(bosswarp, function action)
    endfunction
endscope