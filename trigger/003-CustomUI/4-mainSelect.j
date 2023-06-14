scope mainSelect initializer init

    globals
        unit array MainUnit
        private boolean array ShopActive
        private string array shopText
    endglobals

    private function dataSelected takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetTriggerPlayer()
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        local string s = ""
        local string s2 = ""
        local integer pid = GetPlayerId(p)
        local integer pid2 = GetPlayerId(GetOwningPlayer(u))
        local integer i
        
        if MainUnit[pid] != u then
            set MainUnit[pid] = u
            set pFrame = GetFrameByName("StatPortrait", 0)
            set s = HeroPhoto3[MemoHero[pid2]]
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame, s, 0, true)
            endif
        endif
    
        if IsUnitInRange(MainHero[pid], u, 1200) and (GetUnitTypeId(u) == 'n00C' or GetUnitTypeId(u) == 'n009' or GetUnitTypeId(u) == 'n00B' or GetUnitTypeId(u) == 'n004' or GetUnitTypeId(u) == 'n006') then
            set ShopActive[pid] = true
        else
            set pFrame = CommandButtonUI[0]
            if GetLocalPlayer() == p and ShopActive[pid] then
                call ClearFrameAllPoints(pFrame)
                call SetFrameAbsolutePoint(pFrame, FRAMEPOINT_CENTER, 10.0, 10.0)
            endif
            set pFrame = CommandButtonUI[3]
            if GetLocalPlayer() == p and ShopActive[pid] then
                call ClearFrameAllPoints(pFrame)
                call SetFrameAbsolutePoint(pFrame, FRAMEPOINT_CENTER, 10.0, 10.0)
            endif
            set pFrame = CommandButtonUI[6]
            if GetLocalPlayer() == p and ShopActive[pid] then
                call ClearFrameAllPoints(pFrame)
                call SetFrameAbsolutePoint(pFrame, FRAMEPOINT_CENTER, 10.0, 10.0)
            endif
            set pFrame = CommandButtonUI[9]
            if GetLocalPlayer() == p and ShopActive[pid] then
                call ClearFrameAllPoints(pFrame)
                call SetFrameAbsolutePoint(pFrame, FRAMEPOINT_CENTER, 10.0, 10.0)
            endif
            set pFrame = CommandButtonUI[1]
            if GetLocalPlayer() == p and ShopActive[pid] then
                call ClearFrameAllPoints(pFrame)
                call SetFrameAbsolutePoint(pFrame, FRAMEPOINT_CENTER, 10.0, 10.0)
            endif
        
            set pFrame = GetFrameByName("SpellBordir", 0)
            set pFrame2 = CommandButtonUI[2]
            if GetLocalPlayer() == p and ShopActive[pid] and IsFrameVisible(pFrame) then
                call ClearFrameAllPoints(pFrame2)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
            endif
            set pFrame = GetFrameByName("SpellBordir", 1)
            set pFrame2 = CommandButtonUI[5]
            if GetLocalPlayer() == p and ShopActive[pid] and IsFrameVisible(pFrame) then
                call ClearFrameAllPoints(pFrame2)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
            endif
            set pFrame = GetFrameByName("SpellBordir", 2)
            set pFrame2 = CommandButtonUI[8]
            if GetLocalPlayer() == p and ShopActive[pid] and IsFrameVisible(pFrame) then
                call ClearFrameAllPoints(pFrame2)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
            endif
            set pFrame = GetFrameByName("SpellBordir", 3)
            set pFrame2 = CommandButtonUI[11]
            if GetLocalPlayer() == p and ShopActive[pid] and IsFrameVisible(pFrame) then
                call ClearFrameAllPoints(pFrame2)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
            endif
            set pFrame = GetFrameByName("SpellBordir", 4)
            set pFrame2 = CommandButtonUI[10]
            if GetLocalPlayer() == p and ShopActive[pid] and IsFrameVisible(pFrame) then
                call ClearFrameAllPoints(pFrame2)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
            endif
            set pFrame = GetFrameByName("SpellBordir", 5)
            set pFrame2 = CommandButtonUI[7]
            if GetLocalPlayer() == p and ShopActive[pid] and IsFrameVisible(pFrame) then
                call ClearFrameAllPoints(pFrame2)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
            endif
            set pFrame = GetFrameByName("SpellBordir", 6)
            set pFrame2 = CommandButtonUI[4]
            if GetLocalPlayer() == p and ShopActive[pid] and IsFrameVisible(pFrame) then
                call ClearFrameAllPoints(pFrame2)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
            endif
        
            set ShopActive[pid] = false
        endif

        set u = null
        set p = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
    endfunction

    private function init takes nothing returns nothing
        set shopText[0] = "|cffFFD600" + "1"
        set shopText[1] = "|cffFFD600" + "5"
        set shopText[2] = "|cffFFD600" + "9"
        set shopText[3] = "|cffFFD600" + "2"
        set shopText[4] = "|cffFFD600" + "6"
        set shopText[5] = "|cffFFD600" + "10"
        set shopText[6] = "|cffFFD600" + "3"
        set shopText[7] = "|cffFFD600" + "7"
        set shopText[8] = "|cffFFD600" + "11"
        set shopText[9] = "|cffFFD600" + "4"
        set shopText[10] = "|cffFFD600" + "8"
        set shopText[11] = "|cffFFD600" + "12"
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SELECTED, function dataSelected)
    endfunction
endscope