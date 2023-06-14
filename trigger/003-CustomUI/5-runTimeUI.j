//TESH.scrollpos=37
//TESH.alwaysfold=0
library runTimeUI uses Utilities InteractionUI

    private function updateDefaultUI takes nothing returns nothing
        local player p = GetEnumPlayer()
        local integer pid = GetPlayerId(p)
        local unit u = MainUnit[pid]
        local framehandle pFrame
        local framehandle pFrame2
        local integer stat = 0
        local integer i = 0
        local real rStat = 0
        local real rStat2 = 0
        local real rStat3 = 0
        local string s = ""
        local string s2 = ""
        
        if u != null then
            if IsUnitInRange(MainHero[pid], u, 1200) and (GetUnitTypeId(u) == 'n00C' or GetUnitTypeId(u) == 'n009' or GetUnitTypeId(u) == 'n00B' or GetUnitTypeId(u) == 'n004' or GetUnitTypeId(u) == 'n006') then
                set pFrame = GetFrameByName("ShopBordir", 0)
                if GetLocalPlayer() == p and not IsFrameVisible(pFrame) then
                    call ShowFrame(pFrame, true)
                endif
            else
                set pFrame = GetFrameByName("ShopBordir", 0)
                if GetLocalPlayer() == p and IsFrameVisible(pFrame) then
                    call ShowFrame(pFrame, false)
                endif
            endif
            
            set pFrame = GetFrameByName("StatText", 0)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = GetHeroStr(u, true)
                if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_STR then
                    set s = "|cffFFD600" + I2S(stat)
                else
                    set s = I2S(stat)
                endif
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            set pFrame = GetFrameByName("StatText", 1)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = GetHeroAgi(u, true)
                if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_AGI then
                    set s = "|cffFFD600" + I2S(stat)
                else
                    set s = I2S(stat)
                endif
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            set pFrame = GetFrameByName("StatText", 2)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = GetHeroInt(u, true)
                if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_INT then
                    set s = "|cffFFD600" + I2S(stat)
                else
                    set s = I2S(stat)
                endif
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            set pFrame = GetFrameByName("StatText", 3)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = R2I(GetUnitMoveSpeed(u))
                set s = I2S(stat)
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            set pFrame = GetFrameByName("StatText", 4)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = GetUnitTotalDamage(u)
                set s = I2S(stat)
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            set pFrame = GetFrameByName("StatText", 5)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = R2I(GetUnitArmour(u))
                set s = I2S(stat)
            endif
            if IsUnitInvulnerable(u) then
                set s = "|cffFFD600" + "INVUL"
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            set pFrame = GetFrameByName("HeroNameText", 0)
            if not IsUnitAlive(u) then
                set s2 = ""
            else
                set stat = GetHeroLevel(u)
                set s = GetUnitStringField(u, UNIT_SF_NAME)
                set s2 = "|cffFFD600" + "Level " + I2S(stat) + " " + s
            endif
            if GetFrameText(pFrame) != s2 and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s2)
            endif

            set pFrame = GetFrameByName("SustainText", 0)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = R2I(GetUnitCurrentLife(u))
                set rStat = GetUnitLifeRegen(u)
                set s = "|cff370101" + I2S(stat) + " (+" + R2S(rStat) + ")|r"
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            set pFrame = GetFrameByName("SustainText", 1)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set stat = R2I(GetUnitCurrentMana(u))
                set rStat = GetUnitManaRegen(u)
                set s = "|cff372C2C" + I2S(stat) + " (+" + R2S(rStat) + ")|r"
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        
            if not IsUnitAlive(u) then
                set rStat = 0
            else
                set rStat = I2R(R2I(GetUnitLifePercent(u)))
            endif
            if GetFrameValue(pHPBar) != rStat and GetLocalPlayer() == p then
                call SetFrameValue(pHPBar, rStat)
            endif
            
            if not IsUnitAlive(u) then
                set rStat = 0
            else
                set rStat = I2R(R2I(GetUnitManaPercent(u)))
            endif
            if GetFrameValue(pMPBar) != rStat and GetLocalPlayer() == p then
                call SetFrameValue(pMPBar, rStat)
            endif
            
            if IsUnitHero(u) then
                if GetHeroLevel(u) == 40 then
                    set rStat3 = 100
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
                if GetFrameValue(pXPBar) != rStat3 and GetLocalPlayer() == p then
                    call SetFrameValue(pXPBar, rStat3)
                endif
            else
                if GetFrameValue(pXPBar) != 0 and GetLocalPlayer() == p then
                    call SetFrameValue(pXPBar, 0)
                endif
            endif
            
            set pFrame = GetFrameByName("StatText", 6)
            if not IsUnitAlive(u) then
                set s = ""
            else
                set rStat = GetUnitAttackSpeed(u)
                if rStat > 5 then
                    set rStat = 5
                endif
                set rStat2 = GetUnitAttackCooldownByIndex(u, 0) / rStat
                set s = R2S(rStat2) + "s"
            endif
            if GetFrameText(pFrame) != s and GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif
        endif
        
        set p = null
        set u = null
        set pFrame = null
        set pFrame2 = null
    endfunction

    globals
        timer TourTimer = null
        string TourName = ""
        integer TourTime = 0
        integer updateCount = 0
        boolean array CDButton
    endglobals
    
    function runTimeUIPeriod takes nothing returns nothing
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        local framehandle pFrame4
        local string s = ""
        local string s2 = ""
        local integer stat
        local real percent
        local boolean keypress
        local integer pid = GetPlayerId(GetLocalPlayer())
        local integer gold
        local integer i
        
        set updateCount = updateCount + 1
        
        if updateCount == 10 then
        
            set i = 1
            loop
                exitwhen i > 3
                if UserPlayer(Player(i)) then
                    set pFrame = GetFrameByName("TextPlayerGold", i)
                    set gold = GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD)
                    set s = "|cffDAA520" + I2S(gold)
                    if IsPlayerInForce(GetLocalPlayer(), team1) then
                        call SetFrameText(pFrame, s)
                    endif
                endif
                set i = i + 1
            endloop
            
            set i = 5
            loop
                exitwhen i > 7
                if UserPlayer(Player(i)) then
                    set pFrame = GetFrameByName("TextPlayerGold", i)
                    set gold = GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD)
                    set s = "|cffDAA520" + I2S(gold)
                    if IsPlayerInForce(GetLocalPlayer(), team2) then
                        call SetFrameText(pFrame, s)
                    endif
                endif
                set i = i + 1
            endloop
            
            set i = 9
            loop
                exitwhen i > 11
                if UserPlayer(Player(i)) then
                    set pFrame = GetFrameByName("TextPlayerGold", i)
                    set gold = GetPlayerState(Player(i), PLAYER_STATE_RESOURCE_GOLD)
                    set s = "|cffDAA520" + I2S(gold)
                    if IsPlayerInForce(GetLocalPlayer(), team3) then
                        call SetFrameText(pFrame, s)
                    endif
                endif
                set i = i + 1
            endloop
        
        endif
        
        set pFrame = GetFrameByName("TextTour", 0)
        if TourTime > 0 then
            set s = TourName + " : " + I2S(TourTime)
            call SetFrameText(pFrame, s)
        else
            if GetFrameText(pFrame) != "" then
                call SetFrameText(pFrame, "")
            endif
        endif

        if BossStart then
            set pFrame = GetFrameByName("StatInfoBordir", 4)
            set pFrame2 = GetFrameByName("SustainPercentText", 0)
            set pFrame3 = GetFrameByName("CustomHPBar2", 1)
            set percent = GetUnitLifePercent(gg_unit_H0DS_0066)
            set s = "|cffE6E6E6" + R2S(percent) + "%"
            set pFrame4 = GetFrameByName("SustainText2", 0)
            set stat = R2I(GetUnitCurrentLife(gg_unit_H0DS_0066))
            set s2 = "|cffE6E6E6" + I2S(stat)
            if IsFrameVisible(pFrame) then
                call SetFrameText(pFrame2, s)
                call SetFrameValue(pFrame3, percent)
                call SetFrameText(pFrame4, s2)
            endif
        endif
        
        set pFrame = GetFrameByName("VoiceBordir", 0)
        set keypress = IsKeyPressed(OSKEY_V) and IsWindowActive()
        if pFrame != null then
            if keypress then
                if not IsFrameVisible(pFrame) then
                    call ShowFrame(pFrame, true)
                endif
            else
                if IsFrameVisible(pFrame) then
                    call ShowFrame(pFrame, false)
                endif
            endif
        endif
        
        set pFrame = GetFrameByName("HeroBack2ground", 0)
        set keypress = IsKeyPressed(OSKEY_TAB) and IsWindowActive()
        if pFrame != null then
            if keypress then
                if not IsFrameVisible(pFrame) then
                    call ShowFrame(pFrame, true)
                endif
            else
                if IsFrameVisible(pFrame) then
                    call ShowFrame(pFrame, false)
                endif
            endif
            
            if updateCount == 10 then
                call UpdateScoreBoard()
            endif
        endif
        
        if updateCount >= 10 then
            set updateCount = 0
        endif
        
        call ForForce(bj_FORCE_ALL_PLAYERS, function updateDefaultUI)
        
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
        set pFrame4 = null
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