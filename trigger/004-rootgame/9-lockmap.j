library lockmap uses Utilities

    private function lockMapActions takes nothing returns nothing
        local unit u = GetEnumUnit()
        local player p = GetOwningPlayer(u)
        local integer pid = GetPlayerId(p)
        if not IsUnitInvulnerable(u) then
            if IsUnitInGroup(u, locktour[0]) then
                if not RectContainsCoords(gg_rct_TournamentTeam, GetUnitX(u), GetUnitY(u)) then
                    call SetUnitBoundXY(u, gg_rct_TournamentTeam, false)
                else
                    if IsTerrainPathable(GetUnitX(u), GetUnitY(u), PATHING_TYPE_FLYABILITY) then
                        call SetUnitBoundXY(u, gg_rct_TournamentTeam, false)
                    endif
                endif
            elseif IsUnitInGroup(u, locktour[1]) then
                if not RectContainsCoords(gg_rct_TournamentDuo, GetUnitX(u), GetUnitY(u)) then
                    call SetUnitBoundXY(u, gg_rct_TournamentDuo, false)
                else
                    if IsTerrainPathable(GetUnitX(u), GetUnitY(u), PATHING_TYPE_FLYABILITY) then
                        call SetUnitBoundXY(u, gg_rct_TournamentDuo, false)
                    endif
                endif
            elseif IsUnitInGroup(u, locktour[2]) then
                if not RectContainsCoords(gg_rct_TournamentSolo, GetUnitX(u), GetUnitY(u)) then
                    call SetUnitBoundXY(u, gg_rct_TournamentSolo, false)
                else
                    if IsTerrainPathable(GetUnitX(u), GetUnitY(u), PATHING_TYPE_FLYABILITY) then
                        call SetUnitBoundXY(u, gg_rct_TournamentSolo, false)
                    endif
                endif
            elseif IsUnitInGroup(u, locktour[3]) then
                if not RectContainsCoords(gg_rct_TournamentDM, GetUnitX(u), GetUnitY(u)) then
                    call SetUnitBoundXY(u, gg_rct_TournamentDM, false)
                else
                    if IsTerrainPathable(GetUnitX(u), GetUnitY(u), PATHING_TYPE_FLYABILITY) then
                        call SetUnitBoundXY(u, gg_rct_TournamentDM, false)
                    endif
                endif
            elseif IsUnitInGroup(u, locktour[4]) then
                if not RectContainsCoords(gg_rct_Boss_Arena, GetUnitX(u), GetUnitY(u)) then
                    call SetUnitBoundXY(u, gg_rct_Boss_Arena, false)
                else
                    if IsTerrainPathable(GetUnitX(u), GetUnitY(u), PATHING_TYPE_FLYABILITY) then
                        call SetUnitBoundXY(u, gg_rct_Boss_Arena, false)
                    endif
                endif
            endif
        endif

        set u = null
        set p = null
    endfunction

    private function lockMapPeriod takes nothing returns nothing
        local group g = CreateGroup()
        call GroupEnumUnitsInRect(g, WorldBounds.world, null)
        call ForGroup(g, function lockMapActions)
        call DestroyGroup(g)
        set g = null
    endfunction

    function runLockMap takes nothing returns nothing
        call TimerStart(CreateTimer(), 1, true, function lockMapPeriod)
    endfunction
endlibrary