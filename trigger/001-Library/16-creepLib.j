library creepLib uses Utilities

    function setUnitData takes unit u, integer data returns nothing
        call SaveInteger(ht, StringHash("creep"), GetHandleId(u), data)
    endfunction
    
    function CreepPathEnd takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local player p = GetOwningPlayer(u)
        local integer point = LoadInteger(ht, GetHandleId(z), 0)
        local integer movePoint = LoadInteger(ht, StringHash("creep"), GetHandleId(u))
        local boolean isUnitIdle = GetUnitCurrentOrder(u) == 0
        if IsUnitAlive(u) then
            if isUnitIdle then
                if movePoint == 0 then
                    if p == Player(0) then 
                        if point == 0 then  
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Top) , GetRectCenterY(gg_rct_Top))
                        elseif point == 1 then
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                        else
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomLeft) , GetRectCenterY(gg_rct_BottomLeft))
                        endif
                    elseif p == Player(4) then 
                        if point == 0 then  
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Top) , GetRectCenterY(gg_rct_Top))
                        elseif point == 1 then
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                        else
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                        endif
                    else 
                        if point == 0 then  
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                        elseif point == 1 then
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                        else
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomLeft) , GetRectCenterY(gg_rct_BottomLeft))
                        endif
                    endif
                elseif movePoint == 1 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                    elseif p == Player(4) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                    endif
                elseif movePoint == 2 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam2_1) , GetRectCenterY(gg_rct_MidCTeam2_1))
                    elseif p == Player(4) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam3_1) , GetRectCenterY(gg_rct_MidCTeam3_1))
                    else
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam1_1) , GetRectCenterY(gg_rct_MidCTeam1_1))
                    endif
                elseif movePoint == 3 then
                    if p == Player(4) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_RightCTeam3_1) , GetRectCenterY(gg_rct_RightCTeam3_1))
                    elseif p == Player(8) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomCTeam2_1) , GetRectCenterY(gg_rct_BottomCTeam2_1))
                    endif
                elseif movePoint == 4 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam3) , GetRectCenterY(gg_rct_BaseTeam3))
                    elseif p == Player(8) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                    endif
                elseif movePoint == 5 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                    elseif p == Player(8) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                    endif
                elseif movePoint == 6 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                    elseif p == Player(4) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                    endif
                elseif movePoint == 7 then
                    if p == Player(4) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam3) , GetRectCenterY(gg_rct_BaseTeam3))
                    elseif p == Player(8) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Center) , GetRectCenterY(gg_rct_Center))
                    endif
                elseif movePoint == 8 then
                    if p == Player(4) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam3) , GetRectCenterY(gg_rct_BaseTeam3))
                    elseif p == Player(8) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                    endif
                elseif movePoint == 9 then
                    if p == Player(4) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                    elseif p == Player(8) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                    endif
                endif
            endif
        else
            call RemoveSavedInteger(ht, StringHash("creep"), GetHandleId(u))
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
        set p = null
    endfunction
    
    function CreepPath takes unit u, integer point, integer movePoint returns nothing
        local timer z = CreateTimer()

        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveInteger(ht, GetHandleId(z), 0, point)
        call setUnitData(u, movePoint)
        call TimerStart(z, 1, true, function CreepPathEnd)

        set z = null
    endfunction
    
    function CreateCreep takes integer count, player p, integer uid, real x, real y, integer point returns nothing
        local unit u

        loop
            set u = CreateUnit(p, uid, x, y, randomAngle())
            call UnitAddAbility(u, 'Aeth')
            call UnitMakeAbilityPermanent(u, true, 'Aeth')
            call LinkSpell(u, 'Aeth', 10, false)
            if p == Player(0) then 
                if point == 0 then  
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Top) , GetRectCenterY(gg_rct_Top))
                elseif point == 1 then
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam1_1) , GetRectCenterY(gg_rct_MidCTeam1_1))
                else
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomLeft) , GetRectCenterY(gg_rct_BottomLeft))
                endif
            elseif p == Player(4) then 
                if point == 0 then  
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Top) , GetRectCenterY(gg_rct_Top))
                elseif point == 1 then
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam2_1) , GetRectCenterY(gg_rct_MidCTeam2_1))
                else
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                endif
            else 
                if point == 0 then  
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomRight) , GetRectCenterY(gg_rct_BottomRight))
                elseif point == 1 then
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidCTeam3_1) , GetRectCenterY(gg_rct_MidCTeam3_1))
                else
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomLeft) , GetRectCenterY(gg_rct_BottomLeft))
                endif
            endif
            call CreepPath(u, point, 0)
            
            set count = count - 1
            exitwhen count <= 0
        endloop

        set u = null
    endfunction
    
    globals
        real CreepCountdown = 0
        integer CreepCountdown2 = 0
        texttag array creepText
    endglobals
                                                                                                                                                                                                                                                                                                              
    function AttackWaveEnd takes nothing returns nothing
        local integer i = 0
        local integer i2 = 0
        local string s = ""

        set CreepCountdown = CreepCountdown + 0.5
        set s = I2S(R2I(CreepCountdown))
        loop
            exitwhen i > 8
            if creepText[i] != null then
                call SetTextTagTextBJ(creepText[i], s, 14)
                set i2 = i2 + 1
            endif
            set i = i + 1
        endloop
        
        if i2 == 0 then
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
            return
        endif
                                                                                                                                                                                                                                      
        if CreepCountdown >= 28 then
            if CreepCountdown == 31 then
                set CreepCountdown2 = CreepCountdown2 + 1
            endif
            // Team1
            if IsUnitAlive(gg_unit_o008_0019) then
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(0), 'e002', GetRectCenterX(gg_rct_TopCTeam1), GetRectCenterY(gg_rct_TopCTeam1), 0)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(0), 'e003', GetRectCenterX(gg_rct_TopCTeam1), GetRectCenterY(gg_rct_TopCTeam1), 0)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(0), 'e004', GetRectCenterX(gg_rct_TopCTeam1), GetRectCenterY(gg_rct_TopCTeam1), 0)
                endif
            endif
            
            if IsUnitAlive(gg_unit_o008_0023) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(0), 'e002', GetRectCenterX(gg_rct_MidCTeam1), GetRectCenterY(gg_rct_MidCTeam1), 1)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(0), 'e003', GetRectCenterX(gg_rct_MidCTeam1), GetRectCenterY(gg_rct_MidCTeam1), 1)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(0), 'e004', GetRectCenterX(gg_rct_MidCTeam1), GetRectCenterY(gg_rct_MidCTeam1), 1)
                endif
            endif
            
            if IsUnitAlive(gg_unit_o008_0014) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(0), 'e002', GetRectCenterX(gg_rct_BottomCTeam1), GetRectCenterY(gg_rct_BottomCTeam1), 2)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(0), 'e003', GetRectCenterX(gg_rct_BottomCTeam1), GetRectCenterY(gg_rct_BottomCTeam1), 2)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(0), 'e004', GetRectCenterX(gg_rct_BottomCTeam1), GetRectCenterY(gg_rct_BottomCTeam1), 2)
                endif
            endif
            
            // Team2
            if IsUnitAlive(gg_unit_o008_0033) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(4), 'e005', GetRectCenterX(gg_rct_TopCTeam2), GetRectCenterY(gg_rct_TopCTeam2), 0)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(4), 'e006', GetRectCenterX(gg_rct_TopCTeam2), GetRectCenterY(gg_rct_TopCTeam2), 0)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(4), 'e007', GetRectCenterX(gg_rct_TopCTeam2), GetRectCenterY(gg_rct_TopCTeam2), 0)
                endif
            endif
            
            if IsUnitAlive(gg_unit_o008_0034) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(4), 'e005', GetRectCenterX(gg_rct_MidCTeam2), GetRectCenterY(gg_rct_MidCTeam2), 1)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(4), 'e006', GetRectCenterX(gg_rct_MidCTeam2), GetRectCenterY(gg_rct_MidCTeam2), 1)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(4), 'e007', GetRectCenterX(gg_rct_MidCTeam2), GetRectCenterY(gg_rct_MidCTeam2), 1)
                endif
            endif
            
            if IsUnitAlive(gg_unit_o008_0032) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(4), 'e005', GetRectCenterX(gg_rct_BottomCTeam2), GetRectCenterY(gg_rct_BottomCTeam2), 2)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(4), 'e006', GetRectCenterX(gg_rct_BottomCTeam2), GetRectCenterY(gg_rct_BottomCTeam2), 2)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(4), 'e007', GetRectCenterX(gg_rct_BottomCTeam2), GetRectCenterY(gg_rct_BottomCTeam2), 2)
                endif
            endif
            
            // Team3
            if IsUnitAlive(gg_unit_o008_0046) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(8), 'e008', GetRectCenterX(gg_rct_RightCTeam3), GetRectCenterY(gg_rct_RightCTeam3), 0)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(8), 'e009', GetRectCenterX(gg_rct_RightCTeam3), GetRectCenterY(gg_rct_RightCTeam3), 0)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(8), 'e00A', GetRectCenterX(gg_rct_RightCTeam3), GetRectCenterY(gg_rct_RightCTeam3), 0)
                endif
            endif                                        

            if IsUnitAlive(gg_unit_o008_0047) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(8), 'e008', GetRectCenterX(gg_rct_MidCTeam3), GetRectCenterY(gg_rct_MidCTeam3), 1)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(8), 'e009', GetRectCenterX(gg_rct_MidCTeam3), GetRectCenterY(gg_rct_MidCTeam3), 1)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(8), 'e00A', GetRectCenterX(gg_rct_MidCTeam3), GetRectCenterY(gg_rct_MidCTeam3), 1)
                endif
            endif

            if IsUnitAlive(gg_unit_o008_0045) then 
                if CreepCountdown == 28.5 or CreepCountdown == 29.0 or CreepCountdown == 29.5 then
                    call CreateCreep(1, Player(8), 'e008', GetRectCenterX(gg_rct_LeftCTeam3), GetRectCenterY(gg_rct_LeftCTeam3), 2)
                endif
                if CreepCountdown == 30.0 or CreepCountdown == 30.5 then
                    call CreateCreep(1, Player(8), 'e009', GetRectCenterX(gg_rct_LeftCTeam3), GetRectCenterY(gg_rct_LeftCTeam3), 2)
                endif
                if CreepCountdown2 == 2 and CreepCountdown == 31 then
                    call CreateCreep(1, Player(8), 'e00A', GetRectCenterX(gg_rct_LeftCTeam3), GetRectCenterY(gg_rct_LeftCTeam3), 2)
                endif
            endif
            
            if CreepCountdown == 31 then
                set CreepCountdown = 0
            endif
            if CreepCountdown2 >= 2 then
                set CreepCountdown2 = 0
            endif
        endif                                                                                                                                                 
    endfunction
    
    globals
        private boolean isActive = false
    endglobals
    
    function AttackWave takes nothing returns nothing
        if not isActive then
            set isActive = true
            call TimerStart(CreateTimer(), 0.5, true, function AttackWaveEnd)
        endif
    endfunction
endlibrary