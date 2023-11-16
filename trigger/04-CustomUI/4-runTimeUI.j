library runTimeUI uses Utilities

    private function UpdateDefaultUI takes nothing returns nothing
        local string str = ""
        local player p
        local integer pid
        local unit u 
        local framehandle frame1
        local framehandle frame2
        local integer int1
        local integer i
        local real real1
        local real real2
        local real real3
        local integer userid
        
        set i = 0
        loop
            exitwhen i > 11
            set p = Player(i)
            set pid = GetPlayerId(p)
            set u = MainUnit[pid]
            set userid = GetUnitUserData(u)
            if u != null then
                set frame1 = GetFrameByName("StatText", 0)
                if IsUnitAlive(u) then
                    if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_STR then
                        set str = "|cffFFD600" + I2S(GetHeroStr(u, true))
                    else
                        set str = I2S(GetHeroStr(u, true))
                    endif
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("StatText", 1)
                if IsUnitAlive(u) then
                    if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_AGI then
                        set str = "|cffFFD600" + I2S(GetHeroAgi(u, true))
                    else
                        set str = I2S(GetHeroAgi(u, true))
                    endif
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("StatText", 2)
                if IsUnitAlive(u) then
                    if GetUnitPrimaryStat(u) == HERO_ATTRIBUTE_INT then
                        set str = "|cffFFD600" + I2S(GetHeroInt(u, true))
                    else
                        set str = I2S(GetHeroInt(u, true))
                    endif
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("StatText", 3)
                if IsUnitAlive(u) then
                    set real1 = GetUnitAttackSpeed(u)
                    if real1 > GetAttackSpeedMaxBonus() then
                        set real1 = GetAttackSpeedMaxBonus()
                    endif
                    set real1 = GetUnitAttackCooldownByIndex(u, 0) / real1
                    set str = I2S(GetUnitBaseDamageByIndex(u, 0)) + " / " + R2S(real1)
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("StatText", 4)
                if IsUnitAlive(u) then
                    set str = I2S(R2I(GetUnitArmour(u))) + " / " + I2S(R2I(GetUnitMoveSpeed(u)))
                else
                    set str = ""
                endif
                if IsUnitInvulnerable(u) then
                    set str = "|cffFFD600INVUL"
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("StatText", 5)
                if IsUnitAlive(u) then
                    set str = R2SW(OmniVamp[userid] * 100, 0, 2) + "%"
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("StatText", 6)
                if IsUnitAlive(u) then
                    set str = I2S(R2I(AbilityHaste[userid]))
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif
                
                set frame1 = GetFrameByName("StatText", 7)
                if IsUnitAlive(u) then
                    if CritRATE[userid] < 60 then
                        set str = I2S(CritRATE[userid]) + "%"
                    else
                        set str = "60%"
                    endif
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif
                
                set frame1 = GetFrameByName("StatText", 8)
                if IsUnitAlive(u) then
                    set str = R2SW(CritDMG[userid] * 100, 0, 2) + "%"
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif
                
                set frame1 = GetFrameByName("StatText", 9)
                if IsUnitAlive(u) then
                    set str = R2SW(CritResist[userid] * 100, 0, 2) + "%"
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("XPText", 0)
                if IsUnitAlive(u) then
                    set str = "Level " + I2S(GetHeroLevel(u)) + " " + GetUnitStringField(u, UNIT_SF_NAME)
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("HPText", 0)
                if IsUnitAlive(u) then
                    set real1 = hpreg[userid] * hpreg2[userid]
                    set str = I2S(R2I(GetUnitCurrentLife(u))) + " (+" + R2S(real1) + ")"
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("MPText", 0)
                if IsUnitAlive(u) then
                    set real1 = mpreg[userid] * mpreg2[userid]
                    set str = I2S(R2I(GetUnitCurrentMana(u))) + " (+" + R2S(real1) + ")"
                else
                    set str = ""
                endif
                if GetFrameText(frame1) != str and GetLocalPlayer() == p then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("HPForeground", 0)
                if IsUnitAlive(u) then
                    set real1 = GetUnitLifePercent(u)
                else
                    set real1 = 100
                endif
                if GetFrameValue(frame1) != real1 and GetLocalPlayer() == p then
                    call SetFrameValue(frame1, real1)
                endif

                set frame1 = GetFrameByName("MPForeground", 0)
                if IsUnitAlive(u) then
                    set real1 = GetUnitManaPercent(u)
                else
                    set real1 = 100
                endif
                if GetFrameValue(frame1) != real1 and GetLocalPlayer() == p then
                    call SetFrameValue(frame1, real1)
                endif
                
                set frame1 = GetFrameByName("XPForeground", 0)
                if IsUnitAlive(u) then
                    if IsUnitHero(u) then
                        if GetHeroLevel(u) == 40 then
                            set real3 = 1
                        elseif GetHeroLevel(u) > 1 then
                            set real1 = GetHeroExperienceNeeded(u, GetHeroLevel(u))
                            set real2 = GetHeroExperienceNeeded(u, GetHeroLevel(u) - 1)
                            set real3 = (GetHeroXP(u) - real2) / (real1 - real2)
                        else
                            set real1 = GetHeroExperienceNeeded(u, GetHeroLevel(u))
                            set real3 = GetHeroXP(u) / real1
                        endif
                    endif
                else
                    set real3 = 1
                endif
                if GetFrameValue(frame1) != real3 and GetLocalPlayer() == p then
                    call SetFrameValue(frame1, real3)
                endif
            endif
            set i = i + 1
        endloop
        
        set p = null
        set u = null
        set frame1 = null
        set frame2 = null
    endfunction
    
    function runTimeUIPeriod takes nothing returns nothing
        local string str = ""
        local framehandle frame1
        local framehandle frame2
        local boolean key
        
        set frame1 = GetFrameByName("ScoreBoard", 0)
        set frame2 = GetFrameByName("ShopMainBorder", 0)
        set key = IsKeyPressed(OSKEY_TAB) and IsWindowActive() and not IsFrameVisible(frame2)
        if frame1 != null then
            if key then
                if not IsFrameVisible(frame1) then
                    call ShowFrame(frame1, true)
                endif
            else
                if IsFrameVisible(frame1) then
                    call ShowFrame(frame1, false)
                endif
            endif
        endif
        call UpdateScoreBoard()
        call UpdateDefaultUI()
        
        set frame1 = null
        set frame2 = null
    endfunction

    globals
        private boolean isActive = false
    endglobals
    
    function callRunTimeUI takes nothing returns nothing
        if not isActive then
            set isActive = true
            call TimerStart(CreateTimer() , 0.1, true, function runTimeUIPeriod)
        endif
    endfunction
endlibrary