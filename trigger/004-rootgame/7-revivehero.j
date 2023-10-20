scope revivehero initializer init

    globals
        integer array reviveTime
        private timer array reviveTimer
    endglobals

    private function ResetVisionEnd takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real ToD = GetTimeOfDay()

        if IsUnitAlive(u) then
            if ToD >= bj_TOD_DAWN and ToD < bj_TOD_DUSK then
                call SetUnitCurrentSight( u, 1800 )
            else
                call SetUnitCurrentSight( u, 1000 )
            endif
        endif
        call DestroyTimer(z)
        
        set z = null
        set u = null
    endfunction

    private function ResetVision takes unit u returns nothing
        local timer z = CreateTimer()
        
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call TimerStart(z, 5, false, function ResetVisionEnd)

        set z = null
    endfunction

    private function reviveUnit takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer pid = LoadInteger(ht, GetHandleId(z), 0)
        local framehandle pFrame = GetFrameByName("ScoreHeroTimerFrame", pid)
        local string s = ""

        set reviveTime[pid] = reviveTime[pid] - 1
        set s = I2S(reviveTime[pid])
        call SetFrameText(pFrame, s)
        if reviveTime[pid] <= 0 then
            call SetFrameText(pFrame, "")
            if pid < 4 then
                call ReviveHero(MainHero[pid], GetRectCenterX(gg_rct_Team1Revive), GetRectCenterY(gg_rct_Team1Revive), false)
            elseif pid < 8 then
                call ReviveHero(MainHero[pid], GetRectCenterX(gg_rct_Team2Revive), GetRectCenterY(gg_rct_Team2Revive), false)
            else
                call ReviveHero(MainHero[pid], GetRectCenterX(gg_rct_Team3Revive), GetRectCenterY(gg_rct_Team3Revive), false)
            endif
            call UnitAddAbility(MainHero[pid], 'Amrf')
            call UnitRemoveAbility(MainHero[pid], 'Amrf')
            call SetUnitFlyHeight(MainHero[pid], 0, 0)
            call SetUnitMoveSpeed(MainHero[pid], GetUnitDefaultMoveSpeed(MainHero[pid]))
            call SetUnitTimeScale(MainHero[pid], 1)
            call PauseUnit(MainHero[pid], false)
            call SetUnitInvulnerable(MainHero[pid], false)
            call PanCameraToTimedForPlayer(Player(pid), GetUnitX(MainHero[pid]), GetUnitY(MainHero[pid]), 0)
            set pFrame = GetFrameByName("ScoreHeroBackground", pid)
            call SetFrameTexture(pFrame, HeroPhoto[MemoHero[pid]], 0, true)
            call ResetVision(MainHero[pid])
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
        endif

        set z = null
        set pFrame = null
    endfunction

    private function onRevive takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)
        local framehandle pFrame 
        local integer pid = GetPlayerId(p)

        if u == MainHero[pid] then
            if reviveTimer[pid] == null then
                set reviveTimer[pid] = CreateTimer()
            endif
            set reviveTime[pid] = 12
            call ResetToGameCameraForPlayer(p, 0)
            call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, camZ[pid], 0)
            set pFrame = GetFrameByName("ScoreHeroBackground", pid)
            call SetFrameTexture(pFrame, HeroPhoto2[MemoHero[pid]], 0, true)
            set z = reviveTimer[pid]
            call SaveInteger(ht, GetHandleId(z), 0, pid)
            call TimerStart(z, 1, true, function reviveUnit)
        endif

        set z = null
        set u = null
        set p = null
        set pFrame = null
    endfunction
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DEATH, function onRevive)
    endfunction
endscope