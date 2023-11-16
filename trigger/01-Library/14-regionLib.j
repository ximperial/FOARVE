scope regionLib initializer init

    globals
        region topLane = null
        region topLane1 = null
        region topLane2 = null
        region midLane = null
        region midLane1 = null
        region midLane2 = null
        region bottomLane = null
        region bottomLane1 = null
        region bottomLane2 = null
    endglobals

    private function enterTop takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)
        local region reg = GetTriggeringRegion()

        if reg == topLane then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 1)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_TopTeam2) , GetRectCenterY(gg_rct_TopTeam2))
                elseif p == Player(6) then
                    call setUnitData(u, 1)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_TopTeam1) , GetRectCenterY(gg_rct_TopTeam1))
                endif
            endif
        elseif reg == topLane1 then
            if IsUnitAlive(u) then
                if p == Player(6) then
                    call setUnitData(u, 2)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                endif
            endif
        elseif reg == topLane2 then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 2)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                endif
            endif
        endif
        
        set u = null
        set p = null
        set reg = null
    endfunction

    private function enterMid takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)
        local region reg = GetTriggeringRegion()

        if reg == midLane then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 3)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidTeam2) , GetRectCenterY(gg_rct_MidTeam2))
                elseif p == Player(6) then
                    call setUnitData(u, 3)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidTeam1) , GetRectCenterY(gg_rct_MidTeam1))
                endif
            endif
        elseif reg == midLane1 then
            if IsUnitAlive(u) then
                if p == Player(6) then
                    call setUnitData(u, 4)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                endif
            endif
        elseif reg == midLane2 then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 4)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                endif
            endif
        endif

        set u = null
        set p = null
        set reg = null
    endfunction

    private function enterBottom takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)
        local region reg = GetTriggeringRegion()

        if reg == bottomLane then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 5)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomTeam2) , GetRectCenterY(gg_rct_BottomTeam2))
                elseif p == Player(6) then
                    call setUnitData(u, 5)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomTeam1) , GetRectCenterY(gg_rct_BottomTeam1))
                endif
            endif
        elseif reg == bottomLane1 then
            if IsUnitAlive(u) then
                if p == Player(6) then
                    call setUnitData(u, 6)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                endif
            endif
        elseif reg == bottomLane2 then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 6)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                endif
            endif
        endif

        set u = null
        set p = null
        set reg = null
    endfunction
    
    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()

        set topLane = CreateRegion()
        call RegionAddRect(topLane, gg_rct_Top)
        set topLane1 = CreateRegion()
        call RegionAddRect(topLane1, gg_rct_TopTeam1)
        set topLane2 = CreateRegion()
        call RegionAddRect(topLane2, gg_rct_TopTeam2)
        set midLane = CreateRegion()
        call RegionAddRect(midLane, gg_rct_Mid)
        set midLane1 = CreateRegion()
        call RegionAddRect(midLane1, gg_rct_MidTeam1)
        set midLane2 = CreateRegion()
        call RegionAddRect(midLane2, gg_rct_MidTeam2)
        set bottomLane = CreateRegion()
        call RegionAddRect(bottomLane, gg_rct_Bottom)
        set bottomLane1 = CreateRegion()
        call RegionAddRect(bottomLane1, gg_rct_Bottom)
        set bottomLane2 = CreateRegion()
        call RegionAddRect(bottomLane2, gg_rct_Bottom)
        set t = CreateTrigger()
        call TriggerRegisterEnterRegion(t, topLane, null)
        call TriggerRegisterEnterRegion(t, topLane1, null)
        call TriggerRegisterEnterRegion(t, topLane2, null)
        call TriggerAddAction(t, function enterTop)
        set t = CreateTrigger()
        call TriggerRegisterEnterRegion(t, midLane, null)
        call TriggerRegisterEnterRegion(t, midLane1, null)
        call TriggerRegisterEnterRegion(t, midLane2, null)
        call TriggerAddAction(t, function enterMid)
        set t = CreateTrigger()
        call TriggerRegisterEnterRegion(t, bottomLane, null)
        call TriggerRegisterEnterRegion(t, bottomLane1, null)
        call TriggerRegisterEnterRegion(t, bottomLane2, null)
        call TriggerAddAction(t, function enterBottom)

        set t = null
    endfunction
endscope