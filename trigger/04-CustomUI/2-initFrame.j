library initFrame uses Utilities
    function AncestorFrame takes nothing returns nothing
        call EditBlackBorders(0, 0)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , FRAMEPOINT_TOPLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPLEFT, 10.0, 0)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , FRAMEPOINT_TOPRIGHT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPRIGHT, - 10.0, 0)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_HERO_BAR, 0) , FRAMEPOINT_TOPLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPLEFT, 0.0, 1.0)
        call SetFrameRelativePoint(GetFrameByName("ResourceBarFrame", 0) , FRAMEPOINT_TOPRIGHT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPRIGHT, 10.0, 0.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarQuestsButton", 0) , FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarMenuButton", 0) , FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarAlliesButton", 0) , FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarChatButton", 0) , FRAMEPOINT_LEFT, 0.0, 1.0)
        call ShowFrame(GetOriginFrame(ORIGIN_FRAME_TIME_OF_DAY_INDICATOR, 0) , false)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0))
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0))
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0))

        call LoadTOCFile("war3mapImported\\RveFrame.toc")
    endfunction

    globals
        string array HeroVoice
        string array HeroIcon
        string array HeroIcon2
        string array HeroPhoto
        integer array HeroType
        private integer heroId = 1
    endglobals
    
    private function SetHeroData takes integer uid, string vc1, string ic1 returns nothing
        local string str = ""
        set HeroType[heroId] = uid
            
        if vc1 != "" then
            set str = "war3mapImported\\" + vc1
        else
            set str = ""
        endif
        set HeroVoice[heroId] = str
    
        if ic1 != "" then
            set str = "PhotoPath\\" + ic1
        else
            set str = ""
        endif
        set HeroIcon[heroId] = str
    
        if ic1 != "" then
            set str = "PhotoPathDis\\" + ic1
        else
            set str = ""
        endif
        set HeroIcon2[heroId] = str
            
        if ic1 != "" then
            set str = "Portraited\\" + ic1
        else
            set str = ""
        endif
        set HeroPhoto[heroId] = str
            
        set heroId = heroId + 1
    endfunction

    globals
        integer MaxHero = 0
    endglobals
    
    function InitHeroData takes nothing returns nothing
        call SetHeroData('H046', "aizenpick.mp3", "aizen-icon.blp")
        
        call SetHeroData('H00J', "akamepick.mp3", "akame-icon.blp")
        
        call SetHeroData('H01B', "alphapick.mp3", "alpha-icon.blp")
        
        call SetHeroData('H011', "alicepick.mp3", "alice-icon.blp")
        
        call SetHeroData('H016', "arthurpick.mp3", "arthur-icon.blp")
        
        call SetHeroData('H010', "cloudpick.mp3", "clouds-icon.blp")
        
        call SetHeroData('H004', "emiyapick.mp3", "shirou-icon.blp")
        
        call SetHeroData('H0G2', "escanorpick.mp3", "escanor-icon.blp")

        call SetHeroData('H063', "mokitapick.mp3", "mokita-icon.blp")
        
        call SetHeroData('H00M', "ogitapick.mp3", "ogita-icon.blp")
        
        call SetHeroData('H0BM', "acepick.mp3", "ace-icon.blp")
        
        call SetHeroData('H013', "salterpick.mp3", "salter-icon.blp")
        
        call SetHeroData('H0CT', "izayoipick.mp3", "izayoi-icon.blp")

        call SetHeroData('H02E', "satomipick.mp3", "satomi-icon.blp")
        
        call SetHeroData('H0G1', "toshiropick.mp3", "toshiro-icon.blp")
        
        call SetHeroData('H03E', "shupick.mp3", "omashu-icon.blp")
        
        call SetHeroData('H05R', "vegetapick.mp3", "vegeta-icon.blp")
    
        set MaxHero = heroId - 1
    endfunction

    globals
        real SelectHeroTime = 30
    endglobals

    function FrameFocus takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()

        if GetLocalPlayer() == p then
            call SetFrameEnabled(tFrame, false)
            call SetFrameEnabled(tFrame, true)
        endif

        set p = null
        set tFrame = null
    endfunction

    globals
        integer array MemoHero
        boolean array HeroGone
        boolean array SelectedYet
        boolean array BanYet
    endglobals

    function HeroButtonClick takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local mousebuttontype mouse = GetTriggerFrameMouseButton()
        local integer fid = LoadInteger(ht, StringHash("HeroIndex") , GetHandleId(tFrame))
        local integer pid = GetPlayerId(p)
        local framehandle frame1

        if GetLocalPlayer() == p then
            call SetFrameEnabled(tFrame, false)
            call SetFrameEnabled(tFrame, true)
        endif

        if not LoadBoolean(ht, StringHash("FilterHero_" + I2S(pid)) , GetHandleId(tFrame)) and UserPlayer(p) then
            if mouse == MOUSE_BUTTON_TYPE_LEFT and not SelectedYet[pid] and not HeroGone[fid] then
                set MemoHero[pid] = fid

                set frame1 = GetFrameByName("SelectionHeroView", pid)
                call SetFrameTexture(frame1, HeroIcon[fid] , 0, false)

                set frame1 = GetFrameByName("SelectionHeroButtonIcon", fid)
                call SetFrameTexture(frame1, HeroIcon2[fid] , 0, false)

                if HeroVoice[fid] != "" then
                    call SoundStartPlayer(HeroVoice[fid] , p, true)
                endif

                set HeroGone[fid] = true
                set SelectedYet[pid] = true
            endif

            if mouse == MOUSE_BUTTON_TYPE_RIGHT and not SelectedYet[pid] and not BanYet[pid] and not HeroGone[fid] then
                set frame1 = GetFrameByName("SelectionHeroButtonIcon", fid)
                call SetFrameTexture(frame1, HeroIcon2[fid] , 0, false)

                set HeroGone[fid] = true
                set BanYet[pid] = true
            endif
        endif

        set p = null
        set tFrame = null
        set frame1 = null
        set mouse = null
    endfunction

    globals
        real array HeroIconX
        real array HeroIconY
    endglobals

    function ScrollHeroSelection takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle frame1 = GetFrameByName("SelectionHeroScroll", 0)
        local real fval = GetTriggerFrameReal()

        if fval > 0 then
            if GetLocalPlayer() == p then
                call SetFrameValue(frame1, GetFrameValue(frame1) + 1)
            endif
        else
            if GetLocalPlayer() == p then
                call SetFrameValue(frame1, GetFrameValue(frame1) - 1)
            endif
        endif

        set p = null
        set frame1 = null
    endfunction

    function HeroSelectionSlider takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local real fval = GetTriggerFrameReal()
        local integer i = 1
        local integer j = 0
        local integer k = 0
        local framehandle frame1
        local framehandle frame2

        loop
            exitwhen i > MaxHero
            set frame1 = GetFrameByName("SelectionHeroButton", i)
            if IsFrameVisible(frame1) and GetLocalPlayer() == p then
                call ShowFrame(frame1, false)
            endif
            set i = i + 1
        endloop

        if fval == 1 then
            set frame1 = GetFrameByName("SelectionHeroMain", 0)
            set i = 1
            loop
                exitwhen i > MaxHero
                if i >= 1 and i <= 100 then
                    set frame2 = GetFrameByName("SelectionHeroButton", i)
                    set HeroIconX[j] = 0.01 + 0.035 * j
                    set HeroIconY[k] = - 0.01 - 0.035 * k
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, HeroIconX[j] , HeroIconY[k])
                        if not IsFrameVisible(frame2) then
                            call ShowFrame(frame2, true)
                        endif
                    endif
                    set j = j + 1
                    if j >= 10 then
                        set j = 0
                        set k = k + 1
                    endif
                endif
                set i = i + 1
            endloop
        elseif fval == 0 then
            set frame1 = GetFrameByName("SelectionHeroMain", 0)
            set i = 1
            loop
                exitwhen i > MaxHero
                if i >= 11 and i <= 110 then
                    set frame2 = GetFrameByName("SelectionHeroButton", i)
                    set HeroIconX[j] = 0.01 + 0.035 * j
                    set HeroIconY[k] = - 0.01 - 0.035 * k
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, HeroIconX[j] , HeroIconY[k])
                        if not IsFrameVisible(frame2) then
                            call ShowFrame(frame2, true)
                        endif
                    endif
                    set j = j + 1
                    if j >= 10 then
                        set j = 0
                        set k = k + 1
                    endif
                endif
                set i = i + 1
            endloop
        endif

        set p = null
        set frame1 = null
        set frame2 = null
    endfunction

    globals
        boolean array FilterStr
        boolean array FilterAgi
        boolean array FilterInt
    endglobals

    function FilterStrength takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local integer pid = GetPlayerId(p)
        local framehandle frame1
        local framehandle frame2
        local integer i

        if GetLocalPlayer() == p then
            call SetFrameEnabled(tFrame, false)
            call SetFrameEnabled(tFrame, true)
        endif

        if not FilterAgi[pid] and not FilterInt[pid] then
            if not FilterStr[pid] then
                set FilterStr[pid] = true
                set frame1 = GetFrameByName("SelectionHeroFilter", 0)
                if GetLocalPlayer() == p then
                    call SetFrameTexture(frame1, GetDisabledIcon(GetFrameTexture(frame1, 0)) , 0, false)
                endif
                set i = 1
                loop
                    exitwhen i > MaxHero
                    set frame1 = GetFrameByName("SelectionHeroButton", i)
                    if GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_PRIMARY_ATTRIBUTE) != 1 and not HeroGone[i] then
                        set frame2 = GetFrameByName("SelectionHeroButtonIcon", i)
                        if GetLocalPlayer() == p then
                            call SetFrameTexture(frame2, HeroIcon2[i] , 0, false)
                        endif
                        call SaveBoolean(ht, StringHash("FilterHero_" + I2S(pid)) , GetHandleId(frame1) , true)
                    endif
                    set i = i + 1
                endloop
            else
                set FilterStr[pid] = false
                set frame1 = GetFrameByName("SelectionHeroFilter", 0)
                if GetLocalPlayer() == p then
                    call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp", 0, false)
                endif
                set i = 1
                loop
                    exitwhen i > MaxHero
                    set frame1 = GetFrameByName("SelectionHeroButton", i)
                    if GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_PRIMARY_ATTRIBUTE) != 1 and not HeroGone[i] then
                        set frame2 = GetFrameByName("SelectionHeroButtonIcon", i)
                        if GetLocalPlayer() == p then
                            call SetFrameTexture(frame2, HeroIcon[i] , 0, false)
                        endif
                        call SaveBoolean(ht, StringHash("FilterHero_" + I2S(pid)) , GetHandleId(frame1) , false)
                    endif
                    set i = i + 1
                endloop
            endif
        endif

        set p = null
        set tFrame = null
        set frame1 = null
        set frame2 = null
    endfunction

    function FilterAgility takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local framehandle frame1
        local framehandle frame2
        local integer pid = GetPlayerId(p)
        local integer i

        if GetLocalPlayer() == p then
            call SetFrameEnabled(tFrame, false)
            call SetFrameEnabled(tFrame, true)
        endif

        if not FilterStr[pid] and not FilterInt[pid] then
            if not FilterAgi[pid] then
                set FilterAgi[pid] = true
                set frame1 = GetFrameByName("SelectionHeroFilter", 1)
                if GetLocalPlayer() == p then
                    call SetFrameTexture(frame1, GetDisabledIcon(GetFrameTexture(frame1, 0)) , 0, false)
                endif
                set i = 1
                loop
                    exitwhen i > MaxHero
                    set frame1 = GetFrameByName("SelectionHeroButton", i)
                    if GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_PRIMARY_ATTRIBUTE) != 3 and not HeroGone[i] then
                        set frame2 = GetFrameByName("SelectionHeroButtonIcon", i)
                        if GetLocalPlayer() == p then
                            call SetFrameTexture(frame2, HeroIcon2[i] , 0, false)
                        endif
                        call SaveBoolean(ht, StringHash("FilterHero_" + I2S(pid)) , GetHandleId(frame1) , true)
                    endif
                    set i = i + 1
                endloop
            else
                set FilterAgi[pid] = false
                set frame1 = GetFrameByName("SelectionHeroFilter", 1)
                if GetLocalPlayer() == p then
                    call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp", 0, false)
                endif
                set i = 1
                loop
                    exitwhen i > MaxHero
                    set frame1 = GetFrameByName("SelectionHeroButton", i)
                    if GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_PRIMARY_ATTRIBUTE) != 3 and not HeroGone[i] then
                        set frame2 = GetFrameByName("SelectionHeroButtonIcon", i)
                        if GetLocalPlayer() == p then
                            call SetFrameTexture(frame2, HeroIcon[i] , 0, false)
                        endif
                        call SaveBoolean(ht, StringHash("FilterHero_" + I2S(pid)) , GetHandleId(frame1) , false)
                    endif
                    set i = i + 1
                endloop
            endif
        endif

        set p = null
        set tFrame = null
        set frame1 = null
        set frame2 = null
    endfunction

    function FilterIntelligence takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local framehandle frame1
        local framehandle frame2
        local integer pid = GetPlayerId(p)
        local integer i

        if GetLocalPlayer() == p then
            call SetFrameEnabled(tFrame, false)
            call SetFrameEnabled(tFrame, true)
        endif

        if not FilterStr[pid] and not FilterAgi[pid] then
            if not FilterInt[pid] then
                set FilterInt[pid] = true
                set frame1 = GetFrameByName("SelectionHeroFilter", 2)
                if GetLocalPlayer() == p then
                    call SetFrameTexture(frame1, GetDisabledIcon(GetFrameTexture(frame1, 0)) , 0, false)
                endif
                set i = 1
                loop
                    exitwhen i > MaxHero
                    set frame1 = GetFrameByName("SelectionHeroButton", i)
                    if GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_PRIMARY_ATTRIBUTE) != 2 and not HeroGone[i] then
                        set frame2 = GetFrameByName("SelectionHeroButtonIcon", i)
                        if GetLocalPlayer() == p then
                            call SetFrameTexture(frame2, HeroIcon2[i] , 0, false)
                        endif
                        call SaveBoolean(ht, StringHash("FilterHero_" + I2S(pid)) , GetHandleId(frame1) , true)
                    endif
                    set i = i + 1
                endloop
            else
                set FilterInt[pid] = false
                set frame1 = GetFrameByName("SelectionHeroFilter", 2)
                if GetLocalPlayer() == p then
                    call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp", 0, false)
                endif
                set i = 1
                loop
                    exitwhen i > MaxHero
                    set frame1 = GetFrameByName("SelectionHeroButton", i)
                    if GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_PRIMARY_ATTRIBUTE) != 2 and not HeroGone[i] then
                        set frame2 = GetFrameByName("SelectionHeroButtonIcon", i)
                        if GetLocalPlayer() == p then
                            call SetFrameTexture(frame2, HeroIcon[i] , 0, false)
                        endif
                        call SaveBoolean(ht, StringHash("FilterHero_" + I2S(pid)) , GetHandleId(frame1) , false)
                    endif
                    set i = i + 1
                endloop
            endif
        endif

        set p = null
        set tFrame = null
        set frame1 = null
        set frame2 = null
    endfunction

    function createSelectionUI takes nothing returns nothing
        local framehandle mainFrame
        local framehandle frame1
        local framehandle frame2
        local framehandle frame3
        local trigger t
        local integer i
        local integer j
        local integer k

        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0) , FRAMEPOINT_BOTTOMLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_BOTTOMLEFT, 0.06, 0.07)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0) , FRAMEPOINT_BOTTOMLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_BOTTOMLEFT, 0.01, 0.04)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0) , FRAMEPOINT_TOPRIGHT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_BOTTOMLEFT, 0.3, 0.16)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0) , FRAMEPOINT_TOPLEFT, GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0) , FRAMEPOINT_BOTTOMLEFT, - 0.005, - 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0) , FRAMEPOINT_BOTTOMRIGHT, GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0) , FRAMEPOINT_BOTTOMRIGHT, 0, - 0.031)

        set mainFrame = CreateFrameByType("BACKDROP", "SelectionHeroMain", GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , "", 0) 
        call SetFrameBackdropTexture(mainFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\human-options-menu-border.blp", BORDER_FLAG_ALL, false)
        call SetFrameBorderSize(mainFrame, 0, 0.02)
        call SetFrameBackgroundInsets(mainFrame, 0, 0.004, 0.004, 0.004, 0.004)
        call SetFrameSize(mainFrame, 0.4, 0.36)
        call SetFrameRelativePoint(mainFrame, FRAMEPOINT_BOTTOM, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_BOTTOM, 0, 0.1)
        call ShowFrame(mainFrame, false)

        set frame1 = CreateFrameByType("BACKDROP", "SelectionHeroFilter", mainFrame, "", 0)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp", 0, false)
        call SetFrameSize(frame1, 0.03, 0.03)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_BOTTOMLEFT, mainFrame, FRAMEPOINT_TOPLEFT, 0, 0.005)
        set frame2 = CreateFrameByType("BUTTON", "SelectionHeroFilterButton", mainFrame, "", 0)
        call SetFrameAllPoints(frame2, frame1)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function FilterStrength)

        set frame1 = CreateFrameByType("BACKDROP", "SelectionHeroFilter", mainFrame, "", 1)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp", 0, false)
        call SetFrameSize(frame1, 0.03, 0.03)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_LEFT, GetFrameByName("SelectionHeroFilter", 0) , FRAMEPOINT_RIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("BUTTON", "SelectionHeroFilterButton", mainFrame, "", 1)
        call SetFrameAllPoints(frame2, frame1)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function FilterAgility)

        set frame1 = CreateFrameByType("BACKDROP", "SelectionHeroFilter", mainFrame, "", 2)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp", 0, false)
        call SetFrameSize(frame1, 0.03, 0.03)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_LEFT, GetFrameByName("SelectionHeroFilter", 1) , FRAMEPOINT_RIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("BUTTON", "SelectionHeroFilterButton", mainFrame, "", 2)
        call SetFrameAllPoints(frame2, frame1)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function FilterIntelligence)

        set frame1 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 1)
        call SetFrameTexture(frame1, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame1, 0.03, 0.03)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPLEFT, 0.01, - 0.01)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 2)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("SelectionHeroView", 1) , FRAMEPOINT_RIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 3)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("SelectionHeroView", 2) , FRAMEPOINT_RIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 4)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("SelectionHeroView", 3) , FRAMEPOINT_RIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 5)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("SelectionHeroView", 4) , FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 7)
        call SetFrameTexture(frame1, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame1, 0.03, 0.03)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPRIGHT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPRIGHT, - 0.01, - 0.01)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 8)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_RIGHT, GetFrameByName("SelectionHeroView", 7) , FRAMEPOINT_LEFT, - 0.001, 0)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 9)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_RIGHT, GetFrameByName("SelectionHeroView", 8) , FRAMEPOINT_LEFT, - 0.001, 0)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 10)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_RIGHT, GetFrameByName("SelectionHeroView", 9) , FRAMEPOINT_LEFT, - 0.001, 0)
        set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroView", mainFrame, "", 11)
        call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(frame2, 0.03, 0.03)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_RIGHT, GetFrameByName("SelectionHeroView", 10) , FRAMEPOINT_LEFT, - 0.001, 0)

        set frame1 = CreateFrameByType("BUTTON", "SelectionHeroScrollArea", mainFrame, "", 0)
        call SetFrameAllPoints(frame1, mainFrame)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function FrameFocus)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_MOUSE_WHEEL)
        call TriggerAddAction(t, function ScrollHeroSelection)

        set frame1 = CreateFrameByType("BACKDROP", "SelectionHeroTimer", mainFrame, "", 0)
        call SetFrameBackdropTexture(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\human-options-menu-border.blp", BORDER_FLAG_ALL, false)
        call SetFrameBorderSize(frame1, 0, 0.01)
        call SetFrameBackgroundInsets(frame1, 0, 0.004, 0.004, 0.004, 0.004)
        call SetFrameSize(frame1, 0.06, 0.04)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOP, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOP, 0, - 0.01)

        set frame2 = CreateFrameByType("TEXT", "SelectionHeroTimerText", frame1, "", 0)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.014, 0)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_CENTER, frame1, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(frame2, "")
        call SetFrameEnabled(frame2, false)

        set frame1 = CreateFrameByType("SCROLLBAR", "SelectionHeroScroll", mainFrame, "QuestMainListScrollBar", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameMinMaxValues(frame1, 0, 1)
        call SetFrameValue(frame1, 1)
        call SetFrameStepSize(frame1, 1)
        call SetFrameSize(frame1, 0.012, 0.26)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_RIGHT, mainFrame, FRAMEPOINT_RIGHT, - 0.01, 0)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_SLIDER_VALUE_CHANGED)
        call TriggerAddAction(t, function HeroSelectionSlider)

        call InitHeroData()
        set i = 1
        set j = 0 
        set k = 0
        loop
            exitwhen i > MaxHero
            set frame1 = CreateFrameByType("BUTTON", "SelectionHeroButton", mainFrame, "", i)
            call SetFrameSize(frame1, 0.03, 0.03)
            if k < 10 then
                set HeroIconX[j] = 0.01 + 0.035 * j
                set HeroIconY[k] = - 0.01 - 0.035 * k
                call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, HeroIconX[j] , HeroIconY[k])
            else
                call ShowFrame(frame1, false)
            endif
            set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroButtonIcon", frame1, "", i)
            call SetFrameAllPoints(frame2, frame1)
            call SetFrameTexture(frame2, HeroIcon[i] , 0, false)
            set frame2 = CreateFrameByType("BACKDROP", "SelectionHeroTip", frame1, "", i)
            call SetFrameBackdropTexture(frame2, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\human-options-menu-border.blp", BORDER_FLAG_ALL, false)
            call SetFrameBorderSize(frame2, 0, 0.01)
            call SetFrameBackgroundInsets(frame2, 0, 0.004, 0.004, 0.004, 0.004)
            set frame3 = CreateFrameByType("TEXT", "SelectionHeroTipText", frame2, "", i)
            call SetFrameTextAlignment(frame3, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
            call SetFrameFont(frame3, "Fonts\\FRIZQT__.TTF", 0.012, 0)
            call SetFrameWidth(frame3, 0.16)
            call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPRIGHT, 0.01, - 0.01)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_BOTTOMLEFT, frame3, FRAMEPOINT_BOTTOMLEFT, - 0.01, - 0.01)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPRIGHT, frame3, FRAMEPOINT_TOPRIGHT, 0.01, 0.01)
            call SetFrameTooltip(frame1, frame2)
            call SetFrameText(frame3, "|cffFFDC00" + GetUnitBaseStringFieldById(HeroType[i] , UNIT_SF_NAME) + "|r\n\n|cffFFDC00Base Attack Time|r : " + R2S(GetUnitBaseWeaponRealFieldById(HeroType[i] , UNIT_WEAPON_RF_ATTACK_BASE_COOLDOWN, 0)) + "\n|cffFFDC00Strength|r : " + I2S(GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_STRENGTH_BASE)) + " + " + R2S(GetUnitBaseRealFieldById(HeroType[i] , UNIT_RF_STRENGTH_PER_LEVEL)) + "\n|cffFFDC00Agility|r : " + I2S(GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_AGILITY_BASE)) + " + " + R2S(GetUnitBaseRealFieldById(HeroType[i] , UNIT_RF_AGILITY_PER_LEVEL)) + "\n|cffFFDC00Intelligence|r : " + I2S(GetUnitBaseIntegerFieldById(HeroType[i] , UNIT_IF_INTELLIGENCE_BASE)) + " + " + R2S(GetUnitBaseRealFieldById(HeroType[i] , UNIT_RF_INTELLIGENCE_PER_LEVEL)) )
            call SetFrameEnabled(frame3, false)
            set t = CreateTrigger()
            call SaveInteger(ht, StringHash("HeroIndex") , GetHandleId(frame1) , i)
            call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_CONTROL_CLICK)
            call RegisterFrameMouseButton(frame1, MOUSE_BUTTON_TYPE_RIGHT, true)
            call TriggerAddAction(t, function HeroButtonClick)
            set j = j + 1
            if j >= 10 then
                set j = 0
                set k = k + 1
            endif
            set i = i + 1
        endloop
        
        set mainFrame = null
        set frame1 = null
        set frame2 = null
        set frame3 = null
        set t = null
    endfunction
    
    function createDefaultUI takes nothing returns nothing
        local framehandle frame1
        local framehandle frame2
        local framehandle frame3
        local framehandle frame4
        local trigger t
        local integer i
        local integer j
        local integer k
    
        call SetFrameRelativePoint(GetFrameByName("ResourceBarFrame", 0) , FRAMEPOINT_TOPRIGHT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPRIGHT, 0.0875, 0.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarQuestsButton", 0) , FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarMenuButton", 0) , FRAMEPOINT_LEFT, 0.63, 0.57)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarAlliesButton", 0) , FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarChatButton", 0) , FRAMEPOINT_LEFT, 0.715, 0.57)
            
        set frame1 = CreateFrameByType("BACKDROP", "MinimapBorder", GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , "", 0)
        call SetFrameBackdropTexture(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL, false)
        call SetFrameBorderSize(frame1, 0, 0.01)
        call SetFrameBackgroundInsets(frame1, 0, 0.004, 0.004, 0.004, 0.004)
        call SetFrameSize(frame1, 0.14, 0.14)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_BOTTOMLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
            
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_MINIMAP, 0) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_MINIMAP, 0) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
    
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_TOPLEFT, 0.005, 0.03)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPLEFT, 0.33, 0.2)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0) , FRAMEPOINT_BOTTOMLEFT, GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0) , FRAMEPOINT_CENTER, - 0.05, 0)
            
        set frame1 = CreateFrameByType("BACKDROP", "MainBorder", GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , "", 0)
        call SetFrameBackdropTexture(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL, false)
        call SetFrameBorderSize(frame1, 0, 0.01)
        call SetFrameBackgroundInsets(frame1, 0, 0.004, 0.004, 0.004, 0.004)
        call SetFrameSize(frame1, 0.2, 0.14)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_BOTTOMLEFT, GetFrameByName("MinimapBorder", 0) , FRAMEPOINT_BOTTOMRIGHT, 0.005, 0)
            
        set frame1 = CreateFrameByType("BACKDROP", "PhotoFrame", GetFrameByName("MainBorder", 0) , "", 0)
        call SetFrameTexture(frame1, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", 0, false)
        call SetFrameSize(frame1, 0.06, 0.13)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("MainBorder", 0) , FRAMEPOINT_TOPLEFT, 0.005, - 0.005)
    
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_PORTRAIT, 0))
        call SetFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_PORTRAIT, 0) , frame1)
    
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0) , FRAMEPOINT_BOTTOMLEFT, GetFrameByName("MainBorder", 0) , FRAMEPOINT_TOPLEFT, 0, 0.001)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0) , FRAMEPOINT_TOPRIGHT, GetFrameByName("MainBorder", 0) , FRAMEPOINT_TOPRIGHT, 0.12, 0.025)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 0)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("PhotoFrame", 0) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 0)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 1)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 0) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 1)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 2)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 1) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 2)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 3)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNSteelMelee.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 2) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 3)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 4)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNSteelArmor.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 3) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 4)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 5)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNMaskOfDeath.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 4) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 5)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 6)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNAmulet.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_LEFT, GetFrameByName("StatText", 0) , FRAMEPOINT_RIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 6)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 7)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNCriticalStrike.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 6) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 7)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 8)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNClawsOfAttack.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 7) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 8)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set frame1 = CreateFrameByType("BACKDROP", "StatFrame", GetFrameByName("MainBorder", 0) , "", 9)
        call SetFrameTexture(frame1, "ReplaceableTextures\\CommandButtons\\BTNThoriumArmor.blp", 0, false)
        call SetFrameSize(frame1, 0.016, 0.016)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("StatFrame", 8) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set frame2 = CreateFrameByType("TEXT", "StatText", frame1, "", 9)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameWidth(frame2, 0.05)
        call SetFrameText(frame2, "")
        call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, frame1, FRAMEPOINT_RIGHT, 0.001, 0)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "XPFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.275, 0.02)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("MainBorder", 0) , FRAMEPOINT_TOPRIGHT, 0.001, - 0.03)

        set frame2 = CreateFrameByType("SIMPLESTATUSBAR", "XPBackground", frame1, "", 0)
        set frame3 = CreateFrameByType("SIMPLESTATUSBAR", "XPForeground", frame1, "", 0)
        call ClearFrameAllPoints(frame2)
        call ClearFrameAllPoints(frame3)
        call SetFrameTexture(frame2, "textures\\black32.blp", 0, false)
        call SetFrameValue(frame2, 100)
        call SetFrameTexture(frame3, "ReplaceableTextures\\TeamColor\\TeamColor03.blp", 0, false)
        call SetFrameMinMaxValues(frame3, 0, 1)
        call SetFrameValue(frame3, 1)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ShowFrame(frame2, true)
        call ShowFrame(frame3, true)

        set frame1 = CreateFrameByType("SIMPLETEXT", "XPText", frame3, "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameTextAlignment(frame1, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame1, "Fonts\\FRIZQT__.TTF", 0.011, 0)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_CENTER, frame3, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(frame1, "")
        call ShowFrame(frame1, true)

        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BAR, 0))
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 0))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 0) , FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 1))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 1) , FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 2))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 2) , FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 3))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 3) , FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 4))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 4) , FRAMEPOINT_CENTER, 10.0, 10.0)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "SkillFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.038, 0.038)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("XPFrame", 0) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 8))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 8) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 8) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "SkillFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 1)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.038, 0.038)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillFrame", 0) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 9))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 9) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 9) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "SkillFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 2)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.038, 0.038)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillFrame", 1) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 10))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 10) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 10) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "SkillFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 3)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.038, 0.038)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillFrame", 2) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 11))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 11) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 11) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "SkillFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 4)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.038, 0.038)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillFrame", 3) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 7))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 7) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 7) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "SkillFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 5)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.038, 0.038)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillFrame", 4) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 6))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 6) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 6) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "SkillFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 6)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.038, 0.038)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillFrame", 5) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 5))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 5) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 5) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "HPFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.275, 0.02)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillFrame", 0) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)

        set frame2 = CreateFrameByType("SIMPLESTATUSBAR", "HPBackground", frame1, "", 0)
        set frame3 = CreateFrameByType("SIMPLESTATUSBAR", "HPForeground", frame2, "", 0)
        call ClearFrameAllPoints(frame2)
        call ClearFrameAllPoints(frame3)
        call SetFrameTexture(frame2, "textures\\black32.blp", 0, false)
        call SetFrameValue(frame2, 100)
        call SetFrameTexture(frame3, "ReplaceableTextures\\TeamColor\\TeamColor06.blp", 0, false)
        call SetFrameValue(frame3, 100)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ShowFrame(frame2, true)
        call ShowFrame(frame3, true)

        set frame1 = CreateFrameByType("SIMPLETEXT", "HPText", frame3, "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameTextAlignment(frame1, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame1, "Fonts\\FRIZQT__.TTF", 0.011, 0)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_CENTER, frame3, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(frame1, "")
        call ShowFrame(frame1, true)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "MPFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.275, 0.02)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("HPFrame", 0) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)

        set frame2 = CreateFrameByType("SIMPLESTATUSBAR", "MPBackground", frame1, "", 0)
        set frame3 = CreateFrameByType("SIMPLESTATUSBAR", "MPForeground", frame2, "", 0)
        call ClearFrameAllPoints(frame2)
        call ClearFrameAllPoints(frame3)
        call SetFrameTexture(frame2, "textures\\black32.blp", 0, false)
        call SetFrameValue(frame2, 100)
        call SetFrameTexture(frame3, "ReplaceableTextures\\TeamColor\\TeamColor01.blp", 0, false)
        call SetFrameValue(frame3, 100)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ShowFrame(frame2, true)
        call ShowFrame(frame3, true)

        set frame1 = CreateFrameByType("SIMPLETEXT", "MPText", frame3, "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameTextAlignment(frame1, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame1, "Fonts\\FRIZQT__.TTF", 0.011, 0)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_CENTER, frame3, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(frame1, "")
        call ShowFrame(frame1, true)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "ItemFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.032, 0.032)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("XPFrame", 0) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 0) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 0) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "ItemFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 1)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.032, 0.032)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemFrame", 0) , FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 1))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 1) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 1) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "ItemFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 2)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.032, 0.032)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemFrame", 0) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 2))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 2) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 2) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "ItemFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 3)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.032, 0.032)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemFrame", 1) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 3))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 3) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 3) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "ItemFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 4)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.032, 0.032)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemFrame", 2) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 4))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 4) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 4) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        set frame1 = CreateFrameByType("SIMPLEFRAME", "ItemFrame", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 5)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.032, 0.032)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemFrame", 3) , FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 5))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 5) , FRAMEPOINT_BOTTOMLEFT, frame1, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 5) , FRAMEPOINT_TOPRIGHT, frame1, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)

        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_UBERTOOLTIP, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_UBERTOOLTIP, 0) , FRAMEPOINT_BOTTOMRIGHT, GetFrameByName("ItemFrame", 1) , FRAMEPOINT_TOPRIGHT, 0.001, 0.001)

        set i = 0
        loop
            exitwhen i > 7
            set frame1 = GetOriginFrame(ORIGIN_FRAME_BUFF_BAR_INDICATOR, i)
            call ClearFrameAllPoints(frame1)
            call SetFrameRelativePoint(frame1, FRAMEPOINT_BOTTOMLEFT, GetFrameByName("XPFrame", 0) , FRAMEPOINT_TOPLEFT, i * 0.021, 0.001)
            call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPRIGHT, GetFrameByName("XPFrame", 0) , FRAMEPOINT_TOPLEFT, 0.02 + i * 0.02, 0.02)
            set i = i + 1
        endloop 

        set i = 1
        loop
            exitwhen i > 5
            set frame1 = CreateFrameByType("SIMPLETEXTURE", "ScoreHeroView", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", i)
            call ClearFrameAllPoints(frame1)
            call SetFrameTexture(frame1, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameSize(frame1, 0.03, 0.03)
            call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPLEFT, 0.005 + (i - 1) * 0.031, - 0.005)
            call ShowFrame(frame1, true)

            set frame2 = CreateFrameByType("SIMPLETEXT", "ScoreHeroText", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.014, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_CENTER, frame1, FRAMEPOINT_CENTER, 0, 0)
            call SetFrameText(frame2, "")
            call ShowFrame(frame2, true)
            set i = i + 1
        endloop

        set i = 7
        loop
            exitwhen i > 11
            set frame1 = CreateFrameByType("SIMPLETEXTURE", "ScoreHeroView", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", i)
            call ClearFrameAllPoints(frame1)
            call SetFrameTexture(frame1, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameSize(frame1, 0.03, 0.03)
            call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_TOPLEFT, 0.005 + i * 0.031, - 0.005)
            call ShowFrame(frame1, true)

            set frame2 = CreateFrameByType("SIMPLETEXT", "ScoreHeroText", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.012, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_CENTER, frame1, FRAMEPOINT_CENTER, 0, 0)
            call SetFrameText(frame2, "")
            call ShowFrame(frame2, true)
            set i = i + 1
        endloop

        set frame1 = CreateFrameByType("SIMPLEFRAME", "ScoreBoard", GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0) , "", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameSize(frame1, 0.3, 0.26)
        call SetFrameTextureEx(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_CENTER, GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , FRAMEPOINT_CENTER, 0, 0.06)
        call ShowFrame(frame1, false)

        set frame2 = CreateFrameByType("SIMPLEFRAME", "ScoreBoardEx", frame1, "", 0)
        call ClearFrameAllPoints(frame2)
        call SetFrameSize(frame2, 0.1, 0.1)
        call SetFrameTextureEx(frame2, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ShowFrame(frame2, true)

        set frame3 = CreateFrameByType("SIMPLETEXT", "ScoreBoardText", frame2, "", 0)
        call ClearFrameAllPoints(frame3)
        call SetFrameTextAlignment(frame3, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame3, "Fonts\\FRIZQT__.TTF", 0.012, 0)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPLEFT, frame2, FRAMEPOINT_TOPLEFT, 0.01, - 0.01)
        call SetFrameText(frame3, "Team1 Score : 0\nTeam2 Score : 0\nWin Score : 100")
        call ShowFrame(frame3, true)

        set frame2 = CreateFrameByType("SIMPLETEXT", "BoardIcon", frame1, "", 0)
        call ClearFrameAllPoints(frame2)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, 0.01, - 0.01)
        call SetFrameText(frame2, "HeroIcon")
        call ShowFrame(frame2, true)

        set frame2 = CreateFrameByType("SIMPLETEXT", "BoardLevel", frame1, "", 0)
        call ClearFrameAllPoints(frame2)
        call SetFrameWidth(frame2, 0.04)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardIcon", 0) , FRAMEPOINT_TOPLEFT, 0.07, 0)
        call SetFrameText(frame2, "HeroLevel")
        call ShowFrame(frame2, true)

        set frame2 = CreateFrameByType("SIMPLETEXT", "BoardKill", frame1, "", 0)
        call ClearFrameAllPoints(frame2)
        call SetFrameWidth(frame2, 0.08)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardLevel", 0) , FRAMEPOINT_TOPLEFT, 0.03, 0)
        call SetFrameText(frame2, "K / D / A")
        call ShowFrame(frame2, true)

        set frame2 = CreateFrameByType("SIMPLETEXT", "BoardItem", frame1, "", 0)
        call ClearFrameAllPoints(frame2)
        call SetFrameWidth(frame2, 0.1)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardKill", 0) , FRAMEPOINT_TOPLEFT, 0.075, 0)
        call SetFrameText(frame2, "ITEM")
        call ShowFrame(frame2, true)

        set i = 1
        loop
            exitwhen i > 5
            set frame2 = CreateFrameByType("SIMPLETEXTURE", "BoardHeroIcon", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameSize(frame2, 0.016, 0.016)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardIcon", 0) , FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
            call ShowFrame(frame2, true)
            set frame2 = CreateFrameByType("SIMPLETEXT", "BoardName", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("BoardHeroIcon", i) , FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(frame2, "Player" + I2S(i))
            call ShowFrame(frame2, true)
            set frame2 = CreateFrameByType("SIMPLETEXT", "BoardHeroLevel", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_TOP, GetFrameByName("BoardLevel", 0) , FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(frame2, "0")
            call ShowFrame(frame2, true)
            set frame2 = CreateFrameByType("SIMPLETEXT", "BoardPlayerKill", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_TOP, GetFrameByName("BoardKill", 0) , FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(frame2, "0 / 0 / 0")
            call ShowFrame(frame2, true)

            set j = 0
            loop
                set k = (i * 10) + j
                if j == 0 then
                    set frame2 = CreateFrameByType("SIMPLETEXTURE", "BoardHeroItem", frame1, "", k)
                    call ClearFrameAllPoints(frame2)
                    call SetFrameTexture(frame2, "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0, false)
                    call SetFrameSize(frame2, 0.016, 0.016)
                    call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardItem", 0) , FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
                    call ShowFrame(frame2, true)
                else
                    set frame2 = CreateFrameByType("SIMPLETEXTURE", "BoardHeroItem", frame1, "", k)
                    call ClearFrameAllPoints(frame2)
                    call SetFrameTexture(frame2, "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0, false)
                    call SetFrameSize(frame2, 0.016, 0.016)
                    call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("BoardHeroItem", k - 1) , FRAMEPOINT_RIGHT, 0.001, 0)
                    call ShowFrame(frame2, true)
                endif
                set j = j + 1
                exitwhen j > 5
            endloop

            set i = i + 1
        endloop

        set i = 7
        loop
            exitwhen i > 11
            set frame2 = CreateFrameByType("SIMPLETEXTURE", "BoardHeroIcon", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTexture(frame2, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameSize(frame2, 0.016, 0.016)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardIcon", 0) , FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
            call ShowFrame(frame2, true)
            set frame2 = CreateFrameByType("SIMPLETEXT", "BoardName", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("BoardHeroIcon", i) , FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(frame2, "Player" + I2S(i))
            call ShowFrame(frame2, true)
            set frame2 = CreateFrameByType("SIMPLETEXT", "BoardHeroLevel", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_TOP, GetFrameByName("BoardLevel", 0) , FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(frame2, "0")
            call ShowFrame(frame2, true)
            set frame2 = CreateFrameByType("SIMPLETEXT", "BoardPlayerKill", frame1, "", i)
            call ClearFrameAllPoints(frame2)
            call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(frame2, FRAMEPOINT_TOP, GetFrameByName("BoardKill", 0) , FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(frame2, "0 / 0 / 0")
            call ShowFrame(frame2, true)

            set j = 0
            loop
                set k = (i * 10) + j
                if j == 0 then
                    set frame2 = CreateFrameByType("SIMPLETEXTURE", "BoardHeroItem", frame1, "", k)
                    call ClearFrameAllPoints(frame2)
                    call SetFrameTexture(frame2, "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0, false)
                    call SetFrameSize(frame2, 0.016, 0.016)
                    call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardItem", 0) , FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
                    call ShowFrame(frame2, true)
                else
                    set frame2 = CreateFrameByType("SIMPLETEXTURE", "BoardHeroItem", frame1, "", k)
                    call ClearFrameAllPoints(frame2)
                    call SetFrameTexture(frame2, "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0, false)
                    call SetFrameSize(frame2, 0.016, 0.016)
                    call SetFrameRelativePoint(frame2, FRAMEPOINT_LEFT, GetFrameByName("BoardHeroItem", k - 1) , FRAMEPOINT_RIGHT, 0.001, 0)
                    call ShowFrame(frame2, true)
                endif
                set j = j + 1
                exitwhen j > 5
            endloop

            set i = i + 1
        endloop
        
        set frame1 = null 
        set frame2 = null
        set frame3 = null
        set frame4 = null
        set t = null
    endfunction

    globals
        integer ShopItemIndex = 0
        integer array ShopHarga
        integer array ShopItemId
        string array ShopItemTip
        string array ShopItemName
        private integer ShopWidth = 0
        private integer ShopHeight = 0
        real array ShopItemPosX
        real array ShopItemPosY
        string array ShopSearchTxt
    endglobals

    function ShopItemButton takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local integer pid = GetPlayerId(p)
        local integer fid = LoadInteger(ht, StringHash("ShopItemIndex") , GetHandleId(tFrame))
        local framehandle frame1
        local framehandle frame2
        local integer i
        local integer j
        

        if GetTriggerFrameMouseButton() == MOUSE_BUTTON_TYPE_RIGHT then
            if GetLocalPlayer() == p then
                call SetFrameEnabled(tFrame, false)
                call SetFrameEnabled(tFrame, true)
            endif

            set i = 0
            set j = 0
            loop
                exitwhen i > 5
                if UnitItemInSlot(MainHero[pid] , i) != null then
                    set j = j + 1
                endif
                set i = i + 1
            endloop

            if IsUnitInRange(MainHero[pid] , MainUnit[pid] , 1000) and GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) >= ShopHarga[fid] and j < 6 and IsUnitAlive(MainHero[pid]) and not IsUnitPaused(MainHero[pid]) then
                call AdjustPlayerStateBJ(- ShopHarga[fid] , p, PLAYER_STATE_RESOURCE_GOLD)
                call UnitAddItemByIdSwapped(ShopItemId[fid] , MainHero[pid])
            endif
        else
            set frame1 = GetFrameByName("ShopItemSprite", 0)
            set frame2 = GetFrameByName("ShopItemTip", 0)
            if GetLocalPlayer() == p then
                call SetFrameEnabled(tFrame, false)
                call SetFrameEnabled(tFrame, true)
                call ClearFrameAllPoints(frame1)
                call SetFrameRelativePoint(frame1, FRAMEPOINT_BOTTOMLEFT, tFrame, FRAMEPOINT_BOTTOMLEFT, - 0.0046, - 0.0045)
                call SetFrameSpriteScale(frame1, 0.6)
                if not IsFrameVisible(frame1) then
                    call ShowFrame(frame1, true)
                endif
                if GetFrameText(frame2) != ShopItemTip[fid] then
                    call SetFrameText(frame2, ShopItemTip[fid])
                endif
            endif
        endif

        set p = null
        set tFrame = null
        set frame1 = null
        set frame2 = null
    endfunction

    private function CreateShopItem takes integer id returns nothing
        local framehandle frame1
        local framehandle frame2
        local framehandle frame3
        local trigger t

        set frame1 = CreateFrameByType("BUTTON", "ShopItemButton", GetFrameByName("ShopMainBorder", 0) , "", ShopItemIndex)
        call SetFrameSize(frame1, 0.03, 0.03)
        if ShopHeight < 5 then
            set ShopItemPosX[ShopItemIndex] = 0.01 + ShopWidth * 0.033
            set ShopItemPosY[ShopItemIndex] = - 0.01 - ShopHeight * 0.05
            call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, GetFrameByName("ShopMainBorder", 0) , FRAMEPOINT_TOPLEFT, ShopItemPosX[ShopItemIndex] , ShopItemPosY[ShopItemIndex])
        else
            set ShopItemPosX[ShopItemIndex] = 0
            set ShopItemPosY[ShopItemIndex] = 0
            call ShowFrame(frame1, false)
        endif
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("ShopItemIndex") , GetHandleId(frame1) , ShopItemIndex)
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_CONTROL_CLICK)
        call RegisterFrameMouseButton(frame1, MOUSE_BUTTON_TYPE_RIGHT, true)
        call TriggerAddAction(t, function ShopItemButton)

        set frame2 = CreateFrameByType("BACKDROP", "ShopItemIcon", frame1, "", ShopItemIndex)
        call SetFrameTexture(frame2, GetBaseItemStringFieldById(id, ITEM_SF_ICON) , 0, false)
        call SetFrameAllPoints(frame2, frame1)
        set frame3 = CreateFrameByType("TEXT", "ShopItemPriceFrame", frame2, "", ShopItemIndex)
        call SetFrameTextAlignment(frame3, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(frame3, "Fonts\\FRIZQT__.TTF", 0.012, 0)
        call SetFrameRelativePoint(frame3, FRAMEPOINT_CENTER, frame2, FRAMEPOINT_BOTTOM, 0, - 0.005)
        call SetFrameText(frame3, "|cffFFD600" + I2S(GetBaseItemIntegerFieldById(id, ITEM_IF_GOLD_COST)))
        call SetFrameEnabled(frame3, false)

        set ShopWidth = ShopWidth + 1
        if ShopWidth == 7 then
            set ShopWidth = 0
            set ShopHeight = ShopHeight + 1
        endif

        set ShopItemId[ShopItemIndex] = id
        set ShopHarga[ShopItemIndex] = GetBaseItemIntegerFieldById(id, ITEM_IF_GOLD_COST)
        set ShopItemName[ShopItemIndex] = GetBaseItemStringFieldById(id, ITEM_SF_NAME)
        set ShopItemTip[ShopItemIndex] = ShopItemName[ShopItemIndex] + "\n\n" + GetBaseItemStringFieldById(id, ITEM_SF_TOOLTIP_EXTENDED)
        set ShopItemIndex = ShopItemIndex + 1

        set frame1 = null
        set frame2 = null
        set frame3 = null
        set t = null
    endfunction

    function ShopItemWheel takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local framehandle frame1 = GetFrameByName("ShopScrollBar", 0)
        local real fval = GetTriggerFrameReal()

        if fval > 0 then
            if GetLocalPlayer() == p then
                call SetFrameValue(frame1, GetFrameValue(frame1) + 1)
            endif
        else
            if GetLocalPlayer() == p then
                call SetFrameValue(frame1, GetFrameValue(frame1) - 1)
            endif
        endif

        set p = null
        set tFrame = null
        set frame1 = null
    endfunction

    private function ShopSearchFunc1 takes player p, string txt returns nothing
        local framehandle frame1 = GetFrameByName("ShopMainBorder", 0)
        local framehandle frame2 = GetFrameByName("ShopScrollBar", 0)
        local framehandle frame3
        local real fval = GetFrameValue(frame2)
        local integer i
        local integer j
        local integer k

        if txt != "" and txt != null then
            set i = 0
            set j = 0
            loop
                exitwhen i == ShopItemIndex or j >= 34
                set frame3 = GetFrameByName("ShopItemButton", i)
                if StringContains(ShopItemName[i] , txt, false) then
                    if GetLocalPlayer() == p and not IsFrameVisible(frame3) then
                        call ShowFrame(frame3, true)
                    endif
                    set j = j + 1
                else
                    if GetLocalPlayer() == p and IsFrameVisible(frame3) then
                        call ShowFrame(frame3, false)
                    endif
                endif
                set i = i + 1
            endloop
            set i = 0
            set k = 0
            loop
                exitwhen i == ShopItemIndex or k >= j
                set frame3 = GetFrameByName("ShopItemButton", i)
                if GetLocalPlayer() == p and IsFrameVisible(frame3) then
                    call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, ShopItemPosX[k] , ShopItemPosY[k])
                    set k = k + 1
                endif
                set i = i + 1
            endloop
        else
            set i = 0
            loop
                exitwhen i == ShopItemIndex
                set frame3 = GetFrameByName("ShopItemButton", i)
                if GetLocalPlayer() == p and IsFrameVisible(frame3) then
                    call ShowFrame(frame3, false)
                endif
                set i = i + 1
            endloop
            if fval == 0 then
                set i = 0
                loop
                    exitwhen i == ShopItemIndex
                    if i >= 7 and i <= 41 then
                        set frame3 = GetFrameByName("ShopItemButton", i)
                        if GetLocalPlayer() == p and not IsFrameVisible(frame3) then
                            call ShowFrame(frame3, true)
                        endif
                        if GetLocalPlayer() == p then
                            call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, ShopItemPosX[i - 7] , ShopItemPosY[i - 7])
                        endif
                    endif
                    set i = i + 1
                endloop
            elseif fval == 1 then
                set i = 0
                loop
                    exitwhen i == ShopItemIndex
                    if i >= 0 and i <= 34 then
                        set frame3 = GetFrameByName("ShopItemButton", i)
                        if GetLocalPlayer() == p and not IsFrameVisible(frame3) then
                            call ShowFrame(frame3, true)
                        endif
                        if GetLocalPlayer() == p then
                            call SetFrameRelativePoint(frame3, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, ShopItemPosX[i] , ShopItemPosY[i])
                        endif
                    endif
                    set i = i + 1
                endloop
            endif
        endif

        set frame1 = null
        set frame2 = null
        set frame3 = null
    endfunction

    function ShopItemSlider takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local framehandle frame1 = GetFrameByName("ShopMainBorder", 0)
        local real fval = GetTriggerFrameReal()
        local integer pid = GetPlayerId(p)
        local framehandle frame2
        local framehandle frame3 
        local integer i

        set frame2 = GetFrameByName("ShopItemSprite", 0)
        set frame3 = GetFrameByName("ShopItemTip", 0)
        if GetLocalPlayer() == p then
            if IsFrameVisible(frame2) then
                call ShowFrame(frame2, false)
            endif
            if GetFrameText(frame3) != "" then
                call SetFrameText(frame3, "")
            endif
        endif

        set i = 0
        loop
            exitwhen i == ShopItemIndex
            set frame2 = GetFrameByName("ShopItemButton", i)
            if GetLocalPlayer() == p and IsFrameVisible(frame2) then
                call ShowFrame(frame2, false)
            endif
            set i = i + 1
        endloop

        if fval == 0 then
            set i = 0
            loop
                exitwhen i == ShopItemIndex
                if i >= 7 and i <= 41 then
                    set frame2 = GetFrameByName("ShopItemButton", i)
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, ShopItemPosX[i - 7] , ShopItemPosY[i - 7])
                        if not IsFrameVisible(frame2) then
                            call ShowFrame(frame2, true)
                        endif
                    endif
                endif
                set i = i + 1
            endloop
        elseif fval == 1 then
            set i = 0
            loop
                exitwhen i == ShopItemIndex
                if i >= 0 and i <= 34 then
                    set frame2 = GetFrameByName("ShopItemButton", i)
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, ShopItemPosX[i] , ShopItemPosY[i])
                        if not IsFrameVisible(frame2) then
                            call ShowFrame(frame2, true)
                        endif
                    endif
                endif
                set i = i + 1
            endloop
        endif

        if ShopSearchTxt[pid] != "" and ShopSearchTxt[pid] != null then
            call ShopSearchFunc1(p, ShopSearchTxt[pid])
        endif

        set p = null
        set tFrame = null
        set frame1 = null
        set frame2 = null
        set frame3 = null
    endfunction

    function ShopItemSearch takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle tFrame = GetTriggerFrame()
        local framehandle frame1 = GetFrameByName("ShopItemSprite", 0)
        local framehandle frame2 = GetFrameByName("ShopItemTip", 0)
        local integer pid = GetPlayerId(p)
        local string txt = GetTriggerFrameString()

        if GetLocalPlayer() == p then
            if IsFrameVisible(frame1) then
                call ShowFrame(frame1, false)
            endif
            if GetFrameText(frame2) != "" then
                call SetFrameText(frame2, "")
            endif
        endif

        set ShopSearchTxt[pid] = txt
        call ShopSearchFunc1(p, txt)

        set p = null
        set tFrame = null
        set frame1 = null
        set frame2 = null
    endfunction

    function shopUICreate takes nothing returns nothing
        local framehandle mainFrame
        local framehandle frame1
        local framehandle frame2
        local framehandle frame3
        local trigger t

        set mainFrame = CreateFrameByType("BACKDROP", "ShopMainBorder", GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0) , "", 0)
        call ClearFrameAllPoints(mainFrame)
        call SetFrameBackdropTexture(mainFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL, false)
        call SetFrameBorderSize(mainFrame, 0, 0.01)
        call SetFrameBackgroundInsets(mainFrame, 0, 0.004, 0.004, 0.004, 0.004)
        call SetFrameSize(mainFrame, 0.253, 0.3)
        call SetFrameAbsolutePoint(mainFrame, FRAMEPOINT_CENTER, 0.32, 0.32)
        call ShowFrame(mainFrame, false)

        set frame1 = CreateFrameByType("BACKDROP", "ShopTagFrame", mainFrame, "", 0)
        call SetFrameSize(frame1, 0.16, 0.04)
        call SetFrameTexture(frame1, "war3mapImported\\shoptag.blp", 0, false)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_BOTTOM, mainFrame, FRAMEPOINT_TOP, 0, - 0.005)

        set frame1 = CreateFrameByType("BUTTON", "ShopScrollArea", mainFrame, "", 0)
        call SetFrameAllPoints(frame1, mainFrame)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function FrameFocus)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_MOUSE_WHEEL)
        call TriggerAddAction(t, function ShopItemWheel)

        set frame1 = CreateFrameByType("SCROLLBAR", "ShopScrollBar", mainFrame, "QuestMainListScrollBar", 0)
        call ClearFrameAllPoints(frame1)
        call SetFrameMinMaxValues(frame1, 0, 1)
        call SetFrameValue(frame1, 1)
        call SetFrameStepSize(frame1, 1)
        call SetFrameSize(frame1, 0.012, 0.25)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_CENTER, mainFrame, FRAMEPOINT_RIGHT, - 0.005, 0)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_SLIDER_VALUE_CHANGED)
        call TriggerAddAction(t, function ShopItemSlider)

        set frame1 = CreateFrame("ShopSearchFrame", mainFrame, 0, 0)
        call SetFrameSize(frame1, 0.13, 0.03)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_BOTTOMLEFT, mainFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameText(frame1, "")
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function FrameFocus)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, frame1, FRAMEEVENT_EDITBOX_TEXT_CHANGED)
        call TriggerAddAction(t, function ShopItemSearch)

        set frame1 = CreateFrameByType("BACKDROP", "ShopItemTipBorder", mainFrame, "", 0)
        call SetFrameBackdropTexture(frame1, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", BORDER_FLAG_ALL, false)
        call SetFrameBorderSize(frame1, 0, 0.01)
        call SetFrameBackgroundInsets(frame1, 0, 0.004, 0.004, 0.004, 0.004)
        call SetFrameSize(frame1, 0.2, 0.2)
        call SetFrameRelativePoint(frame1, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        set frame2 = CreateFrameByType("TEXT", "ShopItemTip", frame1, "", 0)
        call SetFrameTextAlignment(frame2, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(frame2, "Fonts\\FRIZQT__.TTF", 0.012, 0)
        call SetFrameWidth(frame2, 0.16)
        call SetFrameRelativePoint(frame2, FRAMEPOINT_TOPLEFT, frame1, FRAMEPOINT_TOPLEFT, 0.01, - 0.01)
        call SetFrameText(frame2, "")
        call SetFrameEnabled(frame2, false)

        set frame1 = CreateFrameByType("SPRITE", "ShopItemSprite", mainFrame, "", 0)
        call SetFrameSize(frame1, 0.00001, 0.00001)
        call SetFrameModel(frame1, "war3mapImported\\neon_sprite.mdx", 0)

        call CreateShopItem('I03G')
        call CreateShopItem('I012')
        call CreateShopItem('I00X')

        call CreateShopItem('I04R')
        call CreateShopItem('I03I')
        call CreateShopItem('I02E')
        call CreateShopItem('I008')
        call CreateShopItem('I02F')
        call CreateShopItem('I004')

        call CreateShopItem('I000')
        call CreateShopItem('I001')
        call CreateShopItem('I035')

        call CreateShopItem('I020')
        call CreateShopItem('I015')

        call CreateShopItem('I003')
        call CreateShopItem('I01X')
        call CreateShopItem('I00G')

        call CreateShopItem('I00A')
        call CreateShopItem('I01W')
        call CreateShopItem('I00E')

        call CreateShopItem('I00B')
        call CreateShopItem('I016')
        call CreateShopItem('I00C')

        call CreateShopItem('I02V')
        call CreateShopItem('I013')
        call CreateShopItem('I007')
        call CreateShopItem('I00M')
        call CreateShopItem('I005')
        call CreateShopItem('I00S')
        
        call CreateShopItem('I00I')
        call CreateShopItem('I00K')
        call CreateShopItem('I00L')
        call CreateShopItem('I00O')
        call CreateShopItem('I00Q')
        call CreateShopItem('I00U')
        
        set mainFrame = null
        set frame1 = null
        set frame2 = null
        set frame3 = null
        set t = null
    endfunction

    function UpdateScoreBoard takes nothing returns nothing
        local unit u
        local item it
        local framehandle frame1
        local integer i
        local integer j
        local integer k
        local string str = ""
        
        set i = 0
        loop
            exitwhen i > 11
            set u = MainHero[i]
            if u != null then
                set frame1 = GetFrameByName("BoardHeroLevel", i) 
                set str = I2S(GetHeroLevel(u))
                if GetFrameText(frame1) != str then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("BoardPlayerKill", i)
                set str = I2S(scorekill[i]) + " / " + I2S(scoredeath[i]) + " / " + I2S(scoreassist[i])
                if GetFrameText(frame1) != str then
                    call SetFrameText(frame1, str)
                endif
        
                set j = 0
                loop 
                    set it = UnitItemInSlot(u, j)
                    set k = (i * 10) + j
                    if it != null then
                        set frame1 = GetFrameByName("BoardHeroItem", k)
                        set str = GetItemStringField(it, ITEM_SF_ICON)
                        if GetFrameTexture(frame1, 0) != str then
                            call SetFrameTexture(frame1, str, 0, false)
                        endif
                    else
                        set frame1 = GetFrameByName("BoardHeroItem", k)
                        set str = "ReplaceableTextures\\CommandButtons\\BTNCancel.blp"
                        if GetFrameTexture(frame1, 0) != str then
                            call SetFrameTexture(frame1, str, 0, false)
                        endif
                    endif
                    set j = j + 1
                    exitwhen j > 5
                endloop
            endif
            set i = i + 1
        endloop
        
        set u = null
        set it = null
        set frame1 = null
    endfunction
endlibrary