scope mainSelect initializer init

    globals
        unit array MainUnit
    endglobals

    private function dataSelected takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)
        local integer pid2 = GetPlayerId(GetOwningPlayer(u))
        local framehandle frame1
        local framehandle frame2
        local framehandle frame3
        local integer i
        
        if MainUnit[pid] != u then
            set MainUnit[pid] = u
            set frame1 = GetFrameByName("PhotoFrame", 0)
            if GetLocalPlayer() == p then
                call SetFrameTexture(frame1, HeroPhoto[MemoHero[pid2]], 0, false)
            endif
        endif
        set frame1 = GetFrameByName("ShopMainBorder", 0)
        set frame2 = GetFrameByName("ShopItemSprite", 0)
        set frame3 = GetFrameByName("ShopItemTip", 0)
        if IsUnitShop(u) then
            if GetLocalPlayer() == p and not IsFrameVisible(frame1) then
                call ShowFrame(frame1, true)
                call ShowFrame(frame2, false)
                call SetFrameText(frame3, "")
            endif
        else
            if GetLocalPlayer() == p and IsFrameVisible(frame1) then
                call ShowFrame(frame1, false)
                call ShowFrame(frame2, false)
                call SetFrameText(frame3, "")
            endif
        endif

        set u = null
        set p = null
        set frame1 = null
        set frame2 = null
        set frame3 = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SELECTED, function dataSelected)
    endfunction
endscope