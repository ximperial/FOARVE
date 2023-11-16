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
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Mid) , GetRectCenterY(gg_rct_Mid))
                        else
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Bottom) , GetRectCenterY(gg_rct_Bottom))
                        endif
                    elseif p == Player(6) then 
                        if point == 0 then  
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Top) , GetRectCenterY(gg_rct_Top))
                        elseif point == 1 then
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Mid) , GetRectCenterY(gg_rct_Mid))
                        else
                            call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Bottom) , GetRectCenterY(gg_rct_Bottom))
                        endif
                    endif
                elseif movePoint == 1 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_TopTeam2) , GetRectCenterY(gg_rct_TopTeam2))
                    elseif p == Player(6) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_TopTeam1) , GetRectCenterY(gg_rct_TopTeam1))
                    endif
                elseif movePoint == 2 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                    elseif p == Player(6) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                    endif
                elseif movePoint == 3 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidTeam2) , GetRectCenterY(gg_rct_MidTeam2))
                    elseif p == Player(6) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_MidTeam1) , GetRectCenterY(gg_rct_MidTeam1))
                    endif
                elseif movePoint == 4 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                    elseif p == Player(6) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
                    endif
                elseif movePoint == 5 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomTeam2) , GetRectCenterY(gg_rct_BottomTeam2))
                    elseif p == Player(6) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BottomTeam1) , GetRectCenterY(gg_rct_BottomTeam1))
                    endif
                elseif movePoint == 6 then
                    if p == Player(0) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam2) , GetRectCenterY(gg_rct_BaseTeam2))
                    elseif p == Player(6) then
                        call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_BaseTeam1) , GetRectCenterY(gg_rct_BaseTeam1))
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
            if p == Player(0) then 
                if point == 0 then  
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Top) , GetRectCenterY(gg_rct_Top))
                elseif point == 1 then
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Mid) , GetRectCenterY(gg_rct_Mid))
                else
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Bottom) , GetRectCenterY(gg_rct_Bottom))
                endif
            elseif p == Player(6) then 
                if point == 0 then  
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Top) , GetRectCenterY(gg_rct_Top))
                elseif point == 1 then
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Mid) , GetRectCenterY(gg_rct_Mid))
                else
                    call IssuePointOrderById(u, 851983, GetRectCenterX(gg_rct_Bottom) , GetRectCenterY(gg_rct_Bottom))
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
        local integer i
        local string s = ""

        set CreepCountdown = CreepCountdown + 0.5
        set s = I2S(R2I(CreepCountdown))
        set i = 0
        loop
            exitwhen i > 8
            if creepText[i] != null then
                call SetTextTagTextBJ(creepText[i], s, 14)
            endif
            set i = i + 1
        endloop
                                                                                                                                                                                                                                      
        if CreepCountdown == 30 then
            set CreepCountdown2 = CreepCountdown2 + 1
        endif

        if CreepCountdown == 27 or CreepCountdown == 27.5 or CreepCountdown == 28 or CreepCountdown == 28.5 or CreepCountdown == 29 then
            call CreateCreep(1, Player(0), 'e002', GetRectCenterX(gg_rct_TopTeam1), GetRectCenterY(gg_rct_TopTeam1), 0)
            call CreateCreep(1, Player(0), 'e002', GetRectCenterX(gg_rct_MidTeam1), GetRectCenterY(gg_rct_MidTeam1), 1)
            call CreateCreep(1, Player(0), 'e002', GetRectCenterX(gg_rct_BottomTeam1), GetRectCenterY(gg_rct_BottomTeam1), 2)

            call CreateCreep(1, Player(6), 'e002', GetRectCenterX(gg_rct_TopTeam2), GetRectCenterY(gg_rct_TopTeam2), 0)
            call CreateCreep(1, Player(6), 'e002', GetRectCenterX(gg_rct_MidTeam2), GetRectCenterY(gg_rct_MidTeam2), 1)
            call CreateCreep(1, Player(6), 'e002', GetRectCenterX(gg_rct_BottomTeam2), GetRectCenterY(gg_rct_BottomTeam2), 2)
        endif
        if CreepCountdown == 29.5 then
            call CreateCreep(1, Player(0), 'e003', GetRectCenterX(gg_rct_TopTeam1), GetRectCenterY(gg_rct_TopTeam1), 0)
            call CreateCreep(1, Player(0), 'e003', GetRectCenterX(gg_rct_MidTeam1), GetRectCenterY(gg_rct_MidTeam1), 1)
            call CreateCreep(1, Player(0), 'e003', GetRectCenterX(gg_rct_BottomTeam1), GetRectCenterY(gg_rct_BottomTeam1), 2)

            call CreateCreep(1, Player(6), 'e003', GetRectCenterX(gg_rct_TopTeam2), GetRectCenterY(gg_rct_TopTeam2), 0)
            call CreateCreep(1, Player(6), 'e003', GetRectCenterX(gg_rct_MidTeam2), GetRectCenterY(gg_rct_MidTeam2), 1)
            call CreateCreep(1, Player(6), 'e003', GetRectCenterX(gg_rct_BottomTeam2), GetRectCenterY(gg_rct_BottomTeam2), 2)
        endif
        if CreepCountdown2 == 2 and CreepCountdown == 30.0 then
            call CreateCreep(1, Player(0), 'e004', GetRectCenterX(gg_rct_TopTeam1), GetRectCenterY(gg_rct_TopTeam1), 0)
            call CreateCreep(1, Player(0), 'e004', GetRectCenterX(gg_rct_MidTeam1), GetRectCenterY(gg_rct_MidTeam1), 1)
            call CreateCreep(1, Player(0), 'e004', GetRectCenterX(gg_rct_BottomTeam1), GetRectCenterY(gg_rct_BottomTeam1), 2)

            call CreateCreep(1, Player(6), 'e004', GetRectCenterX(gg_rct_TopTeam2), GetRectCenterY(gg_rct_TopTeam2), 0)
            call CreateCreep(1, Player(6), 'e004', GetRectCenterX(gg_rct_MidTeam2), GetRectCenterY(gg_rct_MidTeam2), 1)
            call CreateCreep(1, Player(6), 'e004', GetRectCenterX(gg_rct_BottomTeam2), GetRectCenterY(gg_rct_BottomTeam2), 2)
        endif
            
        if CreepCountdown == 30.0 then
            set CreepCountdown = 0
        endif
        if CreepCountdown2 >= 2 then
            set CreepCountdown2 = 0
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