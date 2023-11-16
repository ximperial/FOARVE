library gpm uses Utilities

    globals
        private boolean isActive = false
    endglobals

    private function gpmPeriod takes nothing returns nothing
        local integer i = 0 
        
        loop
            exitwhen i > 11
            if UserPlayer(Player(i)) then
                call AdjustPlayerStateBJ(1, Player(i), PLAYER_STATE_RESOURCE_GOLD)
            endif
            set i = i + 1
        endloop
    endfunction

    function RunGPM takes nothing returns nothing
        if not isActive then
            set isActive = true
            call TimerStart(CreateTimer(), 0.6, true, function gpmPeriod)
        endif
    endfunction
endlibrary