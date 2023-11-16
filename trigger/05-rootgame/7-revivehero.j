scope revivehero initializer init

    globals
        integer array reviveTime
        private timer array reviveTimer
    endglobals

    private function reviveUnit takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer pid = LoadInteger(ht, GetHandleId(z) , 0)
        local framehandle frame1 = GetFrameByName("ScoreHeroText", pid)

        set reviveTime[pid] = reviveTime[pid] - 1
        call SetFrameText(frame1, I2S(reviveTime[pid]))
        if reviveTime[pid] <= 0 then
            call SetFrameText(frame1, "")
            if pid < 6 then
                call ReviveHero(MainHero[pid] , GetRectCenterX(gg_rct_Team1Revive) , GetRectCenterY(gg_rct_Team1Revive) , false)
            elseif pid < 12 then
                call ReviveHero(MainHero[pid] , GetRectCenterX(gg_rct_Team2Revive) , GetRectCenterY(gg_rct_Team2Revive) , false)
            endif
            call UnitAddAbility(MainHero[pid] , 'Amrf')
            call UnitRemoveAbility(MainHero[pid] , 'Amrf')
            call SetUnitFlyHeight(MainHero[pid] , 0, 0)
            call SetUnitMoveSpeed(MainHero[pid] , GetUnitDefaultMoveSpeed(MainHero[pid]))
            call SetUnitTimeScale(MainHero[pid] , 1)
            call PauseUnit(MainHero[pid] , false)
            call SetUnitInvulnerable(MainHero[pid] , false)
            call PanCameraToTimedForPlayer(Player(pid) , GetUnitX(MainHero[pid]) , GetUnitY(MainHero[pid]) , 0)
            set frame1 = GetFrameByName("ScoreHeroView", pid)
            call SetFrameTexture(frame1, HeroIcon[MemoHero[pid]] , 0, true)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
        endif

        set z = null
        set frame1 = null
    endfunction

    private function onRevive takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local player p = GetOwningPlayer(u)
        local integer pid = GetPlayerId(p)
        local framehandle frame1

        if u == MainHero[pid] then
            if reviveTimer[pid] == null then
                set reviveTimer[pid] = CreateTimer()
            endif
            if GetHeroLevel(u) > 10 then
                set reviveTime[pid] = GetHeroLevel(u)
            else
                set reviveTime[pid] = 10
            endif
            call ResetToGameCameraForPlayer(p, 0)
            call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, camZ[pid] , 0)
            set frame1 = GetFrameByName("ScoreHeroView", pid)
            call SetFrameTexture(frame1, HeroIcon2[MemoHero[pid]] , 0, true)
            set z = reviveTimer[pid]
            call SaveInteger(ht, GetHandleId(z) , 0, pid)
            call TimerStart(z, 1, true, function reviveUnit)
        endif

        set z = null
        set u = null
        set p = null
        set frame1 = null
    endfunction
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_DEATH, function onRevive)
    endfunction
endscope