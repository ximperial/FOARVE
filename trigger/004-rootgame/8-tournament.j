library tournament uses Utilities
    
    globals
        boolean isTourStart = false
        boolean BossStart = false
        group array locktour
        integer TourType = 0
    endglobals

    private function pauseActions takes nothing returns nothing
        local group g = CreateGroup()
        local unit u
        if not isTourStart then
            call GroupEnumUnitsInRect(g, WorldBounds.world, null)
            loop
                set u = GroupForEachUnit(g)
                exitwhen u == null
                if IsUnitHero(u) and UserPlayer(GetOwningPlayer(u)) then
                    call IssueImmediateOrderById(u, 851972)
                    call PauseUnit(u, false)
                    call SetUnitInvulnerable(u, false)
                endif
            endloop
            call DestroyGroup(g)
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        else
            call GroupEnumUnitsInRect(g, WorldBounds.world, null)
            loop
                set u = GroupForEachUnit(g)
                exitwhen u == null
                if IsUnitHero(u) and UserPlayer(GetOwningPlayer(u)) then
                    call PauseUnit(u, true)
                    call SetUnitInvulnerable(u, true)
                endif
            endloop
            call DestroyGroup(g)
        endif

        set g = null
        set u = null
    endfunction

    private function pauseUnitTour takes nothing returns nothing
        set isTourStart = not isTourStart
        if isTourStart then
            call TimerStart(CreateTimer(), 0.1, true, function pauseActions)
        endif
    endfunction

    private function bossTarget takes nothing returns boolean 
        return GetFilterUnit() == MainHero[GetPlayerId(GetOwningPlayer(GetFilterUnit()))] and IsUnitAlive(GetFilterUnit()) and not IsUnitInvulnerable(GetFilterUnit())
    endfunction

    private function TeamSatu takes nothing returns boolean
        return IsUnitAlly(GetFilterUnit(), Player(0)) and IsUnitHero(GetFilterUnit()) and UserPlayer(GetOwningPlayer(GetFilterUnit()))
    endfunction

    private function TeamDua takes nothing returns boolean
        return IsUnitAlly(GetFilterUnit(), Player(4)) and IsUnitHero(GetFilterUnit()) and UserPlayer(GetOwningPlayer(GetFilterUnit()))
    endfunction

    private function TeamTiga takes nothing returns boolean
        return IsUnitAlly(GetFilterUnit(), Player(8)) and IsUnitHero(GetFilterUnit()) and UserPlayer(GetOwningPlayer(GetFilterUnit()))
    endfunction

    globals
        private integer tourCount = 0
        private integer tourStep = 0
        private unit array tourUnit
    endglobals

    private function recentTour takes nothing returns nothing
        local unit u
        local group g
        local group g2
        local group g3
        local real array x
        local real array y
        local integer i
        local integer randomI
        local integer uIndex = 0
        local integer uIndex2 = 0
        local integer uIndex3 = 0
        local integer pid
        local boolean b = false
        local string s = ""
        local string s2 = ""
        if TourTime >= 0 then
            set TourTime = TourTime - 1
        else
            set tourStep = tourStep + 1
        endif

        if TourTime == 0 then
            set i = 0
            loop
                exitwhen i > 11
                if reviveTime[i] > 0 then
                    set reviveTime[i] = 3
                endif
                set i = i + 1
            endloop
            call pauseUnitTour()
            if tourCount == 1 or tourCount == 5 or tourCount == 7 or tourCount >= 11 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Tournament Team Start")
            elseif tourCount == 2 or tourCount == 8 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Tournament Duo Start")
            elseif tourCount == 3 or tourCount == 9 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Tournament Solo Start")
            elseif tourCount == 4 or tourCount == 10 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Tournament Deaathmatch Start")
            elseif tourCount == 6 then
                call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "Tournament Boss Start")
            endif
        endif

        if tourStep == 3 then
            if tourCount == 1 or tourCount == 5 or tourCount == 7 or tourCount >= 11 then
                set x[1] = GetRectCenterX(gg_rct_TournamentTeam1)
                set x[2] = GetRectCenterX(gg_rct_TournamentTeam2)
                set x[3] = GetRectCenterX(gg_rct_TournamentTeam3)
                set y[1] = GetRectCenterY(gg_rct_TournamentTeam1)
                set y[2] = GetRectCenterY(gg_rct_TournamentTeam2)
                set y[3] = GetRectCenterY(gg_rct_TournamentTeam3)
                set i = 0
                set randomI = GetRandomInt(1, 6)
                loop
                    exitwhen i > 11
                    if MainHero[i] != null then
                        call SetUnitLifePercentBJ(MainHero[i], 100)
                        call SetUnitManaPercentBJ(MainHero[i], 100)
                        call GroupAddUnit(locktour[0], MainHero[i])
                        if randomI == 1 then
                            if IsUnitAlly(MainHero[i], Player(0)) then
                                call SetUnitPosition(MainHero[i], x[1], y[1])
                            elseif IsUnitAlly(MainHero[i], Player(4)) then
                                call SetUnitPosition(MainHero[i], x[2], y[2])
                            else
                                call SetUnitPosition(MainHero[i], x[3], y[3])
                            endif
                        elseif randomI == 2 then
                            if IsUnitAlly(MainHero[i], Player(0)) then
                                call SetUnitPosition(MainHero[i], x[2], y[2])
                            elseif IsUnitAlly(MainHero[i], Player(4)) then
                                call SetUnitPosition(MainHero[i], x[3], y[3])
                            else
                                call SetUnitPosition(MainHero[i], x[1], y[1])
                            endif
                        elseif randomI == 3 then
                            if IsUnitAlly(MainHero[i], Player(0)) then
                                call SetUnitPosition(MainHero[i], x[3], y[3])
                            elseif IsUnitAlly(MainHero[i], Player(4)) then
                                call SetUnitPosition(MainHero[i], x[1], y[1])
                            else
                                call SetUnitPosition(MainHero[i], x[2], y[2])
                            endif
                        elseif randomI == 4 then
                            if IsUnitAlly(MainHero[i], Player(0)) then
                                call SetUnitPosition(MainHero[i], x[1], y[1])
                            elseif IsUnitAlly(MainHero[i], Player(4)) then
                                call SetUnitPosition(MainHero[i], x[3], y[3])
                            else
                                call SetUnitPosition(MainHero[i], x[2], y[2])
                            endif
                        elseif randomI == 5 then
                            if IsUnitAlly(MainHero[i], Player(0)) then
                                call SetUnitPosition(MainHero[i], x[2], y[2])
                            elseif IsUnitAlly(MainHero[i], Player(4)) then
                                call SetUnitPosition(MainHero[i], x[1], y[1])
                            else
                                call SetUnitPosition(MainHero[i], x[3], y[3])
                            endif
                        elseif randomI == 6 then
                            if IsUnitAlly(MainHero[i], Player(0)) then
                                call SetUnitPosition(MainHero[i], x[3], y[3])
                            elseif IsUnitAlly(MainHero[i], Player(4)) then
                                call SetUnitPosition(MainHero[i], x[1], y[1])
                            else
                                call SetUnitPosition(MainHero[i], x[2], y[2])
                            endif
                        endif
                        call PanCameraToTimedForPlayer(GetOwningPlayer(MainHero[i]), GetUnitX(MainHero[i]), GetUnitY(MainHero[i]), 0)
                    endif
                    set i = i + 1
                endloop
            elseif tourCount == 2 or tourCount == 8 then
                set x[1] = GetRectCenterX(gg_rct_TournamentDuoTeam1)
                set x[2] = GetRectCenterX(gg_rct_TournamentDuoTeam2)
                set x[3] = GetRectCenterX(gg_rct_TournamentDuoTeam3)
                set y[1] = GetRectCenterY(gg_rct_TournamentDuoTeam1)
                set y[2] = GetRectCenterY(gg_rct_TournamentDuoTeam2)
                set y[3] = GetRectCenterY(gg_rct_TournamentDuoTeam3)
                set randomI = GetRandomInt(1, 6)
                set g = CreateGroup()
                call GroupEnumUnitsInRect(g, bj_mapInitialPlayableArea, null)
                set uIndex = 1
                set uIndex2 = 3
                set uIndex3 = 5
                loop
                    set u = GroupForEachUnit(g)
                    exitwhen u == null
                    set pid = GetPlayerId(GetOwningPlayer(u))
                    if u == MainHero[pid] then
                        if IsUnitAlly(u, Player(0)) and uIndex <= 2 then
                            set tourUnit[uIndex] = u
                            set uIndex = uIndex + 1
                        endif
                        if IsUnitAlly(u, Player(4)) and uIndex2 <= 4 then
                            set tourUnit[uIndex2] = u
                            set uIndex2 = uIndex2 + 1
                        endif
                        if IsUnitAlly(u, Player(8)) and uIndex3 <= 6 then
                            set tourUnit[uIndex3] = u
                            set uIndex3 = uIndex3 + 1
                        endif
                    endif
                endloop
                call DestroyGroup(g)
                set i = 1
                loop
                    exitwhen i > 6
                    if tourUnit[i] != null then
                        call SetUnitLifePercentBJ(tourUnit[i], 100)
                        call SetUnitManaPercentBJ(tourUnit[i], 100)
                        call GroupAddUnit(locktour[1], tourUnit[i])
                        if randomI == 1 then
                            if IsUnitAlly(tourUnit[i], Player(0)) then
                                call SetUnitPosition(tourUnit[i], x[1], y[1])
                            elseif IsUnitAlly(tourUnit[i], Player(4)) then
                                call SetUnitPosition(tourUnit[i], x[2], y[2])
                            else
                                call SetUnitPosition(tourUnit[i], x[3], y[3])
                            endif
                        elseif randomI == 2 then
                            if IsUnitAlly(tourUnit[i], Player(0)) then
                                call SetUnitPosition(tourUnit[i], x[2], y[2])
                            elseif IsUnitAlly(tourUnit[i], Player(4)) then
                                call SetUnitPosition(tourUnit[i], x[3], y[3])
                            else
                                call SetUnitPosition(tourUnit[i], x[1], y[1])
                            endif
                        elseif randomI == 3 then
                            if IsUnitAlly(tourUnit[i], Player(0)) then
                                call SetUnitPosition(tourUnit[i], x[3], y[3])
                            elseif IsUnitAlly(tourUnit[i], Player(4)) then
                                call SetUnitPosition(tourUnit[i], x[1], y[1])
                            else
                                call SetUnitPosition(tourUnit[i], x[2], y[2])
                            endif
                        elseif randomI == 4 then
                            if IsUnitAlly(tourUnit[i], Player(0)) then
                                call SetUnitPosition(tourUnit[i], x[1], y[1])
                            elseif IsUnitAlly(tourUnit[i], Player(4)) then
                                call SetUnitPosition(tourUnit[i], x[3], y[3])
                            else
                                call SetUnitPosition(tourUnit[i], x[2], y[2])
                            endif
                        elseif randomI == 5 then
                            if IsUnitAlly(tourUnit[i], Player(0)) then
                                call SetUnitPosition(tourUnit[i], x[2], y[2])
                            elseif IsUnitAlly(tourUnit[i], Player(4)) then
                                call SetUnitPosition(tourUnit[i], x[1], y[1])
                            else
                                call SetUnitPosition(tourUnit[i], x[3], y[3])
                            endif
                        elseif randomI == 6 then
                            if IsUnitAlly(tourUnit[i], Player(0)) then
                                call SetUnitPosition(tourUnit[i], x[3], y[3])
                            elseif IsUnitAlly(tourUnit[i], Player(4)) then
                                call SetUnitPosition(tourUnit[i], x[1], y[1])
                            else
                                call SetUnitPosition(tourUnit[i], x[2], y[2])
                            endif
                        endif
                        call PanCameraToTimedForPlayer(GetOwningPlayer(tourUnit[i]), GetUnitX(tourUnit[i]), GetUnitY(tourUnit[i]), 0)
                    endif
                    set i = i + 1
                endloop
            elseif tourCount == 3 or tourCount == 9 then
                set g = CreateGroup()
                set g2 = CreateGroup()
                set g3 = CreateGroup()
                call GroupEnumUnitsInRect(g, bj_mapInitialPlayableArea, Filter(function TeamSatu))
                call GroupEnumUnitsInRect(g2, bj_mapInitialPlayableArea, Filter(function TeamDua))
                call GroupEnumUnitsInRect(g3, bj_mapInitialPlayableArea, Filter(function TeamTiga))
                set tourUnit[1] = GroupGetUnitByIndex(g, GetRandomInt(0, GroupGetCount(g) - 1))
                if tourUnit[1] != null then
                    call GroupAddUnit(locktour[2], tourUnit[1])
                    call SetUnitLifePercentBJ(tourUnit[1], 100)
                    call SetUnitManaPercentBJ(tourUnit[1], 100)
                    call SetUnitBoundXY(tourUnit[1], gg_rct_TournamentSolo, true)
                    call PanCameraToTimedForPlayer(GetOwningPlayer(tourUnit[1]), GetUnitX(tourUnit[1]), GetUnitY(tourUnit[1]), 0)
                endif
                set tourUnit[2] = GroupGetUnitByIndex(g2, GetRandomInt(0, GroupGetCount(g2) - 1))
                if tourUnit[2] != null then
                    call GroupAddUnit(locktour[2], tourUnit[2])
                    call SetUnitLifePercentBJ(tourUnit[2], 100)
                    call SetUnitManaPercentBJ(tourUnit[2], 100)
                    call SetUnitBoundXY(tourUnit[2], gg_rct_TournamentSolo, true)
                    call PanCameraToTimedForPlayer(GetOwningPlayer(tourUnit[2]), GetUnitX(tourUnit[2]), GetUnitY(tourUnit[2]), 0)
                endif
                set tourUnit[3] = GroupGetUnitByIndex(g3, GetRandomInt(0, GroupGetCount(g3) - 1))
                if tourUnit[3] != null then
                    call GroupAddUnit(locktour[2], tourUnit[3])
                    call SetUnitLifePercentBJ(tourUnit[3], 100)
                    call SetUnitManaPercentBJ(tourUnit[3], 100)
                    call SetUnitBoundXY(tourUnit[3], gg_rct_TournamentSolo, true)
                    call PanCameraToTimedForPlayer(GetOwningPlayer(tourUnit[3]), GetUnitX(tourUnit[3]), GetUnitY(tourUnit[3]), 0)
                endif
                call DestroyGroup(g)
                call DestroyGroup(g2)
                call DestroyGroup(g3)
            elseif tourCount == 4 or tourCount == 10 then
                set TourType = 1
                set i = 0
                loop
                    exitwhen i > 11
                    if MainHero[i] != null then
                        call GroupAddUnit(locktour[3], MainHero[i])
                        call SetUnitLifePercentBJ(MainHero[i], 100)
                        call SetUnitManaPercentBJ(MainHero[i], 100)
                        call SetUnitBoundXY(MainHero[i], gg_rct_TournamentDM, true)
                        call PanCameraToTimedForPlayer(GetOwningPlayer(MainHero[i]), GetUnitX(MainHero[i]), GetUnitY(MainHero[i]), 0)
                    endif
                    set i = i + 1
                endloop
                call SetPlayerAllianceStateBJ( Player(1), Player(2), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(1), Player(3), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(2), Player(1), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(2), Player(3), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(3), Player(1), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(3), Player(2), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(5), Player(6), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(5), Player(7), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(6), Player(5), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(6), Player(7), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(7), Player(5), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(7), Player(6), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(9), Player(10), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(9), Player(11), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(10), Player(9), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(10), Player(11), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(11), Player(9), bj_ALLIANCE_UNALLIED )
                call SetPlayerAllianceStateBJ( Player(11), Player(10), bj_ALLIANCE_UNALLIED )
            elseif tourCount == 6 then
                set TourType = 2
                set BossStart = true
                set i = 0
                loop
                    exitwhen i > 11
                    if MainHero[i] != null then
                        call GroupAddUnit(locktour[4], MainHero[i])
                        call SetUnitLifePercentBJ(MainHero[i], 100)
                        call SetUnitManaPercentBJ(MainHero[i], 100)
                        call SetUnitBoundXY(MainHero[i], gg_rct_Boss_Warp, true)
                        call PanCameraToTimedForPlayer(GetOwningPlayer(MainHero[i]), GetUnitX(MainHero[i]), GetUnitY(MainHero[i]), 0)
                    endif
                    set i = i + 1
                endloop
                set i = 1
                loop
                    exitwhen i > 3
                    call SetPlayerAllianceStateBJ( Player(i), Player(5), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(6), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(7), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(9), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(10), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(11), bj_ALLIANCE_ALLIED )
                    set i = i + 1
                endloop
                set i = 5
                loop
                    exitwhen i > 7
                    call SetPlayerAllianceStateBJ( Player(i), Player(1), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(2), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(3), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(9), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(10), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(11), bj_ALLIANCE_ALLIED )
                    set i = i + 1
                endloop
                set i = 9
                loop
                    exitwhen i > 11
                    call SetPlayerAllianceStateBJ( Player(i), Player(1), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(2), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(3), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(5), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(6), bj_ALLIANCE_ALLIED )
                    call SetPlayerAllianceStateBJ( Player(i), Player(7), bj_ALLIANCE_ALLIED )
                    set i = i + 1
                endloop
                call GroupAddUnit(locktour[4], gg_unit_H0DS_0046)
            endif
        elseif tourStep == 4 then
            call pauseUnitTour()
        endif
        if tourStep >= 4 then
            if tourCount == 1 or tourCount == 5 or tourCount == 7 or tourCount >= 11 then
                loop
                    set u = GroupForEachUnit(locktour[0])
                    exitwhen u == null
                    if IsUnitAlly(u, Player(0)) then
                        set uIndex = uIndex + 1
                    endif
                    if IsUnitAlly(u, Player(4)) then
                        set uIndex2 = uIndex2 + 1
                    endif
                    if IsUnitAlly(u, Player(8)) then
                        set uIndex3 = uIndex3 + 1
                    endif
                endloop
                if GroupGetCount(locktour[0]) == 0 then
                    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "No one survived" )
                    set tourCount = tourCount + 1
                    if tourCount >= 11 then
                        set TourName = "Tournament Team"
                    elseif tourCount == 6 then 
                        set TourName = "Tournament Boss"
                    else 
                        set TourName = "Tournament Duo"
                    endif
                    set TourTime = 270
                    set tourStep = 0
                endif
                if (uIndex > 0 and uIndex2 == 0 and uIndex3 == 0) then
                    set b = true
                elseif (uIndex == 0 and uIndex2 > 0 and uIndex3 == 0) then 
                    set b = true
                elseif (uIndex == 0 and uIndex2 == 0 and uIndex3 > 0) then
                    set b = true
                endif
                if b then
                    if uIndex > 0 then
                        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "The winner is Team1" )
                        loop
                            set u = GroupForEachUnit(locktour[0])
                            exitwhen u == null
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team1Revive), GetRectCenterY(gg_rct_Team1Revive))
                            call IssueImmediateOrderById(u, 851972)
                        endloop
                        call AdjustPlayerStateBJ(500, Player(1), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, Player(2), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, Player(3), PLAYER_STATE_RESOURCE_GOLD)
                    elseif uIndex2 > 0 then
                        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "The winner is Team2" )
                        loop
                            set u = GroupForEachUnit(locktour[0])
                            exitwhen u == null
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive))
                            call IssueImmediateOrderById(u, 851972)
                        endloop
                        call AdjustPlayerStateBJ(500, Player(5), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, Player(6), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, Player(7), PLAYER_STATE_RESOURCE_GOLD)
                    elseif uIndex3 > 0 then
                        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "The winner is Team3" )
                        loop
                            set u = GroupForEachUnit(locktour[0])
                            exitwhen u == null
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team3Revive), GetRectCenterY(gg_rct_Team3Revive))
                            call IssueImmediateOrderById(u, 851972)
                        endloop
                        call AdjustPlayerStateBJ(500, Player(9), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, Player(10), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, Player(11), PLAYER_STATE_RESOURCE_GOLD)
                    endif
                    call GroupClear(locktour[0])
                    set tourCount = tourCount + 1
                    if tourCount >= 11 then
                        set TourName = "Tournament Team"
                    elseif tourCount == 6 then 
                        set TourName = "Tournament Boss"
                    else 
                        set TourName = "Tournament Duo"
                    endif
                    set TourTime = 270
                    set tourStep = 0
                endif
            elseif tourCount == 2 or tourCount == 8 then
                loop
                    set u = GroupForEachUnit(locktour[1])
                    exitwhen u == null
                    if IsUnitAlly(u, Player(0)) then
                        set uIndex = uIndex + 1
                    endif
                    if IsUnitAlly(u, Player(4)) then
                        set uIndex2 = uIndex2 + 1
                    endif
                    if IsUnitAlly(u, Player(8)) then
                        set uIndex3 = uIndex3 + 1
                    endif
                endloop
                if GroupGetCount(locktour[1]) == 0 then
                    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "No one survived" )
                    set tourCount = tourCount + 1
                    set TourName = "Tournament Solo"
                    set TourTime = 270
                    set tourStep = 0
                endif
                if (uIndex > 0 and uIndex2 == 0 and uIndex3 == 0) then
                    set b = true
                elseif (uIndex == 0 and uIndex2 > 0 and uIndex3 == 0) then 
                    set b = true
                elseif (uIndex == 0 and uIndex2 == 0 and uIndex3 > 0) then
                    set b = true
                endif
                if b then
                    if uIndex > 0 then
                        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "The winner is Team1" )
                        loop
                            set u = GroupForEachUnit(locktour[1])
                            exitwhen u == null
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team1Revive), GetRectCenterY(gg_rct_Team1Revive))
                            call IssueImmediateOrderById(u, 851972)
                        endloop
                        call AdjustPlayerStateBJ(500, GetOwningPlayer(tourUnit[1]), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, GetOwningPlayer(tourUnit[2]), PLAYER_STATE_RESOURCE_GOLD)
                    elseif uIndex2 > 0 then
                        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "The winner is Team2" )
                        loop
                            set u = GroupForEachUnit(locktour[1])
                            exitwhen u == null
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive))
                            call IssueImmediateOrderById(u, 851972)
                        endloop
                        call AdjustPlayerStateBJ(500, GetOwningPlayer(tourUnit[3]), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, GetOwningPlayer(tourUnit[4]), PLAYER_STATE_RESOURCE_GOLD)
                    elseif uIndex3 > 0 then
                        call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "The winner is Team3" )
                        loop
                            set u = GroupForEachUnit(locktour[1])
                            exitwhen u == null
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team3Revive), GetRectCenterY(gg_rct_Team3Revive))
                            call IssueImmediateOrderById(u, 851972)
                        endloop
                        call AdjustPlayerStateBJ(500, GetOwningPlayer(tourUnit[5]), PLAYER_STATE_RESOURCE_GOLD)
                        call AdjustPlayerStateBJ(500, GetOwningPlayer(tourUnit[6]), PLAYER_STATE_RESOURCE_GOLD)
                    endif
                    call GroupClear(locktour[1])
                    set tourCount = tourCount + 1
                    set TourName = "Tournament Solo"
                    set TourTime = 270
                    set tourStep = 0
                endif
            elseif tourCount == 3 or tourCount == 9 then
                if GroupGetCount(locktour[2]) <= 1 then
                    set b = true
                endif
                if b then
                    set u = GroupGetUnitByIndex(locktour[2], 0)
                    call GroupClear(locktour[2])
                    if u == null then
                        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "No one survived" )
                    else
                        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The winner is " + playerName[GetPlayerId(GetOwningPlayer(u))])
                        if IsUnitAlly(u, Player(0)) then
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team1Revive), GetRectCenterY(gg_rct_Team1Revive))
                        elseif IsUnitAlly(u, Player(4)) then
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive))
                        elseif IsUnitAlly(u, Player(8)) then 
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team3Revive), GetRectCenterY(gg_rct_Team3Revive))
                        endif
                        call IssueImmediateOrderById(u, 851972)
                        call AdjustPlayerStateBJ( 500, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD )
                    endif
                    set tourCount = tourCount + 1
                    set TourName = "Tournament Deathmatch"
                    set TourTime = 270
                    set tourStep = 0
                endif
            elseif tourCount == 4 or tourCount == 10 then
                if GroupGetCount(locktour[3]) <= 1 then
                    set b = true
                endif
                if b then
                    set TourType = 0
                    set u = GroupGetUnitByIndex(locktour[3], 0)
                    call GroupClear(locktour[3])
                    if u == null then
                        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "No one survived" )
                    else
                        call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "The winner is " + playerName[GetPlayerId(GetOwningPlayer(u))])
                        if IsUnitAlly(u, Player(0)) then
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team1Revive), GetRectCenterY(gg_rct_Team1Revive))
                        elseif IsUnitAlly(u, Player(4)) then
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive))
                        elseif IsUnitAlly(u, Player(8)) then 
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team3Revive), GetRectCenterY(gg_rct_Team3Revive))
                        endif
                        call IssueImmediateOrderById(u, 851972)
                        call AdjustPlayerStateBJ( 500, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD )
                    endif
                    call SetPlayerAllianceStateBJ( Player(1), Player(2), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(1), Player(3), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(2), Player(1), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(2), Player(3), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(3), Player(1), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(3), Player(2), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(5), Player(6), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(5), Player(7), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(6), Player(5), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(6), Player(7), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(7), Player(5), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(7), Player(6), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(9), Player(10), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(9), Player(11), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(10), Player(9), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(10), Player(11), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(11), Player(9), bj_ALLIANCE_ALLIED_VISION )
                    call SetPlayerAllianceStateBJ( Player(11), Player(10), bj_ALLIANCE_ALLIED_VISION )
                    set tourCount = tourCount + 1
                    set TourName = "Tournament Team"
                    set TourTime = 270
                    set tourStep = 0
                endif
            elseif tourCount == 6 then
                set g = CreateGroup()
                call GroupEnumUnitsInRect(g, gg_rct_Boss_Arena, function bossTarget)
                set u = GroupGetUnitByIndex(g, GetRandomInt(0, GroupGetCount(g) - 1))
                if not IsAbilityOnCooldown(GetUnitAbility(gg_unit_H0DS_0046, 'A03N')) then
                    if GetUnitCurrentOrder(gg_unit_H0DS_0046) != 852652 then
                        call IssueTargetOrderById(gg_unit_H0DS_0046, 852652, u)
                    endif
                elseif not IsAbilityOnCooldown(GetUnitAbility(gg_unit_H0DS_0046, 'A0DK')) then
                    if GetUnitCurrentOrder(gg_unit_H0DS_0046) != 852243 then
                        call IssueTargetOrderById(gg_unit_H0DS_0046, 852243, u)
                    endif
                elseif not IsAbilityOnCooldown(GetUnitAbility(gg_unit_H0DS_0046, 'A0DL')) then
                    if GetUnitCurrentOrder(gg_unit_H0DS_0046) != 852474 then
                        call IssueTargetOrderById(gg_unit_H0DS_0046, 852474, u)
                    endif
                elseif not IsAbilityOnCooldown(GetUnitAbility(gg_unit_H0DS_0046, 'A04B')) then
                    if GetUnitCurrentOrder(gg_unit_H0DS_0046) != 852244 then
                        call IssueImmediateOrderById(gg_unit_H0DS_0046, 852244)
                    endif
                elseif not IsAbilityOnCooldown(GetUnitAbility(gg_unit_H0DS_0046, 'A03O')) then
                    if GetUnitCurrentOrder(gg_unit_H0DS_0046) != 852663 then
                        call IssueImmediateOrderById(gg_unit_H0DS_0046, 852663)
                    endif
                elseif GetUnitCurrentOrder(gg_unit_H0DS_0046) == 0 then
                    call IssuePointOrderById(gg_unit_H0DS_0046, 851990, GetUnitX(u), GetUnitY(u))
                endif
                if GetUnitLifePercent(gg_unit_H0DS_0046) < 50 and GetUnitTypeId(gg_unit_H0DS_0046) != 'H0G7' then
                    call IssueImmediateOrderById(gg_unit_H0DS_0046, 852473) 
                endif
                call DestroyGroup(g)
                if GroupGetCount(locktour[4]) <= 1 then
                    set TourType = 0 
                    set BossStart = false
                    call DisplayTextToForce(bj_FORCE_ALL_PLAYERS, "No one survived" )
                    set tourCount = tourCount + 1
                    set TourName = "Tournament Team"
                    set TourTime = 270
                    set tourStep = 0
                elseif not IsUnitAlive(gg_unit_H0DS_0046) then
                    set b = true
                endif
                if b then
                    set TourType = 0
                    set BossStart = false
                    call DisplayTextToForce( bj_FORCE_ALL_PLAYERS, "The winner is Alliance Team")
                    loop
                        set u = GroupForEachUnit(locktour[4])
                        exitwhen u == null
                        if IsUnitAlly(u, Player(0)) then
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team1Revive), GetRectCenterY(gg_rct_Team1Revive))
                        elseif IsUnitAlly(u, Player(4)) then
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive))
                        elseif IsUnitAlly(u, Player(8)) then 
                            call SetUnitPosition(u, GetRectCenterX(gg_rct_Team3Revive), GetRectCenterY(gg_rct_Team3Revive))
                        endif
                        call IssueImmediateOrderById(u, 851972)
                        if not HaveSavedBoolean(ht, StringHash("bossdead"), GetHandleId(u)) then
                            call AdjustPlayerStateBJ( 10000, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD )
                        else
                            call AdjustPlayerStateBJ( 6000, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD )
                        endif
                    endloop
                    call GroupClear(locktour[4])
                    set i = 1
                    loop
                        exitwhen i > 3
                        call SetPlayerAllianceStateBJ( Player(i), Player(5), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(6), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(7), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(9), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(10), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(11), bj_ALLIANCE_UNALLIED )
                        set i = i + 1
                    endloop
                    set i = 5
                    loop
                        exitwhen i > 7
                        call SetPlayerAllianceStateBJ( Player(i), Player(1), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(2), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(3), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(9), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(10), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(11), bj_ALLIANCE_UNALLIED )
                        set i = i + 1
                    endloop
                    set i = 9
                    loop
                        exitwhen i > 11
                        call SetPlayerAllianceStateBJ( Player(i), Player(1), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(2), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(3), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(5), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(6), bj_ALLIANCE_UNALLIED )
                        call SetPlayerAllianceStateBJ( Player(i), Player(7), bj_ALLIANCE_UNALLIED )
                        set i = i + 1
                    endloop
                    set tourCount = tourCount + 1
                    set TourName = "Tournament Team"
                    set TourTime = 270
                    set tourStep = 0
                endif
            endif
        endif

        set u = null
        set g = null
        set g2 = null
        set g3 = null
    endfunction

    function runTournament takes nothing returns nothing
        if playerCount >= 1 then
            set tourCount = tourCount + 1
            set TourTimer = CreateTimer()
            set TourName = "Tournament Team"
            set TourTime = 270
            call TimerStart(TourTimer, 1, true, function recentTour)
        endif
    endfunction
endlibrary