library initFrame uses Utilities
    function AncestorFrame takes nothing returns nothing
        local framehandle gameuiFrame = GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)

        call EditBlackBorders(0, 0)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0), FRAMEPOINT_TOPLEFT, gameuiFrame, FRAMEPOINT_TOPLEFT, 10.0, 0)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0), FRAMEPOINT_TOPRIGHT, gameuiFrame, FRAMEPOINT_TOPRIGHT, - 10.0, 0)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_HERO_BAR, 0), FRAMEPOINT_TOPLEFT, gameuiFrame, FRAMEPOINT_TOPLEFT, 0.0, 1.0 )
        call SetFrameRelativePoint(GetFrameByName("ResourceBarFrame", 0), FRAMEPOINT_TOPRIGHT, gameuiFrame, FRAMEPOINT_TOPRIGHT, 10.0, 0.0 )
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarQuestsButton", 0), FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarMenuButton", 0), FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarAlliesButton", 0), FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarChatButton", 0), FRAMEPOINT_LEFT, 0.0, 1.0)
        call ShowFrame(GetOriginFrame(ORIGIN_FRAME_TIME_OF_DAY_INDICATOR, 0), false)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0))
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0))
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0))

        call LoadTOCFile("war3mapImported\\RveFrame.toc")

        set gameuiFrame = null
    endfunction

    globals
        string array HeroVoice
        string array HeroVoice2
        string array HeroVoice3
        string array HeroPhoto
        string array HeroPhoto2
        string array HeroPhoto3
        integer array HeroType
        private integer heroId = 1
    endglobals
    
    private function SetHeroData takes integer uid, string voice1, string voice2, string voice3, string icon1, string icon2 returns nothing
        local string str = ""
        set HeroType[heroId] = uid
            
        if voice1 != "" then
            set str = "war3mapImported\\" + voice1
        else
            set str = ""
        endif
        set HeroVoice[heroId] = str
    
        if voice2 != "" then
            set str = "war3mapImported\\" + voice2
        else
            set str = ""
        endif
        set HeroVoice2[heroId] = str
    
        if voice3 != "" then
            set str = "war3mapImported\\" + voice3
        else
            set str = ""
        endif
        set HeroVoice3[heroId] = str
    
        if icon1 != "" then
            set str = "PhotoPath\\" + icon1
        else
            set str = ""
        endif
        set HeroPhoto[heroId] = str
    
        if icon1 != "" then
            set str = "PhotoPathDis\\" + icon1
        else
            set str = ""
        endif
        set HeroPhoto2[heroId] = str
            
        if icon2 != "" then
            set str = "Portraited\\" + icon2
        endif
        set HeroPhoto3[heroId] = str
            
        set heroId = heroId + 1
    endfunction
    
    function InitHeroData takes nothing returns nothing
        call SetHeroData('H046', "aizenpick.mp3", "aizen10k.mp3", "aizen15k.mp3", "Aizen-icon.blp", "Aizen-icon.blp")
        call SetHeroData('H00J', "akamepick.mp3", "", "", "Akame-icon.blp", "Akame-icon.blp")
        call SetHeroData('H0CX', "", "", "", "Alibaba-icon.blp", "Alibaba-icon.blp")
        call SetHeroData('H011', "alicepick.mp3", "alice10k.mp3", "alice15k.mp3", "Alice-icon.blp", "Alice-icon.blp")
        call SetHeroData('H012', "allmightpick.mp3", "", "", "allmight-icon.blp", "allmight-icon.blp")
        call SetHeroData('H00E', "anospick.mp3", "", "", "Anos-icon.blp", "Anos-icon.blp")
        call SetHeroData('H0FY', "", "", "", "Aokiji-icon.blp", "Aokiji-icon.blp")
        call SetHeroData('H00T', "", "", "", "Arash-icon.blp", "Arash-icon.blp")
        call SetHeroData('H00G', "", "", "", "Aya-icon.blp", "Aya-icon.blp")
        call SetHeroData('H04M', "kizarupick.mp3", "kizaru10k.mp3", "kizaru15k.mp3", "Kizaru-icon.blp", "Borsalino-icon.blp")
        call SetHeroData('H0CA', "byakuranpick.mp3", "byakuran10k.mp3", "byakuran15k.mp3", "Byakuran-icon.blp", "Byakuran-icon.blp")
            
        call SetHeroData('H00I', "", "", "", "Chtholly-icon.blp", "Chtholly-icon.blp")
        call SetHeroData('H010', "", "", "", "CloudS-icon.blp", "CloudS-icon.blp")
        call SetHeroData('H05Z', "cronuspick.mp3", "cronus10k.mp3", "cronus15k.mp3", "Cronus-icon.blp", "Cronus-icon.blp")
        call SetHeroData('H003', "diegopick.mp3", "diego10k.mp3", "diego15k.mp3", "Diego-icon.blp", "Diego-icon.blp")
        call SetHeroData('H00H', "diopick.mp3", "", "", "Dio-icon.blp", "Dio-icon.blp")
        call SetHeroData('H004', "emiyapick.mp3", "emiya10k.mp3", "emiya15k.mp3", "Shirou-icon.blp", "Emiya-icon.blp")
        call SetHeroData('H0G2', "", "", "", "Escanor-icon.blp", "Escanor-icon.blp")
        call SetHeroData('H02Q', "esdeathpick.mp3", "", "", "Esdeath-icon.blp", "Esdeath-icon.blp")
        call SetHeroData('H001', "fuhuapick.mp3", "fuhua10k.mp3", "fuhua15k.mp3", "Fuhua-icon.blp", "Fuhua-icon.blp")
        call SetHeroData('H00K', "", "", "", "Fujiren-icon.blp", "Fujiren-icon.blp")
            
        call SetHeroData('H00Z', "", "", "", "Moko-icon.blp", "Fujiwara-icon.blp")
        call SetHeroData('H0DH', "gajeelpick.mp3", "gajeel10k.mp3", "gajeel15k.mp3", "Gajeel-icon.blp", "Gajeel-icon.blp")
        call SetHeroData('H00F', "", "", "", "Gin-icon.blp", "Gin-icon.blp")
        call SetHeroData('H0CU', "", "", "", "Gon-icon.blp", "Gon-icon.blp")
        call SetHeroData('H04R', "", "", "", "Gray-icon.blp", "Gray-icon.blp")
        call SetHeroData('H0EF', "", "", "", "Guts-icon.blp", "Guts-icon.blp")
        call SetHeroData('H0EQ', "hibaripick.mp3", "hibari10k.mp3", "hibari15k.mp3", "Hibari-icon.blp", "Hibari-icon.blp")
        call SetHeroData('H0G1', "", "", "", "Toshiro-icon.blp", "Toshiro-icon.blp")
        call SetHeroData('H0D0', "", "", "", "Jellal-icon.blp", "Jellal-icon.blp")
        call SetHeroData('H0CW', "jotaropick.mp3", "jotaro10k.mp3", "jotaro15k.mp3", "Jotaro-icon.blp", "Jotaro-icon.blp")
        call SetHeroData('H07C', "tanjiropick.mp3", "tanjiro10k.mp3", "tanjiro15k.mp3", "Tanjiro-icon.blp", "Tanjiro-icon.blp")
            
        call SetHeroData('H0FS', "tomapick.mp3", "toma10k.mp3", "toma15k.mp3", "Toma-icon.blp", "Toma-icon.blp")
        call SetHeroData('H0A1', "kanzakipick.mp3", "", "", "Kanzaki-icon.blp", "Kanzaki-icon.blp")
        call SetHeroData('H002', "", "", "", "Kenshin-icon.blp", "Kenshin-icon.blp")
        call SetHeroData('H0CN', "", "", "", "Kenshiro-icon.blp", "Kenshiro-icon.blp")
        call SetHeroData('H01Z', "kianapick.mp3", "kiana10k.mp3", "kiana15k.mp3", "Kiana-icon.blp", "Kiana-icon.blp")
        call SetHeroData('H0AN', "hassanpick.mp3", "hassan10k.mp3", "hassan15k.mp3", "Hassan-icon.blp", "Hassan-icon.blp")
        call SetHeroData('H05G', "kiritopick.mp3", "kirito10k.mp3", "kirito15k.mp3", "Kirito-icon.blp", "Kirito-icon.blp")
        call SetHeroData('H0CR', "misogipick.mp3", "misogi10k.mp3", "misogi15k.mp3", "Misogi-icon.blp", "Misogi-icon.blp")
        call SetHeroData('H00R', "ikkipick.mp3", "", "", "Ikki-icon.blp", "Ikki-icon.blp")
        call SetHeroData('H00V', "ichigopick.mp3", "ichigo10k.mp3", "ichigo15k.mp3", "Ichigo-icon.blp", "Ichigo-icon.blp")
            
        call SetHeroData('H0B4', "kuroyukipick.mp3", "kuroyuki10k.mp3", "kuroyuki15k.mp3", "Kuroyukihime-icon.blp", "Kuroyukihime-icon.blp")
        call SetHeroData('H0D6', "laxuspick.mp3", "laxus10k.mp3", "laxus15k.mp3", "Laxus-icon.blp", "Laxus-icon.blp")
        call SetHeroData('H00C', "", "", "", "Levi-icon.blp", "Levi-icon.blp")
        call SetHeroData('H063', "mokitapick.mp3", "mokita10k.mp3", "mokita15k.mp3", "Mokita-icon.blp", "Mokita-icon.blp")
        call SetHeroData('H01L', "minatopick.mp3", "minato10k.mp3", "minato15k.mp3", "Minato-icon.blp", "Minato-icon.blp")
        call SetHeroData('H00B', "", "", "", "Misaka-icon.blp", "Misaka-icon.blp")
        call SetHeroData('H0D5', "", "", "", "Luffy-icon.blp", "Luffy-icon.blp")
        call SetHeroData('H0CY', "musashipick.mp3", "musashi10k.mp3", "musashi15k.mp3", "Musashi-icon.blp", "Musashi-icon.blp")
        call SetHeroData('H007', "", "", "", "Mystogan-icon.blp", "Mystogan-icon.blp")
        call SetHeroData('H005', "", "", "", "Naruto-icon.blp", "Naruto-icon.blp")
            
        call SetHeroData('H03A', "natsupick.mp3", "natsu10k.mp3", "natsu15k.mp3", "Natsu-icon.blp", "Natsu-icon.blp")
        call SetHeroData('H0FX', "neptunpick.mp3", "neptun10k.mp3", "neptun15k.mp3", "Neptun-icon.blp", "Neptun-icon.blp")
        call SetHeroData('H0D1', "", "", "", "Nura-icon.blp", "Nura-icon.blp")
        call SetHeroData('H00M', "", "", "", "Ogita-icon.blp", "Ogita-icon.blp")
        call SetHeroData('H03E', "", "", "", "Omashu-icon.blp", "Omashu-icon.blp")
        call SetHeroData('H009', "", "", "", "Pein-icon.blp", "Pein-icon.blp")
        call SetHeroData('H0BM', "", "", "", "Ace-icon.blp", "Ace-icon.blp")
        call SetHeroData('H0CV', "", "", "", "Reimu-icon.blp", "Reimu-icon.blp")
        call SetHeroData('H006', "", "", "", "hatsune-icon.blp", "hatsune-icon.blp")
        call SetHeroData('H09Y', "", "", "", "Zwei-icon.blp", "Zwei-icon.blp")
        call SetHeroData('H0D4', "", "", "", "Okumura-icon.blp", "Okumura-icon.blp")
            
        call SetHeroData('H0G3', "", "", "", "Rogue-icon.blp", "Rogue-icon.blp")
        call SetHeroData('H02L', "zoropick.mp3", "zoro10k.mp3", "zoro15k.mp3", "Zoro-icon.blp", "Zoro-icon.blp")
        call SetHeroData('H00P', "", "", "", "Ryuzaki-icon.blp", "Ryuzaki-icon.blp")
        call SetHeroData('H0D3', "", "", "", "Sabo-icon.blp", "Sabo-icon.blp")
        call SetHeroData('H0CT', "izayoipick.mp3", "", "", "Izayoi-icon.blp", "Izayoi-icon.blp")
        call SetHeroData('H00N', "", "", "", "Akainu-icon.blp", "Akainu-icon.blp")
        call SetHeroData('H0CZ', "", "", "", "Sasuke-icon.blp", "Sasuke-icon.blp")
        call SetHeroData('H02E', "satomipick.mp3", "", "", "Satomi-icon.blp", "Satomi-icon.blp")
        call SetHeroData('H042', "tsunapick.mp3", "tsuna10k.mp3", "tsuna15k.mp3", "Sawada-icon.blp", "Sawada-icon.blp")
        call SetHeroData('H0G0', "shanapick.mp3", "shana10k.mp3", "shana15k.mp3", "Shana-icon.blp", "Shana-icon.blp")
            
        call SetHeroData('H0CQ', "nanayapick.mp3", "nanaya10k.mp3", "nanaya15k.mp3", "Nanaya-icon.blp", "Nanaya-icon.blp")
        call SetHeroData('H0FC', "", "", "", "Ryougi-icon.blp", "Ryougi-icon.blp")
        call SetHeroData('H0EG', "tohnopick.mp3", "tohno10k.mp3", "tohno15k.mp3", "Tohno-icon.blp", "Tohno-icon.blp")
        call SetHeroData('H00W', "", "", "", "Sistina-icon.blp", "Sistina-icon.blp")
        call SetHeroData('H03B', "", "", "", "Sting-icon.blp", "Sting-icon.blp")
        call SetHeroData('H00X', "", "", "", "Momiji-icon.blp", "Momiji-icon.blp")
        call SetHeroData('H029', "", "", "", "Kisara-icon.blp", "Kisara-icon.blp")
        call SetHeroData('H00Y', "", "", "", "Kirin-icon.blp", "Kirin-icon.blp")
        call SetHeroData('H00U', "", "", "", "Tohka-icon.blp", "Tohka-icon.blp")
        call SetHeroData('H02V', "kurumipick.mp3", "", "", "Kurumi-icon.blp", "Kurumi-icon.blp")
            
        call SetHeroData('H05R', "vegetapick.mp3", "vegeta10k.mp3", "vegeta15k.mp3", "Vegeta-icon.blp", "Vegeta-icon.blp")
        call SetHeroData('H0CP', "", "", "", "Wendy-icon.blp", "Wendy-icon.blp")
        call SetHeroData('H0FU', "", "", "", "Yamaji-icon.blp", "Yamaji-icon.blp")
        call SetHeroData('H00Q', "", "", "", "Miu-icon.blp", "Miu-icon.blp")
        call SetHeroData('H008', "yomipick.mp3", "", "", "Yomi-icon.blp", "Yomi-icon.blp")
        call SetHeroData('H0D2', "", "", "", "Yugi-icon.blp", "Yugi-icon.blp")
        call SetHeroData('H000', "zamasupick.mp3", "zamasu10k.mp3", "", "Zamasu-icon.blp", "Zamasu-icon.blp")
        call SetHeroData('H030', "", "", "", "Zancrow-icon.blp", "Zancrow-icon.blp")
    
        set MaxHero = heroId - 1
    endfunction

    globals
        real SelectHeroTime = 60
        integer MaxHero = 0
    endglobals

    private function ButtonFocus takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle trigFrame = GetTriggerFrame()

        if GetLocalPlayer() == p then
            call SetFrameEnabled(trigFrame, false)
            call SetFrameEnabled(trigFrame, true)
        endif

        set p = null
        set trigFrame = null
    endfunction

    globals
        integer array MemoHero
        boolean array HeroGone
        boolean array SelectedYet
    endglobals

    function HeroButtonClick takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle trigFrame = GetTriggerFrame()
        local framehandle backFrame
        local mousebuttontype mouseType = GetTriggerFrameMouseButton()
        local integer frameId = LoadInteger(ht, StringHash("HeroIndex"), GetHandleId(trigFrame))
        local integer pid = GetPlayerId(p)

        if GetLocalPlayer() == p then
            call SetFrameEnabled(trigFrame, false)
            call SetFrameEnabled(trigFrame, true)
        endif

        if mouseType == MOUSE_BUTTON_TYPE_RIGHT and not SelectedYet[pid] and not HeroGone[frameId] then
            set MemoHero[pid] = frameId

            set backFrame = GetFrameByName("SelectHeroBackViewFrame", pid)
            call SetFrameTexture(backFrame, HeroPhoto[frameId], 0, false)

            set backFrame = GetFrameByName("SelectHeroButtonBackFrame", frameId)
            call SetFrameTexture(backFrame, HeroPhoto2[frameId], 0, false)

            if HeroVoice[frameId] != "" then
                call SoundStartPlayer(HeroVoice[frameId], p, true)
            endif

            set HeroGone[frameId] = true
            set SelectedYet[pid] = true
        endif

        set p = null
        set trigFrame = null
        set backFrame = null
        set mouseType = null
    endfunction

    globals
        real array heroiconX
        real array heroiconY
        private integer heroiconMaxScroll = 3
    endglobals

    function HeroSelectionScrolling takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle trigFrame = GetTriggerFrame()
        local framehandle scrollFrame = GetFrameByName("SelectHeroScrollFrame", 0)
        local real frameValue = GetTriggerFrameReal()

        if frameValue > 0 then
            if GetLocalPlayer() == p then
                call SetFrameValue(scrollFrame, GetFrameValue(scrollFrame) + 1)
            endif
        else
            if GetLocalPlayer() == p then
                call SetFrameValue(scrollFrame, GetFrameValue(scrollFrame) - 1)
            endif
        endif

        set p = null
        set trigFrame = null
        set scrollFrame = null
    endfunction

    function HeroSelectionSlider takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle trigFrame = GetTriggerFrame()
        local framehandle buttonFrame
        local framehandle timerFrame = GetFrameByName("SelectHeroTimerFrame", 0)
        local real frameValue = GetTriggerFrameReal()
        local integer i = 0
        local integer j = 0
        local integer k = 1

        loop
            exitwhen k > MaxHero
            set buttonFrame = GetFrameByName("SelectHeroButtonFrame", k)
            if IsFrameVisible(buttonFrame) then
                call ShowFrame(buttonFrame, false)
            endif
            set k = k + 1
        endloop

        if frameValue == 3 then
            set k = 1
            loop
                exitwhen k > MaxHero - 21
                set buttonFrame = GetFrameByName("SelectHeroButtonFrame", k)
                set heroiconX[i] = 0.003 + 0.032 * i
                set heroiconY[j] = - 0.001 - 0.034 * j
                call SetFrameRelativePoint(buttonFrame, FRAMEPOINT_TOPLEFT, timerFrame, FRAMEPOINT_BOTTOMLEFT, heroiconX[i], heroiconY[j])
                if not IsFrameVisible(buttonFrame) then
                    call ShowFrame(buttonFrame, true)
                endif
                set i = i + 1
                if i >= 10 then
                    set i = 0
                    set j = j + 1
                endif
                set k = k + 1
            endloop
        elseif frameValue == 2 then
            set k = 11
            loop
                exitwhen k > MaxHero - 11
                set buttonFrame = GetFrameByName("SelectHeroButtonFrame", k)
                set heroiconX[i] = 0.003 + 0.032 * i
                set heroiconY[j] = - 0.001 - 0.034 * j
                call SetFrameRelativePoint(buttonFrame, FRAMEPOINT_TOPLEFT, timerFrame, FRAMEPOINT_BOTTOMLEFT, heroiconX[i], heroiconY[j])
                if not IsFrameVisible(buttonFrame) then
                    call ShowFrame(buttonFrame, true)
                endif
                set i = i + 1
                if i >= 10 then
                    set i = 0
                    set j = j + 1
                endif
                set k = k + 1
            endloop
        elseif frameValue == 1 then
            set k = 21
            loop
                exitwhen k > MaxHero - 1
                set buttonFrame = GetFrameByName("SelectHeroButtonFrame", k)
                set heroiconX[i] = 0.003 + 0.032 * i
                set heroiconY[j] = - 0.001 - 0.034 * j
                call SetFrameRelativePoint(buttonFrame, FRAMEPOINT_TOPLEFT, timerFrame, FRAMEPOINT_BOTTOMLEFT, heroiconX[i], heroiconY[j])
                if not IsFrameVisible(buttonFrame) then
                    call ShowFrame(buttonFrame, true)
                endif
                set i = i + 1
                if i >= 10 then
                    set i = 0
                    set j = j + 1
                endif
                set k = k + 1
            endloop
        elseif frameValue == 0 then
            set k = 31
            loop
                exitwhen k > MaxHero
                set buttonFrame = GetFrameByName("SelectHeroButtonFrame", k)
                set heroiconX[i] = 0.003 + 0.032 * i
                set heroiconY[j] = - 0.001 - 0.034 * j
                call SetFrameRelativePoint(buttonFrame, FRAMEPOINT_TOPLEFT, timerFrame, FRAMEPOINT_BOTTOMLEFT, heroiconX[i], heroiconY[j])
                if not IsFrameVisible(buttonFrame) then
                    call ShowFrame(buttonFrame, true)
                endif
                set i = i + 1
                if i >= 10 then
                    set i = 0
                    set j = j + 1
                endif
                set k = k + 1
            endloop
        endif

        set p = null
        set trigFrame = null
        set buttonFrame = null
        set timerFrame = null
    endfunction

    function createSelectionUI takes nothing returns nothing
        local framehandle unitmsgFrame = GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0)
        local framehandle gameuiFrame = GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
        local framehandle chatmsgFrame = GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0)
        local framehandle editbarFrame = GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0)
        local framehandle mainFrame
        local framehandle backviewFrame
        local framehandle timerFrame
        local framehandle timertxtFrame
        local framehandle buttonFrame
        local framehandle buttonbackFrame
        local framehandle buttonTipFrame
        local framehandle buttonTxtFrame
        local framehandle scrollareaFrame
        local framehandle scrollFrame
        local trigger trig
        local integer i = 0
        local integer j = 0
        local integer k = 1

        call ClearFrameAllPoints(unitmsgFrame)
        call SetFrameRelativePoint(unitmsgFrame, FRAMEPOINT_BOTTOMLEFT, gameuiFrame, FRAMEPOINT_BOTTOMLEFT, 0.05, 0.07)
        call ClearFrameAllPoints(chatmsgFrame)
        call SetFrameRelativePoint(chatmsgFrame, FRAMEPOINT_BOTTOMLEFT, gameuiFrame, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.04)
        call SetFrameRelativePoint(chatmsgFrame, FRAMEPOINT_TOPRIGHT, gameuiFrame, FRAMEPOINT_BOTTOMLEFT, 0.28, 0.16)
        call ClearFrameAllPoints(editbarFrame)
        call SetFrameRelativePoint(editbarFrame, FRAMEPOINT_TOPLEFT, chatmsgFrame, FRAMEPOINT_BOTTOMLEFT, - 0.005, - 0.005)
        call SetFrameRelativePoint(editbarFrame, FRAMEPOINT_BOTTOMRIGHT, chatmsgFrame, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.031)
        
        set mainFrame = CreateFrameByType("BACKDROP", "SelectHeroMainFrame", gameuiFrame, "", 0) 
        call SetFrameBackdropTexture(mainFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL, false)
        call SetFrameCornerSize(mainFrame, 0, 0.0125)
        call SetFrameBackgroundInsets(mainFrame, 0, 0.005, 0.005, 0.005, 0.005)
        call SetFrameSize(mainFrame, 0.35, 0.31)
        call SetFrameRelativePoint(mainFrame, FRAMEPOINT_BOTTOMLEFT, gameuiFrame, FRAMEPOINT_BOTTOMLEFT, 0.2, 0.2)

        set scrollareaFrame = CreateFrameByType("BUTTON", "SelectHeroScrollAreaFrame", mainFrame, "", 0)
        call SetFrameAllPoints(scrollareaFrame, mainFrame)
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, scrollareaFrame, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(trig, function ButtonFocus)
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, scrollareaFrame, FRAMEEVENT_MOUSE_WHEEL)
        call TriggerAddAction(trig, function HeroSelectionScrolling)

        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 1) // Team 1
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, 0.005, - 0.005)
        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 2)
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 1), FRAMEPOINT_RIGHT, 0.001, 0)
        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 3)
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 2), FRAMEPOINT_RIGHT, 0.001, 0)

        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 5) // Team 2
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 3), FRAMEPOINT_RIGHT, 0.031, 0)
        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 6)
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 5), FRAMEPOINT_RIGHT, 0.001, 0)
        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 7)
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 6), FRAMEPOINT_RIGHT, 0.001, 0)

        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 9) // Team 3
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 7), FRAMEPOINT_RIGHT, 0.031, 0)
        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 10)
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 9), FRAMEPOINT_RIGHT, 0.001, 0)
        set backviewFrame = CreateFrameByType("BACKDROP", "SelectHeroBackViewFrame", mainFrame, "", 11)
        call SetFrameTexture(backviewFrame, "war3mapImported\\selectview.blp", 0, false)
        call SetFrameSize(backviewFrame, 0.03, 0.03)
        call SetFrameRelativePoint(backviewFrame, FRAMEPOINT_LEFT, GetFrameByName("SelectHeroBackViewFrame", 10), FRAMEPOINT_RIGHT, 0.001, 0)

        set timerFrame = CreateFrameByType("BACKDROP", "SelectHeroTimerFrame", mainFrame, "", 0)
        call SetFrameBackdropTexture(timerFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL, false)
        call SetFrameCornerSize(timerFrame, 0, 0.0125)
        call SetFrameBackgroundInsets(timerFrame, 0, 0.005, 0.005, 0.005, 0.005)
        call SetFrameSize(timerFrame, 0.34, 0.025)
        call SetFrameRelativePoint(timerFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SelectHeroBackViewFrame", 1), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)

        set timertxtFrame = CreateFrameByType("TEXT", "SelectHeroTimerTextFrame", timerFrame, "", 0)
        call SetFrameTextAlignment(timertxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(timertxtFrame, "Fonts\\FRIZQT__.TTF", 0.013, 0)
        call SetFrameRelativePoint(timertxtFrame, FRAMEPOINT_CENTER, timerFrame, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(timertxtFrame, "Selection Time Left : " + R2SW(SelectHeroTime, 0, 1) )
        call SetFrameEnabled(timertxtFrame, false)

        set scrollFrame = CreateFrameByType("SCROLLBAR", "SelectHeroScrollFrame", mainFrame, "QuestMainListScrollBar", 0)
        call ClearFrameAllPoints(scrollFrame)
        call SetFrameMinMaxValues(scrollFrame, 0, heroiconMaxScroll)
        call SetFrameValue(scrollFrame, heroiconMaxScroll)
        call SetFrameStepSize(scrollFrame, 1)
        call SetFrameSize(scrollFrame, 0.012, 0.22)
        call SetFrameRelativePoint(scrollFrame, FRAMEPOINT_RIGHT, mainFrame, FRAMEPOINT_RIGHT, - 0.005, - 0.015)
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, scrollFrame, FRAMEEVENT_SLIDER_VALUE_CHANGED)
        call TriggerAddAction(trig, function HeroSelectionSlider)

        call InitHeroData()
        loop
            exitwhen k > MaxHero
            set buttonFrame = CreateFrameByType("BUTTON", "SelectHeroButtonFrame", mainFrame, "", k)
            call SetFrameSize(buttonFrame, 0.03, 0.03)
            if j < 7 then
                set heroiconX[i] = 0.003 + 0.032 * i
                set heroiconY[j] = - 0.001 - 0.034 * j
                call SetFrameRelativePoint(buttonFrame, FRAMEPOINT_TOPLEFT, timerFrame, FRAMEPOINT_BOTTOMLEFT, heroiconX[i], heroiconY[j])
            else
                call ShowFrame(buttonFrame, false)
            endif
            set buttonbackFrame = CreateFrameByType("BACKDROP", "SelectHeroButtonBackFrame", buttonFrame, "", k)
            call SetFrameAllPoints(buttonbackFrame, buttonFrame)
            call SetFrameTexture(buttonbackFrame, HeroPhoto[k], 0, false)
            set buttonTipFrame = CreateFrameByType("BACKDROP", "SelectHeroButtonTipFrame", buttonFrame, "", k)
            call SetFrameBackdropTexture(buttonTipFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL, false)
            call SetFrameCornerSize(buttonTipFrame, 0, 0.0125)
            call SetFrameBackgroundInsets(buttonTipFrame, 0, 0.005, 0.005, 0.005, 0.005)
            set buttonTxtFrame = CreateFrameByType("TEXT", "SelectHeroButtonTxtFrame", buttonTipFrame, "", k)
            call SetFrameTextAlignment(buttonTxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
            call SetFrameFont(buttonTxtFrame, "Fonts\\FRIZQT__.TTF", 0.011, 0)
            call SetFrameWidth(buttonTxtFrame, 0.16)
            call SetFrameRelativePoint(buttonTxtFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPRIGHT, 0.005, - 0.005)
            call SetFrameRelativePoint(buttonTipFrame, FRAMEPOINT_BOTTOMLEFT, buttonTxtFrame, FRAMEPOINT_BOTTOMLEFT, - 0.01, - 0.01)
            call SetFrameRelativePoint(buttonTipFrame, FRAMEPOINT_TOPRIGHT, buttonTxtFrame, FRAMEPOINT_TOPRIGHT, 0.01, 0.01)
            call SetFrameTooltip(buttonFrame, buttonTipFrame)
            call SetFrameText(buttonTxtFrame, "|cffFFDC00" + GetUnitBaseStringFieldById(HeroType[k], UNIT_SF_NAME) + "|r\n\n|cffFFDC00Base Attack Time|r : " + R2S(GetUnitBaseWeaponRealFieldById(HeroType[k], UNIT_WEAPON_RF_ATTACK_BASE_COOLDOWN, 0)) + "\n|cffFFDC00Strength|r : " + I2S(GetUnitBaseIntegerFieldById(HeroType[k], UNIT_IF_STRENGTH_BASE)) + " + " + R2S(GetUnitBaseRealFieldById(HeroType[k], UNIT_RF_STRENGTH_PER_LEVEL)) + "\n|cffFFDC00Agility|r : " + I2S(GetUnitBaseIntegerFieldById(HeroType[k], UNIT_IF_AGILITY_BASE)) + " + " + R2S(GetUnitBaseRealFieldById(HeroType[k], UNIT_RF_AGILITY_PER_LEVEL)) + "\n|cffFFDC00Intelligence|r : " + I2S(GetUnitBaseIntegerFieldById(HeroType[k], UNIT_IF_INTELLIGENCE_BASE)) + " + " + R2S(GetUnitBaseRealFieldById(HeroType[k], UNIT_RF_INTELLIGENCE_PER_LEVEL)) )
            call SetFrameEnabled(buttonTxtFrame, false)
            set trig = CreateTrigger()
            call SaveInteger(ht, StringHash("HeroIndex"), GetHandleId(buttonFrame), k)
            call TriggerRegisterFrameEvent(trig, buttonFrame, FRAMEEVENT_CONTROL_CLICK)
            call RegisterFrameMouseButton(buttonFrame, MOUSE_BUTTON_TYPE_RIGHT, true)
            call TriggerAddAction(trig, function HeroButtonClick)
            set i = i + 1
            if i >= 10 then
                set i = 0
                set j = j + 1
            endif
            set k = k + 1
        endloop
        
        set unitmsgFrame = null
        set gameuiFrame = null
        set chatmsgFrame = null
        set editbarFrame = null
        set mainFrame = null
        set backviewFrame = null
        set timerFrame = null
        set timertxtFrame = null
        set buttonFrame = null
        set buttonbackFrame = null
        set buttonTipFrame = null
        set buttonTxtFrame = null
        set scrollareaFrame = null
        set scrollFrame = null
        set trig = null
    endfunction

    globals
        framehandle pXPBar = null
        framehandle pHPBar = null
        framehandle pMPBar = null
    endglobals
    
    function createDefaultUI takes nothing returns nothing
        local framehandle gameuiFrame = GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
        local framehandle mapborderFrame
        local framehandle mainFrame
        local framehandle photoFrame
        local framehandle statFrame
        local framehandle stattxtFrame
        local framehandle simpleFrame
        local framehandle background
        local framehandle foreground
        local framehandle simpletxtFrame
        local framehandle buffFrame
        local trigger trig
        local integer i
    
        call SetFrameRelativePoint(GetFrameByName("ResourceBarFrame", 0), FRAMEPOINT_TOPRIGHT, gameuiFrame, FRAMEPOINT_TOPRIGHT, 0.0875, 0.0 )
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarQuestsButton", 0), FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarMenuButton", 0), FRAMEPOINT_LEFT, 0.63, 0.57)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarAlliesButton", 0), FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(GetFrameByName("UpperButtonBarChatButton", 0), FRAMEPOINT_LEFT, 0.715, 0.57)
            
        set mapborderFrame = CreateFrameByType("BACKDROP", "MiniMapBorderFrame", gameuiFrame, "", 0)
        call SetFrameBackdropTexture(mapborderFrame, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL, false)
        call SetFrameCornerSize(mapborderFrame, 0, 0.0125)
        call SetFrameBackgroundInsets(mapborderFrame, 0, 0.005, 0.005, 0.005, 0.005)
        call SetFrameSize(mapborderFrame, 0.13, 0.13)
        call SetFrameRelativePoint(mapborderFrame, FRAMEPOINT_BOTTOMLEFT, gameuiFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
            
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_MINIMAP, 0), FRAMEPOINT_BOTTOMLEFT, mapborderFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_MINIMAP, 0), FRAMEPOINT_TOPRIGHT, mapborderFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
    
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0), FRAMEPOINT_BOTTOMLEFT, mapborderFrame, FRAMEPOINT_TOPLEFT, 0.005, 0.03)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0), FRAMEPOINT_TOPRIGHT, mapborderFrame, FRAMEPOINT_TOPLEFT, 0.32, 0.2)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0), FRAMEPOINT_BOTTOMLEFT, GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0), FRAMEPOINT_CENTER, - 0.05, 0)
            
        set mainFrame = CreateFrameByType("BACKDROP", "MainDefaultFrame", gameuiFrame, "", 0)
        call SetFrameBackdropTexture(mainFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL, false)
        call SetFrameCornerSize(mainFrame, 0, 0.0125)
        call SetFrameBackgroundInsets(mainFrame, 0, 0.005, 0.005, 0.005, 0.005)
        call SetFrameSize(mainFrame, 0.13, 0.13)
        call SetFrameRelativePoint(mainFrame, FRAMEPOINT_BOTTOMLEFT, mapborderFrame, FRAMEPOINT_BOTTOMRIGHT, 0.005, 0)
            
        set photoFrame = CreateFrameByType("BACKDROP", "MainPhotoFrame", mainFrame, "", 0)
        call SetFrameTexture(photoFrame, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", 0, false)
        call SetFrameSize(photoFrame, 0.06, 0.12)
        call SetFrameRelativePoint(photoFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, 0.005, - 0.005)
    
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_PORTRAIT, 0))
        call SetFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_PORTRAIT, 0), photoFrame)
    
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0), FRAMEPOINT_BOTTOMLEFT, mainFrame, FRAMEPOINT_TOPLEFT, 0, 0.001)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0), FRAMEPOINT_TOPRIGHT, mainFrame, FRAMEPOINT_TOPRIGHT, 0.1, 0.025)

        set statFrame = CreateFrameByType("BACKDROP", "MainStatFrame", mainFrame, "", 0)
        call SetFrameTexture(statFrame, "ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp", 0, false)
        call SetFrameSize(statFrame, 0.016, 0.016)
        call SetFrameRelativePoint(statFrame, FRAMEPOINT_TOPLEFT, photoFrame, FRAMEPOINT_TOPRIGHT, 0, 0)
        set stattxtFrame = CreateFrameByType("TEXT", "MainStatTxtFrame", statFrame, "", 0)
        call SetFrameTextAlignment(stattxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(stattxtFrame, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameText(stattxtFrame, "STR")
        call SetFrameRelativePoint(stattxtFrame, FRAMEPOINT_LEFT, statFrame, FRAMEPOINT_RIGHT, 0.001, 0)

        set statFrame = CreateFrameByType("BACKDROP", "MainStatFrame", mainFrame, "", 1)
        call SetFrameTexture(statFrame, "ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp", 0, false)
        call SetFrameSize(statFrame, 0.016, 0.016)
        call SetFrameRelativePoint(statFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("MainStatFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set stattxtFrame = CreateFrameByType("TEXT", "MainStatTxtFrame", statFrame, "", 1)
        call SetFrameTextAlignment(stattxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(stattxtFrame, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameText(stattxtFrame, "AGI")
        call SetFrameRelativePoint(stattxtFrame, FRAMEPOINT_LEFT, statFrame, FRAMEPOINT_RIGHT, 0.001, 0)

        set statFrame = CreateFrameByType("BACKDROP", "MainStatFrame", mainFrame, "", 2)
        call SetFrameTexture(statFrame, "ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp", 0, false)
        call SetFrameSize(statFrame, 0.016, 0.016)
        call SetFrameRelativePoint(statFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("MainStatFrame", 1), FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set stattxtFrame = CreateFrameByType("TEXT", "MainStatTxtFrame", statFrame, "", 2)
        call SetFrameTextAlignment(stattxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(stattxtFrame, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameText(stattxtFrame, "INT")
        call SetFrameRelativePoint(stattxtFrame, FRAMEPOINT_LEFT, statFrame, FRAMEPOINT_RIGHT, 0.001, 0)

        set statFrame = CreateFrameByType("BACKDROP", "MainStatFrame", mainFrame, "", 3)
        call SetFrameTexture(statFrame, "ReplaceableTextures\\CommandButtons\\BTNSteelMelee.blp", 0, false)
        call SetFrameSize(statFrame, 0.016, 0.016)
        call SetFrameRelativePoint(statFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("MainStatFrame", 2), FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set stattxtFrame = CreateFrameByType("TEXT", "MainStatTxtFrame", statFrame, "", 3)
        call SetFrameTextAlignment(stattxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(stattxtFrame, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameText(stattxtFrame, "DMG")
        call SetFrameRelativePoint(stattxtFrame, FRAMEPOINT_LEFT, statFrame, FRAMEPOINT_RIGHT, 0.001, 0)

        set statFrame = CreateFrameByType("BACKDROP", "MainStatFrame", mainFrame, "", 4)
        call SetFrameTexture(statFrame, "ReplaceableTextures\\CommandButtons\\BTNSteelArmor.blp", 0, false)
        call SetFrameSize(statFrame, 0.016, 0.016)
        call SetFrameRelativePoint(statFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("MainStatFrame", 3), FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        set stattxtFrame = CreateFrameByType("TEXT", "MainStatTxtFrame", statFrame, "", 4)
        call SetFrameTextAlignment(stattxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(stattxtFrame, "Fonts\\FRIZQT__.TTF", 0.008, 0)
        call SetFrameText(stattxtFrame, "DEF")
        call SetFrameRelativePoint(stattxtFrame, FRAMEPOINT_LEFT, statFrame, FRAMEPOINT_RIGHT, 0.001, 0)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "XPSimpleFrame", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.268, 0.02)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPRIGHT, 0.001, - 0.025)

        set background = CreateFrameByType("SIMPLESTATUSBAR", "XPStatusFrame", simpleFrame, "", 0)
        set foreground = CreateFrameByType("SIMPLESTATUSBAR", "XPStatusFrame", background, "", 1)
        call ClearFrameAllPoints(background)
        call ClearFrameAllPoints(foreground)
        call SetFrameTexture(background, "textures\\black32.blp", 0, false)
        call SetFrameValue(background, 100)
        call SetFrameTexture(foreground, "ReplaceableTextures\\TeamColor\\TeamColor03.blp", 0, false)
        call SetFrameMinMaxValues(foreground, 0, 1)
        call SetFrameValue(foreground, 1)
        call SetFrameRelativePoint(background, FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(background, FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        call SetFrameRelativePoint(foreground, FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(foreground, FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        call ShowFrame(background, true)
        call ShowFrame(foreground, true)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "XPStatusTxtFrame", foreground, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, foreground, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(simpletxtFrame, "")
        call ShowFrame(simpletxtFrame, true)

        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BAR, 0))
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 0))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 0), FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 3))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 3), FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 6))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 6), FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 9))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 9), FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 1))
        call SetFrameAbsolutePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 1), FRAMEPOINT_CENTER, 10.0, 10.0)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "SkillSimpleFrame", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.037, 0.037)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("XPSimpleFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 2))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 2), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 2), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "SkillSimpleFrame", gameuiFrame, "", 1)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.037, 0.037)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillSimpleFrame", 0), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 5))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 5), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 5), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "SkillSimpleFrame", gameuiFrame, "", 2)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.037, 0.037)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillSimpleFrame", 1), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 8))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 8), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 8), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "SkillSimpleFrame", gameuiFrame, "", 3)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.037, 0.037)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillSimpleFrame", 2), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 11))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 11), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 11), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "SkillSimpleFrame", gameuiFrame, "", 4)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.037, 0.037)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillSimpleFrame", 3), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 10))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 10), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 10), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "SkillSimpleFrame", gameuiFrame, "", 5)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.037, 0.037)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillSimpleFrame", 4), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 7))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 7), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 7), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "SkillSimpleFrame", gameuiFrame, "", 6)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.037, 0.037)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillSimpleFrame", 5), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 4))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 4), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 4), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "HPSimpleFrame", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.268, 0.02)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("SkillSimpleFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)

        set background = CreateFrameByType("SIMPLESTATUSBAR", "HPStatusFrame", simpleFrame, "", 0)
        set foreground = CreateFrameByType("SIMPLESTATUSBAR", "HPStatusFrame", background, "", 1)
        call ClearFrameAllPoints(background)
        call ClearFrameAllPoints(foreground)
        call SetFrameTexture(background, "textures\\black32.blp", 0, false)
        call SetFrameValue(background, 100)
        call SetFrameTexture(foreground, "ReplaceableTextures\\TeamColor\\TeamColor06.blp", 0, false)
        call SetFrameValue(foreground, 100)
        call SetFrameRelativePoint(background, FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(background, FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        call SetFrameRelativePoint(foreground, FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(foreground, FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        call ShowFrame(background, true)
        call ShowFrame(foreground, true)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "HPStatusTxtFrame", foreground, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, foreground, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(simpletxtFrame, "")
        call ShowFrame(simpletxtFrame, true)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "MPSimpleFrame", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.268, 0.02)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\blank-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("HPSimpleFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)

        set background = CreateFrameByType("SIMPLESTATUSBAR", "MPStatusFrame", simpleFrame, "", 0)
        set foreground = CreateFrameByType("SIMPLESTATUSBAR", "MPStatusFrame", background, "", 1)
        call ClearFrameAllPoints(background)
        call ClearFrameAllPoints(foreground)
        call SetFrameTexture(background, "textures\\black32.blp", 0, false)
        call SetFrameValue(background, 100)
        call SetFrameTexture(foreground, "ReplaceableTextures\\TeamColor\\TeamColor01.blp", 0, false)
        call SetFrameValue(foreground, 100)
        call SetFrameRelativePoint(background, FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(background, FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        call SetFrameRelativePoint(foreground, FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(foreground, FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        call ShowFrame(background, true)
        call ShowFrame(foreground, true)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "MPStatusTxtFrame", foreground, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, foreground, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(simpletxtFrame, "")
        call ShowFrame(simpletxtFrame, true)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ItemSimpleFrame", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.032, 0.032)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("XPSimpleFrame", 0), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 0), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 0), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ItemSimpleFrame", gameuiFrame, "", 1)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.032, 0.032)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemSimpleFrame", 0), FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 1))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 1), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 1), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ItemSimpleFrame", gameuiFrame, "", 2)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.032, 0.032)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemSimpleFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 2))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 2), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 2), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ItemSimpleFrame", gameuiFrame, "", 3)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.032, 0.032)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemSimpleFrame", 1), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 3))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 3), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 3), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ItemSimpleFrame", gameuiFrame, "", 4)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.032, 0.032)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemSimpleFrame", 2), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 4))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 4), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 4), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ItemSimpleFrame", gameuiFrame, "", 5)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.032, 0.032)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ItemSimpleFrame", 3), FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 5))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 5), FRAMEPOINT_BOTTOMLEFT, simpleFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 5), FRAMEPOINT_TOPRIGHT, simpleFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_UBERTOOLTIP, 0))
        call SetFrameRelativePoint(GetOriginFrame(ORIGIN_FRAME_UBERTOOLTIP, 0), FRAMEPOINT_BOTTOMRIGHT, gameuiFrame, FRAMEPOINT_BOTTOMRIGHT, - 0.001, 0.135)

        set i = 0
        loop
            exitwhen i > 7
            set buffFrame = GetOriginFrame(ORIGIN_FRAME_BUFF_BAR_INDICATOR, i)
            call ClearFrameAllPoints(buffFrame)
            call SetFrameRelativePoint(buffFrame, FRAMEPOINT_BOTTOMLEFT, GetFrameByName("XPSimpleFrame", 0), FRAMEPOINT_TOPLEFT, i * 0.021, 0.001)
            call SetFrameRelativePoint(buffFrame, FRAMEPOINT_TOPRIGHT, GetFrameByName("XPSimpleFrame", 0), FRAMEPOINT_TOPLEFT, 0.02 + i * 0.02, 0.02)
            set i = i + 1
        endloop 
            
        set gameuiFrame = null
        set mapborderFrame = null
        set mainFrame = null
        set photoFrame = null
        set statFrame = null
        set stattxtFrame = null
        set simpleFrame = null
        set background = null
        set foreground = null 
        set simpletxtFrame = null
        set buffFrame = null
        set trig = null
    endfunction
    
    function createDefaultUI2 takes nothing returns nothing
        local framehandle gameuiFrame = GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
        local framehandle simpleFrame
        local framehandle simpletxtFrame
        local framehandle textureFrame
        local trigger trig
        local integer i
        local integer j
        local integer k

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ScoreBackground", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.1, 0.035)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, gameuiFrame, FRAMEPOINT_TOPLEFT, 0.001, - 0.001)

        set i = 1
        loop
            exitwhen i > 3
            set textureFrame = CreateFrameByType("SIMPLETEXTURE", "ScoreHeroBackground", simpleFrame, "", i)
            call ClearFrameAllPoints(textureFrame)
            call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, simpleFrame, FRAMEPOINT_TOPLEFT, 0.005 + (i - 1) * 0.035, - 0.005)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_BOTTOMRIGHT, simpleFrame, FRAMEPOINT_TOPLEFT, 0.025 + (i - 1) * 0.035, - 0.025)
            call ShowFrame(textureFrame, true)

            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "ScoreHeroTimerFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.011, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, textureFrame, FRAMEPOINT_CENTER, 0, 0)
            call SetFrameText(simpletxtFrame, "")
            call ShowFrame(simpletxtFrame, true)
            set i = i + 1
        endloop

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ScoreBackground", GetFrameByName("ScoreBackground", 0), "", 1)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.035, 0.025)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOP, GetFrameByName("ScoreBackground", 0), FRAMEPOINT_BOTTOM, 0, 0.01)
        call ShowFrame(simpleFrame, true)
        
        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "ScoreTxtFrame", simpleFrame, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, simpleFrame, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(simpletxtFrame, "0")
        call ShowFrame(simpletxtFrame, true)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ScoreBackground", gameuiFrame, "", 2)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.1, 0.035)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ScoreBackground", 0), FRAMEPOINT_TOPRIGHT, 0.001, 0)

        set i = 5
        loop
            exitwhen i > 7
            set textureFrame = CreateFrameByType("SIMPLETEXTURE", "ScoreHeroBackground", simpleFrame, "", i)
            call ClearFrameAllPoints(textureFrame)
            call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, simpleFrame, FRAMEPOINT_TOPLEFT, 0.005 + (i - 5) * 0.035, - 0.005)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_BOTTOMRIGHT, simpleFrame, FRAMEPOINT_TOPLEFT, 0.025 + (i - 5) * 0.035, - 0.025)
            call ShowFrame(textureFrame, true)

            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "ScoreHeroTimerFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.011, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, textureFrame, FRAMEPOINT_CENTER, 0, 0)
            call SetFrameText(simpletxtFrame, "")
            call ShowFrame(simpletxtFrame, true)
            set i = i + 1
        endloop

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ScoreBackground", GetFrameByName("ScoreBackground", 2), "", 3)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.035, 0.025)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOP, GetFrameByName("ScoreBackground", 2), FRAMEPOINT_BOTTOM, 0, 0.01)
        call ShowFrame(simpleFrame, true)
        
        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "ScoreTxtFrame", simpleFrame, "", 1)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, simpleFrame, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(simpletxtFrame, "0")
        call ShowFrame(simpletxtFrame, true)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ScoreBackground", gameuiFrame, "", 4)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.1, 0.035)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ScoreBackground", 2), FRAMEPOINT_TOPRIGHT, 0.001, 0)

        set i = 9
        loop
            exitwhen i > 11
            set textureFrame = CreateFrameByType("SIMPLETEXTURE", "ScoreHeroBackground", simpleFrame, "", i)
            call ClearFrameAllPoints(textureFrame)
            call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, simpleFrame, FRAMEPOINT_TOPLEFT, 0.005 + (i - 9) * 0.035, - 0.005)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_BOTTOMRIGHT, simpleFrame, FRAMEPOINT_TOPLEFT, 0.025 + (i - 9) * 0.035, - 0.025)
            call ShowFrame(textureFrame, true)

            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "ScoreHeroTimerFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.011, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, textureFrame, FRAMEPOINT_CENTER, 0, 0)
            call SetFrameText(simpletxtFrame, "")
            call ShowFrame(simpletxtFrame, true)
            set i = i + 1
        endloop

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "ScoreBackground", GetFrameByName("ScoreBackground", 4), "", 5)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.035, 0.025)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOP, GetFrameByName("ScoreBackground", 4), FRAMEPOINT_BOTTOM, 0, 0.01)
        call ShowFrame(simpleFrame, true)
        
        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "ScoreTxtFrame", simpleFrame, "", 2)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, simpleFrame, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(simpletxtFrame, "0")
        call ShowFrame(simpletxtFrame, true)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "TourBackground", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.12, 0.035)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("ScoreBackground", 4), FRAMEPOINT_TOPRIGHT, 0.001, 0)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "TourTxtFrame", simpleFrame, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_CENTER, simpleFrame, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(simpletxtFrame, "")
        call ShowFrame(simpletxtFrame, true)

        set simpleFrame = CreateFrameByType("SIMPLEFRAME", "BoardMainFrame", gameuiFrame, "", 0)
        call ClearFrameAllPoints(simpleFrame)
        call SetFrameSize(simpleFrame, 0.3, 0.25)
        call SetFrameTextureEx(simpleFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL)
        call SetFrameRelativePoint(simpleFrame, FRAMEPOINT_CENTER, gameuiFrame, FRAMEPOINT_CENTER, 0, 0.05)
        call ShowFrame(simpleFrame, false)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "BoardIconFrame", simpleFrame, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_LEFT, TEXT_JUSTIFY_MIDDLE)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOPLEFT, simpleFrame, FRAMEPOINT_TOPLEFT, 0.005, - 0.005)
        call SetFrameText(simpletxtFrame, "HeroIcon")
        call ShowFrame(simpletxtFrame, true)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "BoardLevelFrame", simpleFrame, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameWidth(simpletxtFrame, 0.04)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardIconFrame", 0), FRAMEPOINT_TOPLEFT, 0.07, 0)
        call SetFrameText(simpletxtFrame, "HeroLevel")
        call ShowFrame(simpletxtFrame, true)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "BoardScoreFrame", simpleFrame, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameWidth(simpletxtFrame, 0.08)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardLevelFrame", 0), FRAMEPOINT_TOPLEFT, 0.03, 0)
        call SetFrameText(simpletxtFrame, "K / D / A")
        call ShowFrame(simpletxtFrame, true)

        set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "BoardItemFrame", simpleFrame, "", 0)
        call ClearFrameAllPoints(simpletxtFrame)
        call SetFrameWidth(simpletxtFrame, 0.1)
        call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
        call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardScoreFrame", 0), FRAMEPOINT_TOPLEFT, 0.075, 0)
        call SetFrameText(simpletxtFrame, "ITEM")
        call ShowFrame(simpletxtFrame, true)

        set i = 1
        loop
            exitwhen i > 3
            set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroIconFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(textureFrame)
            call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameSize(textureFrame, 0.016, 0.016)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardIconFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
            call ShowFrame(textureFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "PlayerNameFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_LEFT, GetFrameByName("HeroIconFrame", i), FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(simpletxtFrame, "Player" + I2S(i))
            call ShowFrame(simpletxtFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "HeroLevelFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOP, GetFrameByName("BoardLevelFrame", 0), FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(simpletxtFrame, "0")
            call ShowFrame(simpletxtFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "PlayerScoreFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOP, GetFrameByName("BoardScoreFrame", 0), FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(simpletxtFrame, "0 / 0 / 0")
            call ShowFrame(simpletxtFrame, true)

            set j = 0
            loop
                set k = (i * 10) + j
                if j == 0 then
                    set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroItemFrame", simpleFrame, "", k)
                    call ClearFrameAllPoints(textureFrame)
                    call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
                    call SetFrameSize(textureFrame, 0.016, 0.016)
                    call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardItemFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
                    call ShowFrame(textureFrame, true)
                else
                    set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroItemFrame", simpleFrame, "", k)
                    call ClearFrameAllPoints(textureFrame)
                    call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
                    call SetFrameSize(textureFrame, 0.016, 0.016)
                    call SetFrameRelativePoint(textureFrame, FRAMEPOINT_LEFT, GetFrameByName("HeroItemFrame", k - 1), FRAMEPOINT_RIGHT, 0.001, 0)
                    call ShowFrame(textureFrame, true)
                endif
                set j = j + 1
                exitwhen j > 5
            endloop

            set i = i + 1
        endloop

        set i = 5
        loop
            exitwhen i > 7
            set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroIconFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(textureFrame)
            call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameSize(textureFrame, 0.016, 0.016)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardIconFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
            call ShowFrame(textureFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "PlayerNameFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_LEFT, GetFrameByName("HeroIconFrame", i), FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(simpletxtFrame, "Player" + I2S(i))
            call ShowFrame(simpletxtFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "HeroLevelFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOP, GetFrameByName("BoardLevelFrame", 0), FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(simpletxtFrame, "0")
            call ShowFrame(simpletxtFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "PlayerScoreFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOP, GetFrameByName("BoardScoreFrame", 0), FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(simpletxtFrame, "0 / 0 / 0")
            call ShowFrame(simpletxtFrame, true)

            set j = 0
            loop
                set k = (i * 10) + j
                if j == 0 then
                    set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroItemFrame", simpleFrame, "", k)
                    call ClearFrameAllPoints(textureFrame)
                    call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
                    call SetFrameSize(textureFrame, 0.016, 0.016)
                    call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardItemFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
                    call ShowFrame(textureFrame, true)
                else
                    set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroItemFrame", simpleFrame, "", k)
                    call ClearFrameAllPoints(textureFrame)
                    call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
                    call SetFrameSize(textureFrame, 0.016, 0.016)
                    call SetFrameRelativePoint(textureFrame, FRAMEPOINT_LEFT, GetFrameByName("HeroItemFrame", k - 1), FRAMEPOINT_RIGHT, 0.001, 0)
                    call ShowFrame(textureFrame, true)
                endif
                set j = j + 1
                exitwhen j > 5
            endloop

            set i = i + 1
        endloop

        set i = 9
        loop
            exitwhen i > 11
            set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroIconFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(textureFrame)
            call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
            call SetFrameSize(textureFrame, 0.016, 0.016)
            call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardIconFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
            call ShowFrame(textureFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "PlayerNameFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_LEFT, GetFrameByName("HeroIconFrame", i), FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(simpletxtFrame, "Player" + I2S(i))
            call ShowFrame(simpletxtFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "HeroLevelFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOP, GetFrameByName("BoardLevelFrame", 0), FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(simpletxtFrame, "0")
            call ShowFrame(simpletxtFrame, true)
            set simpletxtFrame = CreateFrameByType("SIMPLETEXT", "PlayerScoreFrame", simpleFrame, "", i)
            call ClearFrameAllPoints(simpletxtFrame)
            call SetFrameTextAlignment(simpletxtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
            call SetFrameFont(simpletxtFrame, "Fonts\\FRIZQT__.TTF", 0.01, 0)
            call SetFrameRelativePoint(simpletxtFrame, FRAMEPOINT_TOP, GetFrameByName("BoardScoreFrame", 0), FRAMEPOINT_BOTTOM, 0, 0.01 - 0.02 * i)
            call SetFrameText(simpletxtFrame, "0 / 0 / 0")
            call ShowFrame(simpletxtFrame, true)

            set j = 0
            loop
                set k = (i * 10) + j
                if j == 0 then
                    set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroItemFrame", simpleFrame, "", k)
                    call ClearFrameAllPoints(textureFrame)
                    call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
                    call SetFrameSize(textureFrame, 0.016, 0.016)
                    call SetFrameRelativePoint(textureFrame, FRAMEPOINT_TOPLEFT, GetFrameByName("BoardItemFrame", 0), FRAMEPOINT_BOTTOMLEFT, 0, 0.01 - 0.02 * i)
                    call ShowFrame(textureFrame, true)
                else
                    set textureFrame = CreateFrameByType("SIMPLETEXTURE", "HeroItemFrame", simpleFrame, "", k)
                    call ClearFrameAllPoints(textureFrame)
                    call SetFrameTexture(textureFrame, "war3mapImported\\selectview.blp", 0, false)
                    call SetFrameSize(textureFrame, 0.016, 0.016)
                    call SetFrameRelativePoint(textureFrame, FRAMEPOINT_LEFT, GetFrameByName("HeroItemFrame", k - 1), FRAMEPOINT_RIGHT, 0.001, 0)
                    call ShowFrame(textureFrame, true)
                endif
                set j = j + 1
                exitwhen j > 5
            endloop

            set i = i + 1
        endloop

        set gameuiFrame = null
        set simpleFrame = null
        set simpletxtFrame = null
        set textureFrame = null
        set trig = null
    endfunction

    globals
        integer shopItemIndex = 0
        integer array shopharga
        integer array shopItemInt
        string array shopTipText
        string array shopItemName
        private integer shopWidth = 0
        private integer shopHeight = 0
        private integer shopPage = 1
        real array shopItemPosX
        real array shopItemPosY
        framehandle shopItemSprite = null
        string array shopSearchTxt
    endglobals

    function ShopItemButton takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle trigFrame = GetTriggerFrame()
        local framehandle tipFrame = GetFrameByName("ShopItemTipFrame", 0)
        local integer pid = GetPlayerId(p)
        local integer i
        local integer j
        local integer frameId = LoadInteger(ht, StringHash("ShopItemIndex"), GetHandleId(trigFrame))

        if GetTriggerFrameMouseButton() == MOUSE_BUTTON_TYPE_RIGHT then
            if GetLocalPlayer() == p then
                call SetFrameEnabled(trigFrame, false)
                call SetFrameEnabled(trigFrame, true)
            endif

            set i = 0
            set j = 0
            loop
                exitwhen i > 5
                if UnitItemInSlot(MainHero[pid], i) != null then
                    set j = j + 1
                endif
                set i = i + 1
            endloop

            if GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) >= shopharga[frameId] and j < 6 and IsUnitAlive(MainHero[pid]) and not IsUnitPaused(MainHero[pid]) then
                call AdjustPlayerStateBJ(- shopharga[frameId], p, PLAYER_STATE_RESOURCE_GOLD)
                call UnitAddItemByIdSwapped(shopItemInt[frameId], MainHero[pid])
            endif
        else
            if GetLocalPlayer() == p then
                call SetFrameEnabled(trigFrame, false)
                call SetFrameEnabled(trigFrame, true)
                call ClearFrameAllPoints(shopItemSprite)
                call SetFrameRelativePoint(shopItemSprite, FRAMEPOINT_BOTTOMLEFT, trigFrame, FRAMEPOINT_BOTTOMLEFT, - 0.0046, - 0.0045)
                call SetFrameSpriteScale(shopItemSprite, 0.6)
                if not IsFrameVisible(shopItemSprite) then
                    call ShowFrame(shopItemSprite, true)
                endif
                if GetFrameText(tipFrame) != shopTipText[frameId] then
                    call SetFrameText(tipFrame, shopTipText[frameId])
                endif
            endif
        endif

        set p = null
        set trigFrame = null
        set tipFrame = null
    endfunction

    private function shopItem takes integer itemId returns nothing
        local framehandle mainFrame
        local framehandle itemFrame
        local framehandle iconFrame
        local framehandle txtFrame
        local trigger trig

        set mainFrame = GetFrameByName("ShopMainFrame", 0)
        set itemFrame = CreateFrameByType("BUTTON", "ShopItemFrame", mainFrame, "", shopItemIndex)
        call SetFrameSize(itemFrame, 0.03, 0.03)
        if shopPage == 1 then
            set shopItemPosX[shopItemIndex] = 0.01 + shopWidth * 0.033
            set shopItemPosY[shopItemIndex] = - 0.01 - shopHeight * 0.05
            call SetFrameRelativePoint(itemFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[shopItemIndex], shopItemPosY[shopItemIndex])
        else
            set shopItemPosX[shopItemIndex] = 0
            set shopItemPosY[shopItemIndex] = 0
            call ShowFrame(itemFrame, false)
        endif
        set trig = CreateTrigger()
        call SaveInteger(ht, StringHash("ShopItemIndex"), GetHandleId(itemFrame), shopItemIndex)
        call TriggerRegisterFrameEvent(trig, itemFrame, FRAMEEVENT_CONTROL_CLICK)
        call RegisterFrameMouseButton(itemFrame, MOUSE_BUTTON_TYPE_RIGHT, true)
        call TriggerAddAction(trig, function ShopItemButton)

        set iconFrame = CreateFrameByType("BACKDROP", "ShopItemIconFrame", itemFrame, "", shopItemIndex)
        call SetFrameTexture(iconFrame, GetBaseItemStringFieldById(itemId, ITEM_SF_ICON), 0, false)
        call SetFrameAllPoints(iconFrame, itemFrame)
        set txtFrame = CreateFrameByType("TEXT", "ShopItemPriceFrame", iconFrame, "", shopItemIndex)
        call SetFrameTextAlignment(txtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_CENTER)
        call SetFrameFont(txtFrame, "Fonts\\FRIZQT__.TTF", 0.012, 0)
        call SetFrameRelativePoint(txtFrame, FRAMEPOINT_CENTER, iconFrame, FRAMEPOINT_BOTTOM, 0, - 0.005)
        call SetFrameText(txtFrame, "|cffFFD600" + I2S(GetBaseItemIntegerFieldById(itemId, ITEM_IF_GOLD_COST)))
        call SetFrameEnabled(txtFrame, false)

        set shopWidth = shopWidth + 1
        if shopWidth == 7 then
            set shopWidth = 0
            set shopHeight = shopHeight + 1
            if shopHeight == 5 then
                set shopHeight = 0
                set shopPage = shopPage + 1
            endif
        endif

        set shopItemInt[shopItemIndex] = itemId
        set shopharga[shopItemIndex] = GetBaseItemIntegerFieldById(itemId, ITEM_IF_GOLD_COST)
        set shopItemName[shopItemIndex] = GetBaseItemStringFieldById(itemId, ITEM_SF_NAME)
        set shopTipText[shopItemIndex] = shopItemName[shopItemIndex] + "\n\n" + GetBaseItemStringFieldById(itemId, ITEM_SF_TOOLTIP_EXTENDED)
        set shopItemIndex = shopItemIndex + 1

        set mainFrame = null
        set itemFrame = null
        set iconFrame = null
        set txtFrame = null
        set trig = null
    endfunction

    function shopItemWheel takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle trigFrame = GetTriggerFrame()
        local framehandle scrollbar = GetFrameByName("ShopScrollBarFrame", 0)
        local real frameValue = GetTriggerFrameReal()

        if frameValue > 0 then
            if GetLocalPlayer() == p then
                call SetFrameValue(scrollbar, GetFrameValue(scrollbar) + 1)
            endif
        else
            if GetLocalPlayer() == p then
                call SetFrameValue(scrollbar, GetFrameValue(scrollbar) - 1)
            endif
        endif

        set p = null
        set trigFrame = null
        set scrollbar = null
    endfunction

    private function ShopSearchFunc1 takes player p, string txt returns nothing
        local framehandle mainFrame = GetFrameByName("ShopMainFrame", 0)
        local framehandle scrollbar = GetFrameByName("ShopScrollBarFrame", 0)
        local framehandle itemFrame
        local real frameValue = GetFrameValue(scrollbar)
        local integer i
        local integer j
        local integer k

        if txt != "" and txt != null then
            set i = 0
            set j = 0
            loop
                exitwhen i == shopItemIndex or j >= 34
                set itemFrame = GetFrameByName("ShopItemFrame", i)
                if StringContains(shopItemName[i], txt, false) then
                    if GetLocalPlayer() == p and not IsFrameVisible(itemFrame) then
                        call ShowFrame(itemFrame, true)
                    endif
                    set j = j + 1
                else
                    if GetLocalPlayer() == p and IsFrameVisible(itemFrame) then
                        call ShowFrame(itemFrame, false)
                    endif
                endif
                set i = i + 1
            endloop
            set i = 0
            set k = 0
            loop
                exitwhen i == shopItemIndex or k >= j
                set itemFrame = GetFrameByName("ShopItemFrame", i)
                if GetLocalPlayer() == p and IsFrameVisible(itemFrame) then
                    call SetFrameRelativePoint(itemFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[k], shopItemPosY[k])
                    set k = k + 1
                endif
                set i = i + 1
            endloop
        else
            set i = 0
            loop
                exitwhen i == shopItemIndex
                set itemFrame = GetFrameByName("ShopItemFrame", i)
                if GetLocalPlayer() == p and IsFrameVisible(itemFrame) then
                    call ShowFrame(itemFrame, false)
                endif
                set i = i + 1
            endloop
            if frameValue == 0 then
                set i = 0
                loop
                    exitwhen i == shopItemIndex
                    if i >= 7 and i <= 41 then
                        set itemFrame = GetFrameByName("ShopItemFrame", i)
                        if GetLocalPlayer() == p and not IsFrameVisible(itemFrame) then
                            call ShowFrame(itemFrame, true)
                        endif
                        if GetLocalPlayer() == p then
                            call SetFrameRelativePoint(itemFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[i - 7], shopItemPosY[i - 7])
                        endif
                    endif
                    set i = i + 1
                endloop
            elseif frameValue == 1 then
                set i = 0
                loop
                    exitwhen i == shopItemIndex
                    if i >= 0 and i <= 34 then
                        set itemFrame = GetFrameByName("ShopItemFrame", i)
                        if GetLocalPlayer() == p and not IsFrameVisible(itemFrame) then
                            call ShowFrame(itemFrame, true)
                        endif
                        if GetLocalPlayer() == p then
                            call SetFrameRelativePoint(itemFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[i], shopItemPosY[i])
                        endif
                    endif
                    set i = i + 1
                endloop
            endif
        endif

        set mainFrame = null
        set scrollbar = null
        set itemFrame = null
    endfunction

    function ShopItemSlider takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle trigFrame = GetTriggerFrame()
        local framehandle tipFrame
        local framehandle itemFrame
        local framehandle mainFrame = GetFrameByName("ShopMainFrame", 0)
        local real frameValue = GetTriggerFrameReal()
        local integer pid = GetPlayerId(p)
        local integer i

        set tipFrame = GetFrameByName("ShopItemTipFrame", 0)
        if GetLocalPlayer() == p then
            if IsFrameVisible(shopItemSprite) then
                call ShowFrame(shopItemSprite, false)
            endif
            if GetFrameText(tipFrame) != "" then
                call SetFrameText(tipFrame, "")
            endif
        endif

        set i = 0
        loop
            exitwhen i == shopItemIndex
            set itemFrame = GetFrameByName("ShopItemFrame", i)
            if GetLocalPlayer() == p and IsFrameVisible(itemFrame) then
                call ShowFrame(itemFrame, false)
            endif
            set i = i + 1
        endloop

        if frameValue == 0 then
            set i = 0
            loop
                exitwhen i == shopItemIndex
                if i >= 7 and i <= 41 then
                    set itemFrame = GetFrameByName("ShopItemFrame", i)
                    if GetLocalPlayer() == p and not IsFrameVisible(itemFrame) then
                        call ShowFrame(itemFrame, true)
                    endif
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(itemFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[i - 7], shopItemPosY[i - 7])
                    endif
                endif
                set i = i + 1
            endloop
        elseif frameValue == 1 then
            set i = 0
            loop
                exitwhen i == shopItemIndex
                if i >= 0 and i <= 34 then
                    set itemFrame = GetFrameByName("ShopItemFrame", i)
                    if GetLocalPlayer() == p and not IsFrameVisible(itemFrame) then
                        call ShowFrame(itemFrame, true)
                    endif
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(itemFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[i], shopItemPosY[i])
                    endif
                endif
                set i = i + 1
            endloop
        endif

        if shopSearchTxt[pid] != "" and shopSearchTxt[pid] != null then
            call ShopSearchFunc1(p, shopSearchTxt[pid])
        endif

        set p = null
        set trigFrame = null
        set tipFrame = null
        set itemFrame = null
        set mainFrame = null
    endfunction

    function ShopItemSearch takes nothing returns nothing
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2 = GetFrameByName("ShopItemTipFrame", 0)
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)
        local string txt = GetTriggerFrameString()

        if GetLocalPlayer() == p then
            if IsFrameVisible(shopItemSprite) then
                call ShowFrame(shopItemSprite, false)
            endif
            if GetFrameText(pFrame2) != "" then
                call SetFrameText(pFrame2, "")
            endif
        endif

        set shopSearchTxt[pid] = txt
        call ShopSearchFunc1(p, txt)

        set pFrame = null
        set pFrame2 = null
        set p = null
    endfunction

    function shopUICreate takes nothing returns nothing
        local framehandle gameuiFrame = GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
        local framehandle mainFrame
        local framehandle shopTag
        local framehandle scrollarea
        local framehandle scrollFrame
        local framehandle searchFrame
        local framehandle tipFrame
        local framehandle txtFrame
        local trigger trig

        set mainFrame = CreateFrameByType("BACKDROP", "ShopMainFrame", gameuiFrame, "", 0)
        call ClearFrameAllPoints(mainFrame)
        call SetFrameBackdropTexture(mainFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL, false)
        call SetFrameCornerSize(mainFrame, 0, 0.0125)
        call SetFrameBackgroundInsets(mainFrame, 0, 0.005, 0.005, 0.005, 0.005)
        call SetFrameSize(mainFrame, 0.253, 0.3)
        call SetFrameAbsolutePoint(mainFrame, FRAMEPOINT_CENTER, 0.32, 0.32)
        call ShowFrame(mainFrame, false)

        set shopTag = CreateFrameByType("BACKDROP", "ShopTagFrame", mainFrame, "", 0)
        call SetFrameSize(shopTag, 0.16, 0.04)
        call SetFrameTexture(shopTag, "war3mapImported\\shoptag.blp", 0, false)
        call SetFrameRelativePoint(shopTag, FRAMEPOINT_BOTTOM, mainFrame, FRAMEPOINT_TOP, 0, - 0.005)

        set scrollarea = CreateFrameByType("BUTTON", "ShopScrollFrame", mainFrame, "", 0)
        call SetFrameAllPoints(scrollarea, mainFrame)
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, scrollarea, FRAMEEVENT_MOUSE_WHEEL)
        call TriggerAddAction(trig, function shopItemWheel)
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, scrollarea, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(trig, function ButtonFocus)

        set scrollFrame = CreateFrameByType("SCROLLBAR", "ShopScrollBarFrame", mainFrame, "QuestMainListScrollBar", 0)
        call ClearFrameAllPoints(scrollFrame)
        call SetFrameMinMaxValues(scrollFrame, 0, 1)
        call SetFrameValue(scrollFrame, 1)
        call SetFrameStepSize(scrollFrame, 1)
        call SetFrameSize(scrollFrame, 0.012, 0.25)
        call SetFrameRelativePoint(scrollFrame, FRAMEPOINT_CENTER, mainFrame, FRAMEPOINT_RIGHT, - 0.005, 0)
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, scrollFrame, FRAMEEVENT_SLIDER_VALUE_CHANGED)
        call TriggerAddAction(trig, function ShopItemSlider)

        set searchFrame = CreateFrame("ShopSearchFrame", mainFrame, 0, 0)
        call SetFrameSize(searchFrame, 0.13, 0.03)
        call SetFrameRelativePoint(searchFrame, FRAMEPOINT_BOTTOMLEFT, mainFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameText(searchFrame, "")
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, searchFrame, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(trig, function ButtonFocus)
        set trig = CreateTrigger()
        call TriggerRegisterFrameEvent(trig, searchFrame, FRAMEEVENT_EDITBOX_TEXT_CHANGED)
        call TriggerAddAction(trig, function ShopItemSearch)

        set tipFrame = CreateFrameByType("BACKDROP", "ShopTipFrame", mainFrame, "", 0)
        call SetFrameBackdropTexture(tipFrame, 0, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", true, true, "UI\\Widgets\\EscMenu\\Human\\editbox-border.blp", CORNER_FLAG_ALL, false)
        call SetFrameCornerSize(tipFrame, 0, 0.0125)
        call SetFrameBackgroundInsets(tipFrame, 0, 0.005, 0.005, 0.005, 0.005)
        call SetFrameSize(tipFrame, 0.2, 0.2)
        call SetFrameRelativePoint(tipFrame, FRAMEPOINT_TOPLEFT, mainFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        set txtFrame = CreateFrameByType("TEXT", "ShopItemTipFrame", tipFrame, "", 0)
        call SetFrameTextAlignment(txtFrame, TEXT_JUSTIFY_MIDDLE, TEXT_JUSTIFY_LEFT)
        call SetFrameFont(txtFrame, "Fonts\\FRIZQT__.TTF", 0.012, 0)
        call SetFrameWidth(txtFrame, 0.17)
        call SetFrameRelativePoint(txtFrame, FRAMEPOINT_TOPLEFT, tipFrame, FRAMEPOINT_TOPLEFT, 0.01, - 0.01)
        call SetFrameText(txtFrame, "")
        call SetFrameEnabled(txtFrame, false)

        set shopItemSprite = CreateFrameByType("SPRITE", "", mainFrame, "", 0)
        call SetFrameSize(shopItemSprite, 0.00001, 0.00001)
        call SetFrameModel(shopItemSprite, "war3mapImported\\neon_sprite.mdx", 0)

        call shopItem('I03G')
        call shopItem('I012')
        call shopItem('I027')
        call shopItem('I00X')
        call shopItem('I04R')
        call shopItem('I03I')
        call shopItem('I02E')
        call shopItem('I008')
        call shopItem('I02F')
        call shopItem('I004')

        call shopItem('I000')
        call shopItem('I001')
        call shopItem('I02R')
        call shopItem('I035')
        call shopItem('I030')
        call shopItem('I020')
        call shopItem('I015')
        call shopItem('I016')
        call shopItem('I017')
        call shopItem('I018')

        call shopItem('I01V')
        call shopItem('I01W')
        call shopItem('I01X')
        call shopItem('I021')
        call shopItem('I024')
        call shopItem('I03S')
        call shopItem('I019')
        call shopItem('I01D')
        call shopItem('I02V')
        call shopItem('I013')

        call shopItem('I007')
        call shopItem('I00M')
        call shopItem('I005')
        call shopItem('I032')
        call shopItem('I01S')
        call shopItem('I00E')
        call shopItem('I057')
        call shopItem('I01H')
        call shopItem('I039')
        call shopItem('I01U')

        call shopItem('I01C')
        
        set gameuiFrame = null
        set mainFrame = null
        set shopTag = null
        set scrollarea = null
        set scrollFrame = null
        set tipFrame = null
        set txtFrame = null
        set trig = null
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
                set frame1 = GetFrameByName("HeroLevelFrame", i) 
                set str = I2S(GetHeroLevel(u))
                if GetFrameText(frame1) != str then
                    call SetFrameText(frame1, str)
                endif

                set frame1 = GetFrameByName("PlayerScoreFrame", i)
                set str = I2S(scoreKill[i]) + " / " + I2S(scoreDeath[i]) + " / " + I2S(scoreAssist[i])
                if GetFrameText(frame1) != str then
                    call SetFrameText(frame1, str)
                endif
        
                set j = 0
                loop 
                    set it = UnitItemInSlot(u, j)
                    set k = (i * 10) + j
                    if it != null then
                        set frame1 = GetFrameByName("HeroItemFrame", k)
                        set str = GetItemStringField(it, ITEM_SF_ICON)
                        if LoadStr(ht, StringHash("itemUI"), k) != str then
                            call SetFrameTexture(frame1, str, 0, false)
                            call SaveStr(ht, StringHash("itemUI"), k, str)
                        endif
                    else
                        set frame1 = GetFrameByName("HeroItemFrame", k)
                        set str = "ReplaceableTextures\\CommandButtons\\BTNCancel.blp"
                        if LoadStr(ht, StringHash("itemUI"), k) != str then
                            call SetFrameTexture(frame1, str, 0, false)
                            call SaveStr(ht, StringHash("itemUI"), k, str)
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