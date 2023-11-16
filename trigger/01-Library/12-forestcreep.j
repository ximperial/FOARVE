scope forestcreep initializer init 

    globals
        private unit array creep
        private real array creepX 
        private real array creepY
        private integer index = 0
    endglobals

    private function action takes unit u returns nothing
        if GetUnitTypeId(u) == 'ndqn' then
            set creep[index] = u
            set creepX[index] = GetUnitX(u)
            set creepY[index] = GetUnitY(u)
            set index = index + 1
        endif
    endfunction

    private function respawn takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local integer id = LoadInteger(ht, zid, 0)

        set creep[id] = CreateUnit(Player(12), 'ndqn', creepX[id], creepY[id], randomAngle())
        call FlushChildHashtable(ht, zid)
        call PauseTimer(z)
        call DestroyTimer(z)

        set z = null
    endfunction

    private function action2 takes nothing returns nothing
        local timer z
        local unit t = GetTriggerUnit()
        local integer i

        if GetUnitTypeId(t) == 'ndqn' then
            set i = 0
            loop
                exitwhen i == index
                if t == creep[i] then
                    set z = CreateTimer()
                    call SaveInteger(ht, GetHandleId(z), 0, i)
                    call TimerStart(z, 90, false, function respawn)
                    exitwhen true
                endif
                set i = i + 1
            endloop
        endif

        set z = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call GroupEnumUnitsOfPlayer(gGroup, Player(12), null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            call action(gUnit)
        endloop
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DEATH, function action2)
    endfunction
endscope