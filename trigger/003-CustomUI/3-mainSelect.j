scope mainSelect initializer init

    globals
        unit array MainUnit
    endglobals

    private function dataSelected takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetTriggerPlayer()
        local framehandle pFrame
        local integer pid = GetPlayerId(p)
        local integer pid2 = GetPlayerId(GetOwningPlayer(u))
        local integer i
        
        if MainUnit[pid] != u then
            set MainUnit[pid] = u
            set pFrame = GetFrameByName("MainPhotoFrame", 0)
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame, HeroPhoto3[MemoHero[pid2]], 0, false)
            endif
        endif

        set u = null
        set p = null
        set pFrame = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SELECTED, function dataSelected)
    endfunction
endscope