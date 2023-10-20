library runTimeUI uses Utilities

    private function updateDefaultUI takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer pid = GetPlayerId(p)
        local unit u = MainUnit[pid]
        local framehandle frame1
        local framehandle frame2
        local integer iStat = 0
        local integer i = 0
        local real rStat = 0
        local real rStat2 = 0
        local real rStat3 = 0
        local string str = ""
        
        if u != null then
            set frame1 = GetFrameByName("ShopMainFrame", 0)
            set frame2 = GetFrameByName("ShopItemTipFrame", 0)
            if GetUnitTypeId(u) == 'n00C' or GetUnitTypeId(u) == 'n009' or GetUnitTypeId(u) == 'n00B' or GetUnitTypeId(u) == 'n004' or GetUnitTypeId(u) == 'n006' then
                if GetLocalPlayer() == p and not IsFrameVisible(frame1) then
                    call ShowFrame(frame1, true)
                    call ShowFrame(shopItemSprite, false)
                    call SetFrameText(frame2, "")
                endif
            else
                if GetLocalPlayer() == p and IsFrameVisible(frame1) then
                    call ShowFrame(frame1, false)
                endif
            endif
            
            set frame1 = GetFrameByName("MainStatTxtFrame", 0)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = GetHeroStr(u, true)
                if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_STR then
                    set str = "|cffFFD600" + I2S(iStat)
                else
                    set str = I2S(iStat)
                endif
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif
        
            set frame1 = GetFrameByName("MainStatTxtFrame", 1)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = GetHeroAgi(u, true)
                if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_AGI then
                    set str = "|cffFFD600" + I2S(iStat)
                else
                    set str = I2S(iStat)
                endif
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif
        
            set frame1 = GetFrameByName("MainStatTxtFrame", 2)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = GetHeroInt(u, true)
                if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_INT then
                    set str = "|cffFFD600" + I2S(iStat)
                else
                    set str = I2S(iStat)
                endif
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif
        
            set frame1 = GetFrameByName("MainStatTxtFrame", 3)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = GetUnitTotalDamage(u)
                set rStat = GetUnitAttackSpeed(u)
                if rStat > 5 then
                    set rStat = 5
                endif
                set rStat2 = GetUnitAttackCooldownByIndex(u, 0) / rStat
                set str = I2S(iStat) + " / " + R2SW(rStat2, 0, 2) + "s"
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif
        
            set frame1 = GetFrameByName("MainStatTxtFrame", 4)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = R2I(GetUnitArmour(u))
                set str = I2S(iStat)
            endif
            if IsUnitInvulnerable(u) then
                set str = "|cffFFD600" + "INVUL"
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif
        
            set frame1 = GetFrameByName("XPStatusTxtFrame", 0)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = GetHeroLevel(u)
                set str = "Level " + I2S(iStat) + " " + GetUnitStringField(u, UNIT_SF_NAME)
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif

            set frame1 = GetFrameByName("HPStatusTxtFrame", 0)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = R2I(GetUnitCurrentLife(u))
                set rStat = GetUnitLifeRegen(u)
                set str = I2S(iStat) + " (+" + R2S(rStat) + ")|r"
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif
        
            set frame1 = GetFrameByName("MPStatusTxtFrame", 0)
            if not IsUnitAlive(u) then
                set str = ""
            else
                set iStat = R2I(GetUnitCurrentMana(u))
                set rStat = GetUnitManaRegen(u)
                set str = I2S(iStat) + " (+" + R2S(rStat) + ")|r"
            endif
            if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                call SetFrameText(frame1, str)
            endif

            set frame1 = GetFrameByName("HPStatusFrame", 1)
            if not IsUnitAlive(u) then
                set rStat = 0
            else
                set rStat = I2R(R2I(GetUnitLifePercent(u)))
            endif
            if GetFrameValue(frame1) != rStat and GetLocalPlayer() == p then
                call SetFrameValue(frame1, rStat)
            endif
            
            set frame1 = GetFrameByName("MPStatusFrame", 1)
            if not IsUnitAlive(u) then
                set rStat = 0
            else
                set rStat = I2R(R2I(GetUnitManaPercent(u)))
            endif
            if GetFrameValue(frame1) != rStat and GetLocalPlayer() == p then
                call SetFrameValue(frame1, rStat)
            endif
            
            set frame1 = GetFrameByName("XPStatusFrame", 1)
            if IsUnitHero(u) then
                if GetHeroLevel(u) == 40 then
                    set rStat3 = 1
                elseif GetHeroLevel(u) > 1 then
                    set rStat = GetHeroExperienceNeeded(u, GetHeroLevel(u) - 1)
                    set rStat2 = GetHeroExperienceNeeded(u, GetHeroLevel(u))
                    set rStat3 = (GetHeroXP(u) - rStat) / (rStat2 - rStat)
                else
                    set rStat2 = GetHeroExperienceNeeded(u, GetHeroLevel(u))
                    set rStat3 = GetHeroXP(u) / rStat2
                endif
                if not IsUnitAlive(u) then
                    set rStat3 = 0
                endif
                if GetFrameValue(frame1) != rStat3 and GetLocalPlayer() == p then
                    call SetFrameValue(frame1, rStat3)
                endif
            else
                if GetFrameValue(frame1) != 0 and GetLocalPlayer() == p then
                    call SetFrameValue(frame1, 0)
                endif
            endif
        endif
        
        set p = null
        set u = null
        set frame1 = null
        set frame2 = null
    endfunction

    globals
        integer updateCount = 0
        boolean array CDButton
    endglobals
    
    function runTimeUIPeriod takes nothing returns nothing
        local framehandle frame1
        local framehandle frame2
        local framehandle frame3
        local string str = ""
        local boolean keypress

        call ForForce(bj_FORCE_ALL_PLAYERS, function updateDefaultUI)
        
        set frame1 = GetFrameByName("TourTxtFrame", 0)
        if TourTime > 0 then
            set str = TourName + " : " + I2S(TourTime)
            call SetFrameText(frame1, str)
        else
            if GetFrameText(frame1) != "" then
                call SetFrameText(frame1, "")
            endif
        endif
        
        set frame1 = GetFrameByName("BoardMainFrame", 0)
        set frame2 = GetFrameByName("ShopMainFrame", 0)
        set frame3 = GetFrameByName("VoiceBox", 0)
        set keypress = IsKeyPressed(OSKEY_TAB) and IsWindowActive() and not IsFrameVisible(frame2) and not IsFrameVisible(frame3)
        if frame1 != null then
            if keypress then
                if not IsFrameVisible(frame1) then
                    call ShowFrame(frame1, true)
                endif
            else
                if IsFrameVisible(frame1) then
                    call ShowFrame(frame1, false)
                endif
            endif

            set updateCount = updateCount + 1
            if updateCount >= 10 then
                call UpdateScoreBoard()
                set updateCount = 0
            endif
        endif
        
        set frame1 = GetFrameByName("VoiceBox", 0)
        set frame2 = GetFrameByName("BoardMainFrame", 0)
        set frame3 = GetFrameByName("ShopMainFrame", 0)
        set keypress = IsKeyPressed(OSKEY_V) and IsWindowActive() and not IsFrameVisible(frame2) and not IsFrameVisible(frame3)
        if frame1 != null then
            if keypress then
                if not IsFrameVisible(frame1) then
                    call ShowFrame(frame1, true)
                endif
            else
                if IsFrameVisible(frame1) then
                    call ShowFrame(frame1, false)
                endif
            endif
        endif
        
        set frame1 = null
        set frame2 = null
        set frame3 = null
    endfunction

    globals
        private boolean isActive = false
    endglobals
    
    function callRunTimeUI takes nothing returns nothing
        if not isActive then
            set isActive = true
            call TimerStart(CreateTimer(), 0.1, true, function runTimeUIPeriod)
        endif
    endfunction
endlibrary