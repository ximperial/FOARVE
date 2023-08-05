scope regionLib initializer init

    globals
        region topLane = null
        region centerLane = null
        region centerLane1 = null
        region centerLane2 = null
        region centerLane3 = null
        region rightLane = null
        region rightLane1 = null
        region rightLane2 = null
        region leftLane = null
    endglobals

    private function enterTop takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)

        if IsUnitAlive(u) then
            if p == Player(0) then
                call setUnitData(u, 1)
                call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
            elseif p == Player(4) then
                call setUnitData(u, 1)
                call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
            endif
        endif
        
        set u = null
        set p = null
    endfunction

    private function enterCenter takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)
        local region reg = GetTriggeringRegion()

        if reg == centerLane then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 2)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam2_1) , GetRectCenterY(gg_rct_MidCTeam2_1))
                elseif p == Player(4) then
                    call setUnitData(u, 2)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam3_1) , GetRectCenterY(gg_rct_MidCTeam3_1))
                elseif p == Player(8) then
                    call setUnitData(u, 2)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam1_1) , GetRectCenterY(gg_rct_MidCTeam1_1))
                endif
            endif
        elseif reg == centerLane1 then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 5)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                elseif p == Player(8) then
                    call setUnitData(u, 5)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                endif
            endif
        elseif reg == centerLane2 then
            if IsUnitAlive(u) then
                if p == Player(0) then
                    call setUnitData(u, 6)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                elseif p == Player(4) then
                    call setUnitData(u, 6)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                endif
            endif
        elseif reg == centerLane3 then
            if IsUnitAlive(u) then
                if p == Player(4) then
                    call setUnitData(u, 7)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam3) , GetRectCenterY(gg_rct_BaseTeam3))
                elseif p == Player(8) then
                    call setUnitData(u, 7)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                endif
            endif
        endif

        set u = null
        set p = null
        set reg = null
    endfunction

    private function enterRight takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)
        local region reg = GetTriggeringRegion()

        if reg == rightLane then
            if IsUnitAlive(u) then
                if p == Player(4) then
                    call setUnitData(u, 3)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam3) , GetRectCenterY(gg_rct_BaseTeam3))
                elseif p == Player(8) then
                    call setUnitData(u, 3)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                endif
            endif
        elseif reg == rightLane1 then
            if IsUnitAlive(u) then
                if p == Player(4) then
                    call setUnitData(u, 8)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam3) , GetRectCenterY(gg_rct_BaseTeam3))
                elseif p == Player(8) then
                    call setUnitData(u, 8)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                endif
            endif
        elseif reg == rightLane2 then
            if IsUnitAlive(u) then
                if p == Player(4) then
                    call setUnitData(u, 9)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                elseif p == Player(8) then
                    call setUnitData(u, 9)
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                endif
            endif
        endif

        set u = null
        set p = null
        set reg = null
    endfunction

    private function enterleft takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)

        if IsUnitAlive(u) then
            if p == Player(0) then
                call setUnitData(u, 4)
                call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam3) , GetRectCenterY(gg_rct_BaseTeam3))
            elseif p == Player(8) then
                call setUnitData(u, 4)
                call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
            endif
        endif

        set u = null
        set p = null
    endfunction
    
    private function init takes nothing returns nothing
        local trigger t = CreateTrigger()

        set topLane = CreateRegion()
        call RegionAddRect(topLane, gg_rct_Top)
        set centerLane = CreateRegion()
        call RegionAddRect(centerLane, gg_rct_Center)
        set centerLane1 = CreateRegion()
        call RegionAddRect(centerLane1, gg_rct_MidCTeam1_1)
        set centerLane2 = CreateRegion()
        call RegionAddRect(centerLane2, gg_rct_MidCTeam2_1)
        set centerLane3 = CreateRegion()
        call RegionAddRect(centerLane3, gg_rct_MidCTeam3_1)
        set rightLane = CreateRegion()
        call RegionAddRect(rightLane, gg_rct_BottomRight)
        set rightLane1 = CreateRegion()
        call RegionAddRect(rightLane, gg_rct_RightCTeam3_1)
        set rightLane2 = CreateRegion()
        call RegionAddRect(rightLane, gg_rct_BottomCTeam2_1)
        set leftLane = CreateRegion()
        call RegionAddRect(leftLane, gg_rct_BottomLeft)
        set t = CreateTrigger()
        call TriggerRegisterEnterRegion(t, topLane, null)
        call TriggerAddAction(t, function enterTop)
        set t = CreateTrigger()
        call TriggerRegisterEnterRegion(t, centerLane, null)
        call TriggerRegisterEnterRegion(t, centerLane1, null)
        call TriggerRegisterEnterRegion(t, centerLane2, null)
        call TriggerRegisterEnterRegion(t, centerLane3, null)
        call TriggerAddAction(t, function enterCenter)
        set t = CreateTrigger()
        call TriggerRegisterEnterRegion(t, rightLane, null)
        call TriggerRegisterEnterRegion(t, rightLane1, null)
        call TriggerRegisterEnterRegion(t, rightLane2, null)
        call TriggerAddAction(t, function enterRight)
        set t = CreateTrigger()
        call TriggerRegisterEnterRegion(t, leftLane, null)
        call TriggerAddAction(t, function enterleft)

        set t = null
    endfunction
endscope