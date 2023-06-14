library initFrame uses InteractionUI
    function AncestorFrame takes nothing returns nothing
        local framehandle pFrame
        local string s = ""
        
        call LoadTOCFile("war3mapImported\\RveUIScore.toc")
        call EditBlackBorders(0, 0)
        call SetFrameRelativePoint(ConsoleUI, FRAMEPOINT_TOPLEFT, GameUI, FRAMEPOINT_TOPLEFT, 10.0, 0)
        call SetFrameRelativePoint(ConsoleUI, FRAMEPOINT_TOPRIGHT, GameUI, FRAMEPOINT_TOPRIGHT, - 10.0, 0)
        call SetFrameRelativePoint(HPBarUI, FRAMEPOINT_TOPLEFT, GameUI, FRAMEPOINT_TOPLEFT, 0.0, 1.0 )
        call SetFrameRelativePoint(ResourceUI, FRAMEPOINT_TOPRIGHT, GameUI, FRAMEPOINT_TOPRIGHT, 10.0, 0.0 )
        call SetFrameAbsolutePoint(QuestUI, FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(MenuUI, FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(AllyUI, FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(ChatButtonUI, FRAMEPOINT_LEFT, 0.0, 1.0)
        call ShowFrame(todUI, false)
        call ClearFrameAllPoints(UnitMsgUI)
        call ClearFrameAllPoints(ChatMsgUI)
        call ClearFrameAllPoints(CEditBarUI)
        set pFrame = CreateFrame("HeroSelectorBackground", WorldUI, 0, 0)
        set s = "war3mapImported\\pickimage.tga"
        call SetFrameTexture(pFrame, s, 0, true)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, GameUI, FRAMEPOINT_BOTTOMLEFT, 0.001, 0.001)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, GameUI, FRAMEPOINT_TOPRIGHT, - 0.001, - 0.001)
        
        set pFrame = null
    endfunction

    function voiceButtonCreate takes nothing returns nothing
        local trigger t
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        set pFrame = CreateFrame("VoiceBordir", GameUI, 0, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, CEditBarUI, FRAMEPOINT_TOPLEFT, 0, 0.001)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, CEditBarUI, FRAMEPOINT_TOPRIGHT, - 0.001, 0.05)
        call ShowFrame(pFrame, false)
        
        set pFrame2 = CreateFrame("VoiceButton", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.008, - 0.01)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_TOPLEFT, 0.036, - 0.038)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame2), 0)
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame3 = CreateFrame("VoiceButton", pFrame, 0, 1)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame3), 1)
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame2 = CreateFrame("VoiceButton", pFrame, 0, 2)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame2), 2)
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame3 = CreateFrame("VoiceButton", pFrame, 0, 3)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame3), 3)
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame2 = CreateFrame("VoiceButton", pFrame, 0, 4)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame2), 4)
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame3 = CreateFrame("VoiceButton", pFrame, 0, 5)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame3), 5)
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame2 = CreateFrame("VoiceButton", pFrame, 0, 6)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame2), 6)
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame3 = CreateFrame("VoiceButton", pFrame, 0, 7)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame3), 7)
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame2 = CreateFrame("VoiceButton", pFrame, 0, 8)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame2), 8)
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame3 = CreateFrame("VoiceButton", pFrame, 0, 9)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame3), 9)
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame2 = CreateFrame("VoiceButton", pFrame, 0, 10)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame2), 10)
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set pFrame3 = CreateFrame("VoiceButton", pFrame, 0, 11)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.029, 0)
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("voice"), GetHandleId(pFrame3), 11)
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function VoiceButtonActive)
        
        set VoiceText[0] = "APA DAH GUA MULU"
        set VoiceText[1] = "HUAAAAAAAAAH!!!"
        set VoiceText[2] = "EZ PZ"
        set VoiceText[3] = "Surat Kabar Lama, Baterai Lama"
        set VoiceText[4] = "Minggir lu, Minggir lu"
        set VoiceText[5] = "Yaudah Pasrah"
        set VoiceText[6] = "YA AMPUN"
        set VoiceText[7] = "ahahaha, dia yang kena"
        set VoiceText[8] = "AAAAHHHH"
        set VoiceText[9] = "Sabar ya ges, nanti dapat kaki kobo"
        set VoiceText[10] = "BUSETTT, ga begini juga"
        set VoiceText[11] = "DEJAVUU!!!"
        
        set t = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
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
    endglobals

    private function shopItem takes integer itemId returns nothing
        local trigger t
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        local framehandle pFrame4

        set pFrame = GetFrameByName("ShopBordir", 0)
        set pFrame2 = CreateFrame("ShopItem", pFrame, 0, shopItemIndex)
        call SetFrameSize(pFrame2, 0.03, 0.03)
        if shopPage == 1 then
            set shopItemPosX[shopItemIndex] = 0.01 + shopWidth * 0.033
            set shopItemPosY[shopItemIndex] = - 0.01 - shopHeight * 0.05
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[shopItemIndex], shopItemPosY[shopItemIndex])
        else
            set shopItemPosX[shopItemIndex] = 0
            set shopItemPosY[shopItemIndex] = 0
            call ShowFrame(pFrame2, false)
        endif
        set t = CreateTrigger()
        call SaveInteger(ht, StringHash("shopItemIndeks"), GetHandleId(pFrame2), shopItemIndex)
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function ShopItemButton)

        set pFrame3 = GetFrameByName("ShopItemIcon", shopItemIndex)
        call SetFrameTexture(pFrame3, GetBaseItemStringFieldById(itemId, ITEM_SF_ICON), 0, true)
        set pFrame3 = CreateFrame("ShopItemPrice", pFrame2, 0, shopItemIndex)
        call SetFrameSize(pFrame3, 0.05, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_CENTER, pFrame2, FRAMEPOINT_BOTTOM, 0, - 0.005)
        call SetFrameText(pFrame3, "|cffFFD600" + I2S(GetBaseItemIntegerFieldById(itemId, ITEM_IF_GOLD_COST)))
        call SetFrameEnabled(pFrame3, false)

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
        set t = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
        set pFrame4 = null
    endfunction

    function shopUICreate takes nothing returns nothing
        local trigger t
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        local framehandle pFrame4
        local framehandle pFrame5

        set pFrame = CreateFrame("ShopBordir", GameUI, 0, 0)
        call SetFrameSize(pFrame, 0.252, 0.3)
        call SetFrameAbsolutePoint(pFrame, FRAMEPOINT_CENTER, 0.32, 0.32)
        call ShowFrame(pFrame, false)
        set pFrame2 = CreateFrame("ShopBordirTag", pFrame, 0, 0)
        call SetFrameSize(pFrame2, 0.16, 0.04)
        call SetFrameTexture(pFrame2, "war3mapImported\\shoptag.blp", 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_CENTER, pFrame, FRAMEPOINT_TOP, 0, 0.004)

        set pFrame2 = CreateFrame("ShopWheel", pFrame, 0, 0)
        call SetFrameAllPoints(pFrame2, pFrame)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_MOUSE_WHEEL)
        call TriggerAddAction(t, function shopItemWheel)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function shopItemFocus)

        set pFrame3 = CreateFrame("ShopSkrol", pFrame, 0, 0)
        call SetFrameSize(pFrame3, 0.012, 0.25)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_CENTER, pFrame, FRAMEPOINT_RIGHT, - 0.005, 0)
        call SetFrameStepSize(pFrame3, 1)
        call SetFrameMinMaxValues(pFrame3, 1, 2)
        call SetFrameValue(pFrame3, 2)
        call SetFrameEnabled(pFrame3, false)

        set pFrame3 = CreateFrame("ShopSearch", pFrame, 0, 0)
        call SetFrameSize(pFrame3, 0.13, 0.03)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameText(pFrame3, "")
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function shopItemFocus)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame3, FRAMEEVENT_EDITBOX_TEXT_CHANGED)
        call TriggerAddAction(t, function shopItemSearch)

        set pFrame2 = CreateFrame("ShopBordir", pFrame, 0, 1)
        call SetFrameSize(pFrame2, 0.2, 0.2)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        set pFrame3 = CreateFrame("ShopItemTip", pFrame, 0, 0)
        call SetFrameSize(pFrame3, 0.17, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPLEFT, 0.01, - 0.01)
        call SetFrameText(pFrame3, "")

        set pFrame3 = CreateFrame("ShopBordir", pFrame, 0, 2)
        call SetFrameSize(pFrame3, 0.07, 0.03)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, - 0.005, 0.005)
        set pFrame4 = CreateFrame("ShopBuyText", pFrame, 0, 0)
        call SetFrameSize(pFrame4, 0.03, 0)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_CENTER, pFrame3, FRAMEPOINT_CENTER, 0, 0.001)
        call SetFrameText(pFrame4, "|cffFFD600" + "BUY")
        set pFrame4 = CreateFrame("ShopBuy", pFrame, 0, 0)
        call SetFrameAllPoints(pFrame4, pFrame3)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame4, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function ShopBuyButton)

        set shopItemSprite = CreateFrameByType("SPRITE", "", pFrame, "", 0)
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

        set t = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
        set pFrame4 = null
        set pFrame5 = null
    endfunction

    globals
        framehandle pXPBar = null
        framehandle pHPBar = null
        framehandle pMPBar = null
    endglobals

    function createDefaultUI takes nothing returns nothing
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        local framehandle pFrame4
        local framehandle pFrame5
        local string s = ""
        local integer i = 0
        local trigger t

        call SetFrameRelativePoint(ResourceUI, FRAMEPOINT_TOPRIGHT, GameUI, FRAMEPOINT_TOPRIGHT, 0.0875, 0.0 )
        call SetFrameAbsolutePoint(QuestUI, FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(MenuUI, FRAMEPOINT_LEFT, 0.63, 0.57)
        call SetFrameAbsolutePoint(AllyUI, FRAMEPOINT_LEFT, 0.0, 1.0)
        call SetFrameAbsolutePoint(ChatButtonUI, FRAMEPOINT_LEFT, 0.715, 0.57)

        loop
            exitwhen i > 11
            set pFrame = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON_COOLDOWN_INDICATOR, i)
            call SetFrameScale(pFrame, 0.9)
            set i = i + 1
        endloop
        
        set pFrame = CreateFrame("MinimapBordir", GameUI, 0, 0)
        call SetFrameSize(pFrame, 0.11, 0.13)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, GameUI, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.002)

        set pFrame2 = CreateSimpleFrame("MapBackground", pFrame, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.001, 0.001)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.001, - 0.001)
        
        call SetFrameRelativePoint(MiniMapUI, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(MiniMapUI, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)

        call ClearFrameAllPoints(ChatMsgUI)
        call SetFrameRelativePoint(ChatMsgUI, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.005, 0.03)
        call SetFrameRelativePoint(ChatMsgUI, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPLEFT, 0.32, 0.2)
        call ClearFrameAllPoints(UnitMsgUI)
        call SetFrameRelativePoint(UnitMsgUI, FRAMEPOINT_BOTTOMLEFT, ChatMsgUI, FRAMEPOINT_CENTER, - 0.05, 0)
        
        set pFrame2 = CreateFrame("StatInfoBordir", GameUI, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.06, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.19, 0)
        
        set pFrame3 = CreateFrame("StatPortrait", pFrame2, 0, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPLEFT, 0.054, - 0.004)

        call ClearFrameAllPoints(PortraitUI)
        call SetFrameAllPoints(PortraitUI, pFrame3)
        
        set pFrame = GetFrameByName("StatInfoBordir", 0)
        set pFrame2 = CreateSimpleFrame("InfoBackground", pFrame, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.001, 0.001)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.001, - 0.001)

        call ClearFrameAllPoints(CEditBarUI)
        call SetFrameRelativePoint(CEditBarUI, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, 0.001)
        call SetFrameRelativePoint(CEditBarUI, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.24, 0.025)
        
        set pFrame = GetFrameByName("StatPortrait", 0)
        set pFrame2 = CreateFrame("StatInfoAcc", pFrame, 1, 0)
        set s = "ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, - 0.001)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.016, - 0.016)
        set pFrame3 = CreateFrame("StatText", pFrame, 1, 0)
        call SetFrameText(pFrame3, "")
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set pFrame = GetFrameByName("StatInfoAcc", 0)
        set pFrame2 = CreateFrame("StatInfoAcc", pFrame, 0, 1)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.01)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.025)
        set pFrame3 = CreateFrame("StatText", pFrame, 0, 1)
        call SetFrameText(pFrame3, "")
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set pFrame = GetFrameByName("StatInfoAcc", 1)
        set pFrame2 = CreateFrame("StatInfoAcc", pFrame, 0, 2)
        set s = "ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.01)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.025)
        set pFrame3 = CreateFrame("StatText", pFrame, 0, 2)
        call SetFrameText(pFrame3, "")
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set pFrame = GetFrameByName("StatInfoAcc", 2)
        set pFrame2 = CreateFrame("StatInfoAcc", pFrame, 0, 3)
        set s = "ReplaceableTextures\\CommandButtons\\BTNBootsOfSpeed.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.01)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.025)
        set pFrame3 = CreateFrame("StatText", pFrame, 0, 3)
        call SetFrameText(pFrame3, "")
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set pFrame = GetFrameByName("StatInfoAcc", 0)
        set pFrame2 = CreateFrame("StatInfoAcc", pFrame, 0, 4)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSteelMelee.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.015, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.03, 0)
        set pFrame3 = CreateFrame("StatText", pFrame, 0, 4)
        call SetFrameText(pFrame3, "")
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set pFrame = GetFrameByName("StatInfoAcc", 1)
        set pFrame2 = CreateFrame("StatInfoAcc", pFrame, 0, 5)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSteelArmor.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.015, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.03, 0)
        set pFrame3 = CreateFrame("StatText", pFrame, 0, 5)
        call SetFrameText(pFrame3, "")
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set pFrame = GetFrameByName("StatInfoAcc", 2)
        set pFrame2 = CreateFrame("StatInfoAcc", pFrame, 0, 6)
        set s = "ReplaceableTextures\\CommandButtons\\BTNGlove.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.015, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.03, 0)
        set pFrame3 = CreateFrame("StatText", pFrame, 0, 6)
        call SetFrameText(pFrame3, "")
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
        
        set pFrame = GetFrameByName("StatInfoBordir", 0)
        set pFrame2 = CreateFrame("StatInfoBordir", GameUI, 0, 1)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, - 0.047)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.2546, - 0.027)
        
        set pXPBar = CreateSimpleFrame("CustomXPBar", pFrame2, 0)
        call ClearFrameAllPoints(pXPBar)
        call SetFrameRelativePoint(pXPBar, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pXPBar, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        set s = "ReplaceableTextures\\TeamColor\\TeamColor03.blp"
        call SetFrameTexture(pXPBar, s, 0, true)
        call SetFrameMinMaxValues(pXPBar, 0, 1)
        call SetFrameValue(pXPBar, 0)
        
        set pFrame = CreateFrame("HeroNameText", pXPBar, 1, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_CENTER, pXPBar, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame, "")
        
        call ClearFrameAllPoints(CommandBarUI)
        call ClearFrameAllPoints(CommandButtonUI[0])
        call SetFrameAbsolutePoint(CommandButtonUI[0], FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(CommandButtonUI[3])
        call SetFrameAbsolutePoint(CommandButtonUI[3], FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(CommandButtonUI[6])
        call SetFrameAbsolutePoint(CommandButtonUI[6], FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(CommandButtonUI[9])
        call SetFrameAbsolutePoint(CommandButtonUI[9], FRAMEPOINT_CENTER, 10.0, 10.0)
        call ClearFrameAllPoints(CommandButtonUI[1])
        call SetFrameAbsolutePoint(CommandButtonUI[1], FRAMEPOINT_CENTER, 10.0, 10.0)
        
        set pFrame = CreateFrame("SpellBordir", GameUI, 0, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0, - 0.04145)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.03618, - 0.005)
        set pFrame2 = CreateSimpleFrame("CmdBackground1", pFrame, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString1", 0)
        set s = "|cffFFD600" + "Q"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(CommandButtonUI[2])
        call SetFrameRelativePoint(CommandButtonUI[2], FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(CommandButtonUI[2], FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame3 = CreateFrame("SpellBordir", GameUI, 0, 1)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.03628, 0)
        set pFrame2 = CreateSimpleFrame("CmdBackground2", pFrame3, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString2", 0)
        set s = "|cffFFD600" + "W"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(CommandButtonUI[5])
        call SetFrameRelativePoint(CommandButtonUI[5], FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(CommandButtonUI[5], FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = CreateFrame("SpellBordir", GameUI, 0, 2)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.03628, 0)
        set pFrame2 = CreateSimpleFrame("CmdBackground3", pFrame, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString3", 0)
        set s = "|cffFFD600" + "E"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(CommandButtonUI[8])
        call SetFrameRelativePoint(CommandButtonUI[8], FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(CommandButtonUI[8], FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame3 = CreateFrame("SpellBordir", GameUI, 0, 3)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.03628, 0)
        set pFrame2 = CreateSimpleFrame("CmdBackground4", pFrame3, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString4", 0)
        set s = "|cffFFD600" + "R"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(CommandButtonUI[11])
        call SetFrameRelativePoint(CommandButtonUI[11], FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(CommandButtonUI[11], FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = CreateFrame("SpellBordir", GameUI, 0, 4)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.03628, 0)
        set pFrame2 = CreateSimpleFrame("CmdBackground5", pFrame, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString5", 0)
        set s = "|cffFFD600" + "T"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(CommandButtonUI[10])
        call SetFrameRelativePoint(CommandButtonUI[10], FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(CommandButtonUI[10], FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame3 = CreateFrame("SpellBordir", GameUI, 0, 5)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.03628, 0)
        set pFrame2 = CreateSimpleFrame("CmdBackground6", pFrame3, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString6", 0)
        set s = "|cffFFD600" + "F"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(CommandButtonUI[7])
        call SetFrameRelativePoint(CommandButtonUI[7], FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(CommandButtonUI[7], FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = CreateFrame("SpellBordir", GameUI, 0, 6)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.03628, 0)
        set pFrame2 = CreateSimpleFrame("CmdBackground7", pFrame, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString7", 0)
        set s = "|cffFFD600" + "D"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(CommandButtonUI[4])
        call SetFrameRelativePoint(CommandButtonUI[4], FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(CommandButtonUI[4], FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = GetFrameByName("SpellBordir", 0)
        set pFrame2 = CreateFrame("StatInfoBordir", GameUI, 0, 2)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.0191)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.2536, - 0.001)
        
        set pHPBar = CreateSimpleFrame("CustomHPBar", pFrame2, 0)
        call ClearFrameAllPoints(pHPBar)
        call SetFrameRelativePoint(pHPBar, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(pHPBar, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        set s = "ReplaceableTextures\\TeamColor\\TeamColor06.blp"
        call SetFrameTexture(pHPBar, s, 0, true)
        call SetFrameValue(pHPBar, 0)
        
        set pFrame = CreateFrame("SustainText", pHPBar, 0, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_CENTER, pHPBar, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame, "")
        
        set pFrame = CreateFrame("StatInfoBordir", GameUI, 0, 3)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0, - 0.0191)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.2536, - 0.001)
        
        set pMPBar = CreateSimpleFrame("CustomMPBar", pFrame, 0)
        call ClearFrameAllPoints(pMPBar)
        call SetFrameRelativePoint(pMPBar, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.005, 0.005)
        call SetFrameRelativePoint(pMPBar, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.005, - 0.005)
        set s = "ReplaceableTextures\\TeamColor\\TeamColor02.blp"
        call SetFrameTexture(pMPBar, s, 0, true)
        call SetFrameValue(pMPBar, 0)
        
        set pFrame = CreateFrame("SustainText", pMPBar, 0, 1)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_CENTER, pMPBar, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame, "")
        
        set pFrame = GetFrameByName("SpellBordir", 6)
        set pFrame2 = CreateFrame("SpellBordir", GameUI, 0, 8)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0.033)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.0355, 0.03255)
        set pFrame3 = CreateSimpleFrame("CmdBackground8", pFrame2, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString8", 0)
        set s = "|cffFFD600" + "1"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(ItemButtonUI[0])
        call SetFrameRelativePoint(ItemButtonUI[0], FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(ItemButtonUI[0], FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = CreateFrame("SpellBordir", GameUI, 0, 9)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.0355, 0)
        set pFrame3 = CreateSimpleFrame("CmdBackground9", pFrame, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString9", 0)
        set s = "|cffFFD600" + "2"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(ItemButtonUI[1])
        call SetFrameRelativePoint(ItemButtonUI[1], FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(ItemButtonUI[1], FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = GetFrameByName("SpellBordir", 8)
        set pFrame2 = CreateFrame("SpellBordir", GameUI, 0, 10)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.0361)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.001)
        set pFrame3 = CreateSimpleFrame("CmdBackground10", pFrame2, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString10", 0)
        set s = "|cffFFD600" + "3"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(ItemButtonUI[2])
        call SetFrameRelativePoint(ItemButtonUI[2], FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(ItemButtonUI[2], FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = CreateFrame("SpellBordir", GameUI, 0, 11)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.0355, 0)
        set pFrame3 = CreateSimpleFrame("CmdBackground11", pFrame, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString11", 0)
        set s = "|cffFFD600" + "4"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(ItemButtonUI[3])
        call SetFrameRelativePoint(ItemButtonUI[3], FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(ItemButtonUI[3], FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = GetFrameByName("SpellBordir", 10)
        set pFrame2 = CreateFrame("SpellBordir", GameUI, 0, 12)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.0361)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.001)
        set pFrame3 = CreateSimpleFrame("CmdBackground12", pFrame2, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString12", 0)
        set s = "|cffFFD600" + "5"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(ItemButtonUI[4])
        call SetFrameRelativePoint(ItemButtonUI[4], FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(ItemButtonUI[4], FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set pFrame = CreateFrame("SpellBordir", GameUI, 0, 13)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.0355, 0)
        set pFrame3 = CreateSimpleFrame("CmdBackground13", pFrame, 0)
        set pFrame4 = GetFrameByName("CmdBackgroundString13", 0)
        set s = "|cffFFD600" + "6"
        call SetFrameText(pFrame4, s)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        call ClearFrameAllPoints(ItemButtonUI[5])
        call SetFrameRelativePoint(ItemButtonUI[5], FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(ItemButtonUI[5], FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        
        set CUberTipUI = GetOriginFrame(ORIGIN_FRAME_UBERTOOLTIP, 0)
        call ClearFrameAllPoints(CUberTipUI)
        call SetFrameRelativePoint(CUberTipUI, FRAMEPOINT_BOTTOMRIGHT, GameUI, FRAMEPOINT_BOTTOMRIGHT, - 0.001, 0.12)
        
        set pFrame = CreateFrame("StatInfoBordir", GameUI, 0, 4)
        call SetFrameSize(pFrame, 0.3, 0.017)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_CENTER, GameUI, FRAMEPOINT_CENTER, 0, 0.215)
        call ShowFrame(pFrame, false)
        
        set pFrame2 = CreateSimpleFrame("CustomHPBar2", pFrame, 0)
        call ClearFrameAllPoints(pFrame2)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        set s = "war3mapImported\\TeamColor00b.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameValue(pFrame2, 0)
        
        set pFrame2 = CreateSimpleFrame("CustomHPBar2", pFrame, 1)
        call ClearFrameAllPoints(pFrame2)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.004, 0.004)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.004, - 0.004)
        set s = "war3mapImported\\TeamColor00c.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameValue(pFrame2, 0)
        
        set pFrame2 = CreateFrame("HeroIconBar", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, - 0.019, 0.005)
        
        set pFrame2 = CreateFrame("HeroNameText2", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.005, 0.006)
        call SetFrameText(pFrame2, "")
        
        set pFrame2 = CreateFrame("SustainPercentText", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.005, 0.006)
        call SetFrameText(pFrame2, "")
        
        set pFrame3 = CreateFrame("SustainText2", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_CENTER, pFrame, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame3, "")
        
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
        set pFrame4 = null
        set pFrame5 = null
        set t = null
    endfunction

    function createDefaultUI2 takes nothing returns nothing
        local trigger t
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        local framehandle pFrame4
        local integer i
        local integer i2
        local integer i3
        local real array r
        local string s = ""
        
        set pFrame = GetFrameByName("StatInfoBordir", 0)
        set i = 0
        loop
            exitwhen i > 7
            set pFrame2 = GetOriginFrame(ORIGIN_FRAME_BUFF_BAR_INDICATOR, i)
            call ClearFrameAllPoints(pFrame2)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.021 + i * 0.021, 0)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001 + i * 0.021, - 0.02)
            set i = i + 1
        endloop
        
        set pFrame = CreateFrame("HeroBack6ground", GameUI, 0, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOP, GameUI, FRAMEPOINT_TOP, - 0.06, 0.0)
        set pFrame2 = GetFrameByName("TextTour", 0)
        call SetFrameText(pFrame2, "")
        call SetFramePriority(pFrame2, 1)
    
        set pFrame = CreateFrame("HeroBack5ground", GameUI, 0, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOP, GameUI, FRAMEPOINT_TOP, - 0.35, 0.0)
        set pFrame2 = GetFrameByName("TextPoint", 0)
        set s = "|cffDAA520" + "0"
        call SetFrameText(pFrame2, s)
        call SetFramePriority(pFrame2, 1)
    
        set i = 1
        loop
            exitwhen i > 3
            set pFrame3 = CreateFrame("HeroBack4ground", pFrame, 0, i)
            set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
            call SetFrameTexture(pFrame3, s, 0, true)
            call SetFrameSize(pFrame3, 0.022, 0.022)
            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_CENTER, pFrame, FRAMEPOINT_CENTER, - 0.04825 + 0.024 * i, 0.0005)
            set i = i + 1
        endloop
    
        set pFrame = CreateFrame("HeroBack5ground", GameUI, 0, 1)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOP, GameUI, FRAMEPOINT_TOP, - 0.26, 0.0)
        set pFrame2 = GetFrameByName("TextPoint", 1)
        set s = "|cffDAA520" + "0"
        call SetFrameText(pFrame2, s)
        call SetFramePriority(pFrame2, 1)
    
        set i = 5
        loop
            exitwhen i > 7
            set pFrame3 = CreateFrame("HeroBack4ground", pFrame, 0, i)
            set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
            call SetFrameTexture(pFrame3, s, 0, true)
            call SetFrameSize(pFrame3, 0.022, 0.022)
            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_CENTER, pFrame, FRAMEPOINT_CENTER, - 0.04825 + 0.024 * (i - 4), 0.0005)
            set i = i + 1
        endloop
    
        set pFrame = CreateFrame("HeroBack5ground", GameUI, 0, 2)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOP, GameUI, FRAMEPOINT_TOP, - 0.17, 0.0)
        set pFrame2 = GetFrameByName("TextPoint", 2)
        set s = "|cffDAA520" + "0"
        call SetFrameText(pFrame2, s)
        call SetFramePriority(pFrame2, 1)
    
        set i = 9
        loop
            exitwhen i > 11
            set pFrame3 = CreateFrame("HeroBack4ground", pFrame, 0, i)
            set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
            call SetFrameTexture(pFrame3, s, 0, true)
            call SetFrameSize(pFrame3, 0.022, 0.022)
            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_CENTER, pFrame, FRAMEPOINT_CENTER, - 0.04825 + 0.024 * (i - 8), 0.0005)
            set i = i + 1
        endloop
        
        set pFrame = CreateFrame("HeroBack2ground", GameUI, 0, 0)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_CENTER, GameUI, FRAMEPOINT_CENTER, 0, 0.05)
        
        call ShowFrame(pFrame, false)
        
        set pFrame2 = GetFrameByName("BaseTextIcon", 0)
        call SetFrameText(pFrame2, "|cffDAA520" + "ICON")
        call SetFramePriority(pFrame2, 1)
        set pFrame2 = GetFrameByName("BaseTextLevel", 0)
        call SetFrameText(pFrame2, "|cffDAA520" + "LEVEL")
        call SetFramePriority(pFrame2, 1)
        set pFrame2 = GetFrameByName("BaseTextScore", 0)
        call SetFrameText(pFrame2, "|cffDAA520" + "K / D / A")
        call SetFramePriority(pFrame2, 1)
        set pFrame2 = GetFrameByName("BaseTextGPM", 0)
        call SetFrameText(pFrame2, "|cffDAA520" + "GOLD")
        call SetFramePriority(pFrame2, 1)
        set pFrame2 = GetFrameByName("BaseTextItem", 0)
        call SetFrameText(pFrame2, "|cffDAA520" + "ITEM")
        call SetFramePriority(pFrame2, 1)
        
        set r[1] = - 0.02
        set r[2] = - 0.04
        set r[3] = - 0.06
        set i = 1
        loop
            exitwhen i > 3
            set pFrame = GetFrameByName("BaseTextIcon", 0)
            set pFrame2 = CreateFrame("HeroBack3ground", pFrame, 0, i) 
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            call SetFrameSize(pFrame2, 0.018, 0.018)
            
            set pFrame3 = GetFrameByName("TextPlayerName", i)
            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(pFrame3, "")
            
            set pFrame = GetFrameByName("BaseTextLevel", 0)
            set pFrame2 = GetFrameByName("TextPlayerLevel", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0"
            call SetFrameText(pFrame2, s)
            
            set pFrame = GetFrameByName("BaseTextScore", 0)
            set pFrame2 = GetFrameByName("TextPlayerKDA", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0 / 0 / 0"
            call SetFrameText(pFrame2, s)
            
            set pFrame = GetFrameByName("BaseTextGPM", 0)
            set pFrame2 = GetFrameByName("TextPlayerGold", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0"
            call SetFrameText(pFrame2, s)
            
            set i2 = 0
            loop
                set i3 = (i * 10) + i2
                if i2 == 0 then
                    set pFrame = GetFrameByName("BaseTextItem", 0)
                    set pFrame2 = CreateFrame("ItemSlotBackground", pFrame, 0, i3)
                    call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.001, r[i])
                    call SetFrameSize(pFrame2, 0.017, 0.017)
                else
                    set pFrame = GetFrameByName("ItemSlotBackground", i3 - 1)
                    set pFrame2 = CreateFrame("ItemSlotBackground", pFrame, 0, i3)
                    call SetFrameRelativePoint(pFrame2, FRAMEPOINT_LEFT, pFrame, FRAMEPOINT_RIGHT, 0.001, 0.0)
                    call SetFrameSize(pFrame2, 0.017, 0.017)
                endif
                set i2 = i2 + 1
                exitwhen i2 > 5
            endloop
            
            set i = i + 1
        endloop
        
        set r[5] = - 0.1
        set r[6] = - 0.12
        set r[7] = - 0.14
        set i = 5
        loop
            exitwhen i > 7
            set pFrame = GetFrameByName("BaseTextIcon", 0)
            set pFrame2 = CreateFrame("HeroBack3ground", pFrame, 0, i) 
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            call SetFrameSize(pFrame2, 0.018, 0.018)
            
            set pFrame3 = GetFrameByName("TextPlayerName", i)
            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(pFrame3, "")
            
            set pFrame = GetFrameByName("BaseTextLevel", 0)
            set pFrame2 = GetFrameByName("TextPlayerLevel", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0"
            call SetFrameText(pFrame2, s)
            
            set pFrame = GetFrameByName("BaseTextScore", 0)
            set pFrame2 = GetFrameByName("TextPlayerKDA", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0 / 0 / 0"
            call SetFrameText(pFrame2, s)
            
            set pFrame = GetFrameByName("BaseTextGPM", 0)
            set pFrame2 = GetFrameByName("TextPlayerGold", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0"
            call SetFrameText(pFrame2, s)
            
            set i2 = 0
            loop
                set i3 = (i * 10) + i2
                if i2 == 0 then
                    set pFrame = GetFrameByName("BaseTextItem", 0)
                    set pFrame2 = CreateFrame("ItemSlotBackground", pFrame, 0, i3)
                    call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.001, r[i])
                    call SetFrameSize(pFrame2, 0.017, 0.017)
                else
                    set pFrame = GetFrameByName("ItemSlotBackground", i3 - 1)
                    set pFrame2 = CreateFrame("ItemSlotBackground", pFrame, 0, i3)
                    call SetFrameRelativePoint(pFrame2, FRAMEPOINT_LEFT, pFrame, FRAMEPOINT_RIGHT, 0.001, 0.0)
                    call SetFrameSize(pFrame2, 0.017, 0.017)
                endif
                set i2 = i2 + 1
                exitwhen i2 > 5
            endloop
            
            set i = i + 1
        endloop
        
        set r[9] = - 0.18
        set r[10] = - 0.2
        set r[11] = - 0.22
        set i = 9
        loop
            exitwhen i > 11
            set pFrame = GetFrameByName("BaseTextIcon", 0)
            set pFrame2 = CreateFrame("HeroBack3ground", pFrame, 0, i) 
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            call SetFrameSize(pFrame2, 0.018, 0.018)
            
            set pFrame3 = GetFrameByName("TextPlayerName", i)
            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_LEFT, pFrame2, FRAMEPOINT_RIGHT, 0.001, 0)
            call SetFrameText(pFrame3, "")
            
            set pFrame = GetFrameByName("BaseTextLevel", 0)
            set pFrame2 = GetFrameByName("TextPlayerLevel", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0"
            call SetFrameText(pFrame2, s)
            
            set pFrame = GetFrameByName("BaseTextScore", 0)
            set pFrame2 = GetFrameByName("TextPlayerKDA", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0 / 0 / 0"
            call SetFrameText(pFrame2, s)
            
            set pFrame = GetFrameByName("BaseTextGPM", 0)
            set pFrame2 = GetFrameByName("TextPlayerGold", i)
            call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0, r[i])
            set s = "|cffDAA520" + "0"
            call SetFrameText(pFrame2, s)
            
            set i2 = 0
            loop
                set i3 = (i * 10) + i2
                if i2 == 0 then
                    set pFrame = GetFrameByName("BaseTextItem", 0)
                    set pFrame2 = CreateFrame("ItemSlotBackground", pFrame, 0, i3)
                    call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.001, r[i])
                    call SetFrameSize(pFrame2, 0.017, 0.017)
                else
                    set pFrame = GetFrameByName("ItemSlotBackground", i3 - 1)
                    set pFrame2 = CreateFrame("ItemSlotBackground", pFrame, 0, i3)
                    call SetFrameRelativePoint(pFrame2, FRAMEPOINT_LEFT, pFrame, FRAMEPOINT_RIGHT, 0.001, 0.0)
                    call SetFrameSize(pFrame2, 0.017, 0.017)
                endif
                set i2 = i2 + 1
                exitwhen i2 > 5
            endloop
            
            set i = i + 1
        endloop
        
        set t = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
        set pFrame4 = null
    endfunction

    function createSelectionUI takes nothing returns nothing
        local trigger t
        local framehandle pFrame
        local framehandle pFrame2
        local framehandle pFrame3
        local framehandle pFrame4
        local framehandle pFrame5
        local framehandle pFrame6
        local string s = ""
        call ClearFrameAllPoints(UnitMsgUI)
        call SetFrameRelativePoint(UnitMsgUI, FRAMEPOINT_BOTTOMLEFT, GameUI, FRAMEPOINT_BOTTOMLEFT, 0.05, 0.07)
        call ClearFrameAllPoints(ChatMsgUI)
        call SetFrameRelativePoint(ChatMsgUI, FRAMEPOINT_BOTTOMLEFT, GameUI, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.04)
        call SetFrameRelativePoint(ChatMsgUI, FRAMEPOINT_TOPRIGHT, GameUI, FRAMEPOINT_BOTTOMLEFT, 0.28, 0.16)
        call ClearFrameAllPoints(CEditBarUI)
        call SetFrameRelativePoint(CEditBarUI, FRAMEPOINT_TOPLEFT, ChatMsgUI, FRAMEPOINT_BOTTOMLEFT, - 0.005, - 0.005)
        call SetFrameRelativePoint(CEditBarUI, FRAMEPOINT_BOTTOMRIGHT, ChatMsgUI, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.031)
        
        set pFrame = CreateFrame("HeroSelectorIconViewBordir", GameUI, 1, 1)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_TOPLEFT, GameUI, FRAMEPOINT_TOPLEFT, 0.005, - 0.005)
        call SetFrameRelativePoint(pFrame, FRAMEPOINT_BOTTOMRIGHT, GameUI, FRAMEPOINT_TOPLEFT, 0.065, - 0.045)
        set pFrame2 = CreateFrame("HeroSelectorIconView", pFrame, 0, 1)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame2 = CreateFrame("HeroSelectorNameTextBordir", pFrame, 0, 1)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame3 = CreateFrame("HeroSelectorNameText", pFrame2, 0, 1)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_CENTER, pFrame2, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame3, "")

        set pFrame2 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 2)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.061, 0)
        set pFrame3 = CreateFrame("HeroSelectorIconView", pFrame2, 0, 2)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame3 = CreateFrame("HeroSelectorNameTextBordir", pFrame2, 0, 2)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame4 = CreateFrame("HeroSelectorNameText", pFrame3, 0, 2)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_CENTER, pFrame3, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame4, "")
        
        set pFrame3 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 3)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.061, 0)
        set pFrame4 = CreateFrame("HeroSelectorIconView", pFrame3, 0, 3)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame4 = CreateFrame("HeroSelectorNameTextBordir", pFrame3, 0, 3)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame5 = CreateFrame("HeroSelectorNameText", pFrame4, 0, 3)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_CENTER, pFrame4, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame5, "")
        
        set pFrame2 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 5)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, GameUI, FRAMEPOINT_TOP, - 0.093, - 0.005)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, GameUI, FRAMEPOINT_TOP, - 0.033, - 0.045)
        set pFrame3 = CreateFrame("HeroSelectorIconView", pFrame2, 0, 5)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame3 = CreateFrame("HeroSelectorNameTextBordir", pFrame2, 0, 5)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame4 = CreateFrame("HeroSelectorNameText", pFrame3, 0, 5)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_CENTER, pFrame3, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame4, "")
        
        set pFrame3 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 6)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.061, 0)
        set pFrame4 = CreateFrame("HeroSelectorIconView", pFrame3, 0, 6)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame4 = CreateFrame("HeroSelectorNameTextBordir", pFrame3, 0, 6)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame5 = CreateFrame("HeroSelectorNameText", pFrame4, 0, 6)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_CENTER, pFrame4, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame5, "")
        
        set pFrame4 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 7)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.061, 0)
        set pFrame5 = CreateFrame("HeroSelectorIconView", pFrame4, 0, 7)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_BOTTOMLEFT, pFrame4, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPRIGHT, pFrame4, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame5 = CreateFrame("HeroSelectorNameTextBordir", pFrame4, 0, 7)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPLEFT, pFrame4, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_BOTTOMRIGHT, pFrame4, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame6 = CreateFrame("HeroSelectorNameText", pFrame5, 0, 7)
        call SetFrameRelativePoint(pFrame6, FRAMEPOINT_CENTER, pFrame5, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame6, "")
        
        set pFrame2 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 9)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, GameUI, FRAMEPOINT_TOPRIGHT, - 0.188, - 0.005)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, GameUI, FRAMEPOINT_TOPRIGHT, - 0.128, - 0.045)
        set pFrame3 = CreateFrame("HeroSelectorIconView", pFrame2, 0, 9)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame3 = CreateFrame("HeroSelectorNameTextBordir", pFrame2, 0, 9)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame4 = CreateFrame("HeroSelectorNameText", pFrame3, 0, 9)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_CENTER, pFrame3, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame4, "")
        
        set pFrame3 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 10)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.061, 0)
        set pFrame4 = CreateFrame("HeroSelectorIconView", pFrame3, 0, 10)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPRIGHT, pFrame3, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame4 = CreateFrame("HeroSelectorNameTextBordir", pFrame3, 0, 10)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame5 = CreateFrame("HeroSelectorNameText", pFrame4, 0, 10)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_CENTER, pFrame4, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame5, "")
        
        set pFrame4 = CreateFrame("HeroSelectorIconViewBordir", pFrame, 0, 11)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame3, FRAMEPOINT_BOTTOMRIGHT, 0.061, 0)
        set pFrame5 = CreateFrame("HeroSelectorIconView", pFrame4, 0, 11)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_BOTTOMLEFT, pFrame4, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPRIGHT, pFrame4, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.005)
        set pFrame5 = CreateFrame("HeroSelectorNameTextBordir", pFrame4, 0, 11)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPLEFT, pFrame4, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_BOTTOMRIGHT, pFrame4, FRAMEPOINT_BOTTOMRIGHT, 0, - 0.028)
        set pFrame6 = CreateFrame("HeroSelectorNameText", pFrame5, 0, 11)
        call SetFrameRelativePoint(pFrame6, FRAMEPOINT_CENTER, pFrame5, FRAMEPOINT_CENTER, 0, 0)
        call SetFrameText(pFrame6, "")
        
        set pFrame = GetFrameByName("HeroSelectorNameTextBordir", 1)
        set pFrame2 = CreateFrame("HeroSelectorTimeBordir", GameUI, 1, 0)
        set pFrame3 = CreateFrame("HeroSelectorTimeText", pFrame2, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.08, - 0.031)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.01)
        call SetFrameText(pFrame3, "")
        
        set pFrame = GetFrameByName("HeroSelectorTimeBordir", 0)
        set pFrame2 = CreateFrame("HeroSelectorStatIcon", WorldUI, 1, 0)
        set s = "ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.044, - 0.123)
        
        set pFrame = GetFrameByName("HeroSelectorStatIcon", 0)
        set pFrame2 = CreateFrame("HeroSelectorStatIcon", WorldUI, 1, 1)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.002)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.044, - 0.124)
        
        set pFrame = GetFrameByName("HeroSelectorStatIcon", 1)
        set pFrame2 = CreateFrame("HeroSelectorStatIcon", WorldUI, 1, 2)
        set s = "ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.002)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.044, - 0.124)
        
        set pFrame = GetFrameByName("HeroSelectorStatIcon", 0)
        set pFrame2 = CreateFrame("HeroSelectorBordir", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.547, 0.005)
        
        set pFrame = GetFrameByName("HeroSelectorStatIcon", 1)
        set pFrame2 = CreateFrame("HeroSelectorBordir", pFrame, 0, 1)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.547, 0.005)
        
        set pFrame = GetFrameByName("HeroSelectorStatIcon", 2)
        set pFrame2 = CreateFrame("HeroSelectorBordir", pFrame, 0, 2)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.547, 0.005)
        
        set pFrame = GetFrameByName("HeroSelectorBordir", 0)
        set pFrame2 = GetFrameByName("HeroSelectorBordir", 1)
        set pFrame3 = CreateFrame("HeroSelectorTipBordir", GameUI, 1, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, 0.201, 0)
        
        set pFrame = GetFrameByName("HeroSelectorTipBordir", 0)
        set pFrame2 = CreateFrame("HeroSelectorTipText", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.01, - 0.005)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, - 0.01, - 0.025)
        set s = "|cffFFD600" + "Heroes Name"
        call SetFrameText(pFrame2, s)
        
        set pFrame = GetFrameByName("HeroSelectorTipBordir", 0)
        set pFrame2 = GetFrameByName("HeroSelectorTipText", 0)
        set pFrame3 = CreateFrame("HeroSelectorTipIcon", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0, - 0.001)
        call SetFrameRelativePoint(pFrame3, FRAMEPOINT_BOTTOMRIGHT, pFrame2, FRAMEPOINT_BOTTOMLEFT, 0.05, - 0.071)
        
        set pFrame = GetFrameByName("HeroSelectorTipIcon", 0)
        set pFrame2 = CreateFrame("HeroSelectorTipText2", pFrame, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.002, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.051, - 0.02)
        set s = "|cffDAA520" + "Difficulty"
        call SetFrameText(pFrame2, s)
        
        set pFrame = GetFrameByName("HeroSelectorTipText2", 0)
        set pFrame2 = CreateFrame("HeroSelectorTipStar", pFrame, 0, 0)
        set s = "difficulty\\star1.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.03, - 0.03)
        
        set pFrame = GetFrameByName("HeroSelectorTipStar", 0)
        set pFrame2 = CreateFrame("HeroSelectorTipStar", pFrame, 0, 1)
        set s = "difficulty\\star2.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.031, 0)
        
        set pFrame = GetFrameByName("HeroSelectorTipStar", 1)
        set pFrame2 = CreateFrame("HeroSelectorTipStar", pFrame, 0, 2)
        set s = "difficulty\\star3.blp"
        call SetFrameTexture(pFrame2, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.031, 0)
        
        set pFrame = GetFrameByName("HeroSelectorTipIcon", 0)
        set pFrame2 = CreateFrame("HeroSelectorButtonSpell", pFrame, 0, 0)
        set pFrame3 = GetFrameByName("HeroSelectorButtonSpellIcon", 0)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0, - 0.005)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.035, - 0.045)
        set pFrame4 = CreateFrame("HeroSelectorButtonSpellTip", pFrame, 0, 0)
        set pFrame5 = CreateFrame("HeroSelectorButtonSpellText", pFrame4, 0, 0)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame5, FRAMEPOINT_TOPLEFT, - 0.01, 0.01)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame5, FRAMEPOINT_BOTTOMRIGHT, 0.01, - 0.01)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, - 0.008, - 0.01)
        call SetFrameSize(pFrame5, 0.2, 0)
        call SetFrameTooltip(pFrame2, pFrame4)
        call SetFrameEnabled(pFrame5, false)
        call SetFrameText(pFrame5, "")
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function EndFocusButton)
        
        set pFrame = GetFrameByName("HeroSelectorButtonSpell", 0)
        set pFrame2 = CreateFrame("HeroSelectorButtonSpell", pFrame, 0, 1)
        set pFrame3 = GetFrameByName("HeroSelectorButtonSpellIcon", 1)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.036, 0)
        set pFrame4 = CreateFrame("HeroSelectorButtonSpellTip", pFrame, 0, 1)
        set pFrame5 = CreateFrame("HeroSelectorButtonSpellText", pFrame4, 0, 1)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame5, FRAMEPOINT_TOPLEFT, - 0.01, 0.01)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame5, FRAMEPOINT_BOTTOMRIGHT, 0.01, - 0.01)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, - 0.008, - 0.01)
        call SetFrameSize(pFrame5, 0.2, 0)
        call SetFrameTooltip(pFrame2, pFrame4)
        call SetFrameEnabled(pFrame5, false)
        call SetFrameText(pFrame5, "")
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function EndFocusButton)
        
        set pFrame = GetFrameByName("HeroSelectorButtonSpell", 1)
        set pFrame2 = CreateFrame("HeroSelectorButtonSpell", pFrame, 0, 2)
        set pFrame3 = GetFrameByName("HeroSelectorButtonSpellIcon", 2)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.036, 0)
        set pFrame4 = CreateFrame("HeroSelectorButtonSpellTip", pFrame, 0, 2)
        set pFrame5 = CreateFrame("HeroSelectorButtonSpellText", pFrame4, 0, 2)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame5, FRAMEPOINT_TOPLEFT, - 0.01, 0.01)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame5, FRAMEPOINT_BOTTOMRIGHT, 0.01, - 0.01)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, - 0.008, - 0.01)
        call SetFrameSize(pFrame5, 0.2, 0)
        call SetFrameTooltip(pFrame2, pFrame4)
        call SetFrameEnabled(pFrame5, false)
        call SetFrameText(pFrame5, "")
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function EndFocusButton)
        
        set pFrame = GetFrameByName("HeroSelectorButtonSpell", 2)
        set pFrame2 = CreateFrame("HeroSelectorButtonSpell", pFrame, 0, 3)
        set pFrame3 = GetFrameByName("HeroSelectorButtonSpellIcon", 3)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.036, 0)
        set pFrame4 = CreateFrame("HeroSelectorButtonSpellTip", pFrame, 0, 3)
        set pFrame5 = CreateFrame("HeroSelectorButtonSpellText", pFrame4, 0, 3)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame5, FRAMEPOINT_TOPLEFT, - 0.01, 0.01)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame5, FRAMEPOINT_BOTTOMRIGHT, 0.01, - 0.01)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, - 0.008, - 0.01)
        call SetFrameSize(pFrame5, 0.2, 0)
        call SetFrameTooltip(pFrame2, pFrame4)
        call SetFrameEnabled(pFrame5, false)
        call SetFrameText(pFrame5, "")
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function EndFocusButton)
        
        set pFrame = GetFrameByName("HeroSelectorButtonSpell", 3)
        set pFrame2 = CreateFrame("HeroSelectorButtonSpell", pFrame, 0, 4)
        set pFrame3 = GetFrameByName("HeroSelectorButtonSpellIcon", 4)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPRIGHT, 0.001, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.036, 0)
        set pFrame4 = CreateFrame("HeroSelectorButtonSpellTip", pFrame, 0, 4)
        set pFrame5 = CreateFrame("HeroSelectorButtonSpellText", pFrame4, 0, 4)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame5, FRAMEPOINT_TOPLEFT, - 0.01, 0.01)
        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_BOTTOMRIGHT, pFrame5, FRAMEPOINT_BOTTOMRIGHT, 0.01, - 0.01)
        call SetFrameRelativePoint(pFrame5, FRAMEPOINT_TOPRIGHT, pFrame2, FRAMEPOINT_BOTTOMRIGHT, - 0.008, - 0.01)
        call SetFrameSize(pFrame5, 0.2, 0)
        call SetFrameTooltip(pFrame2, pFrame4)
        call SetFrameEnabled(pFrame5, false)
        call SetFrameText(pFrame5, "")
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function EndFocusButton)
        
        set pFrame = GetFrameByName("HeroSelectorTipBordir", 0)
        set pFrame2 = CreateFrame("HeroSelectorButtonOK", pFrame, 0, 0)
        set pFrame3 = GetFrameByName("HeroSelectorButtonOKIcon", 0)
        set s = "ReplaceableTextures\\CommandButtons\\BTNY.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.01, 0.005)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_BOTTOMLEFT, 0.06, 0.055)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function HeroConfirmButton)
        
        set pFrame = GetFrameByName("HeroSelectorButtonOK", 0)
        set pFrame2 = CreateFrame("HeroSelectorButtonBAN", pFrame, 0, 0)
        set pFrame3 = GetFrameByName("HeroSelectorButtonBANIcon", 0)
        set s = "ReplaceableTextures\\CommandButtons\\BTNCancel.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.0135, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.0635, 0)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function HeroBanButton)
        
        set pFrame = GetFrameByName("HeroSelectorButtonBAN", 0)
        set pFrame2 = CreateFrame("HeroSelectorButtonRANDOM", pFrame, 0, 0)
        set pFrame3 = GetFrameByName("HeroSelectorButtonRANDOMIcon", 0)
        set s = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp"
        call SetFrameTexture(pFrame3, s, 0, true)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMRIGHT, 0.0135, 0)
        call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPRIGHT, pFrame, FRAMEPOINT_TOPRIGHT, 0.0635, 0)
        set t = CreateTrigger()
        call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
        call TriggerAddAction(t, function HeroRandomButton)
        
        set t = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
        set pFrame4 = null
        set pFrame5 = null
        set pFrame6 = null
    endfunction

    function heroDataFrame takes nothing returns nothing
        local trigger t 
        local framehandle pFrame 
        local framehandle pFrame2 
        local framehandle pFrame3 
        local string s = ""
        local integer heroIndex = 1
        local integer strIndex = 1
        local integer agiIndex = 1
        local integer intIndex = 1
        local integer strWidth = 0
        local integer strHeight = 0
        local integer agiWidth = 0
        local integer agiHeight = 0
        local integer intWidth = 0
        local integer intHeight = 0
        local integer maxWidth = 14
        local integer maxHeight = 2

        loop
            exitwhen heroIndex > MaxHero
            if GetUnitBaseIntegerFieldById(HeroType[heroIndex], UNIT_IF_PRIMARY_ATTRIBUTE) == 1 then
                set pFrame = GetFrameByName("HeroSelectorBordir", 0)
                set pFrame2 = CreateFrame("HeroSelectorButton", pFrame, 0, strIndex)
                set pFrame3 = GetFrameByName("HeroSelectorButtonIcon", strIndex)
                call SetFrameTexture(pFrame3, HeroPhoto[heroIndex], 0, true)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.005 + strWidth * 0.036, - 0.005 - strHeight * 0.036)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_TOPLEFT, 0.035 + strWidth * 0.036, - 0.035 - strHeight * 0.036)
                set t = CreateTrigger()
                call SaveInteger(ht, StringHash("iconFrame"), GetHandleId(pFrame2), heroIndex)
                call SaveInteger(ht, StringHash("iconFrame"), heroIndex, strIndex)
                call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
                call TriggerAddAction(t, function HeroIconButton)
                set strWidth = strWidth + 1
                if strWidth > maxWidth then
                    set strWidth = 0
                    if strHeight < maxHeight then
                        set strHeight = strHeight + 1
                    endif
                endif
                set strIndex = strIndex + 1
            elseif GetUnitBaseIntegerFieldById(HeroType[heroIndex], UNIT_IF_PRIMARY_ATTRIBUTE) == 3 then
                set pFrame = GetFrameByName("HeroSelectorBordir", 1)
                set pFrame2 = CreateFrame("HeroSelectorButton2", pFrame, 0, agiIndex)
                set pFrame3 = GetFrameByName("HeroSelectorButton2Icon", agiIndex)
                call SetFrameTexture(pFrame3, HeroPhoto[heroIndex], 0, true)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.005 + agiWidth * 0.036, - 0.005 - agiHeight * 0.036)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_TOPLEFT, 0.035 + agiWidth * 0.036, - 0.035 - agiHeight * 0.036)
                set t = CreateTrigger()
                call SaveInteger(ht, StringHash("iconFrame"), GetHandleId(pFrame2), heroIndex)
                call SaveInteger(ht, StringHash("iconFrame"), heroIndex, agiIndex)
                call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
                call TriggerAddAction(t, function HeroIconButton)
                set agiWidth = agiWidth + 1
                if agiWidth > maxWidth then
                    set agiWidth = 0
                    if agiHeight < maxHeight then
                        set agiHeight = agiHeight + 1
                    endif
                endif
                set agiIndex = agiIndex + 1
            else
                set pFrame = GetFrameByName("HeroSelectorBordir", 2)
                set pFrame2 = CreateFrame("HeroSelectorButton3", pFrame, 0, intIndex)
                set pFrame3 = GetFrameByName("HeroSelectorButton3Icon", intIndex)
                call SetFrameTexture(pFrame3, HeroPhoto[heroIndex], 0, true)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, 0.005 + intWidth * 0.036, - 0.005 - intHeight * 0.036)
                call SetFrameRelativePoint(pFrame2, FRAMEPOINT_BOTTOMRIGHT, pFrame, FRAMEPOINT_TOPLEFT, 0.035 + intWidth * 0.036, - 0.035 - intHeight * 0.036)
                set t = CreateTrigger()
                call SaveInteger(ht, StringHash("iconFrame"), GetHandleId(pFrame2), heroIndex)
                call SaveInteger(ht, StringHash("iconFrame"), heroIndex, intIndex)
                call TriggerRegisterFrameEvent(t, pFrame2, FRAMEEVENT_CONTROL_CLICK)
                call TriggerAddAction(t, function HeroIconButton)
                set intWidth = intWidth + 1
                if intWidth > maxWidth then
                    set intWidth = 0
                    if intHeight < maxHeight then
                        set intHeight = intHeight + 1
                    endif
                endif
                set intIndex = intIndex + 1
            endif
            set heroIndex = heroIndex + 1
        endloop

        set t = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
    endfunction

    globals
        string array HeroVoice
        string array HeroVoice2
        string array HeroVoice3
        string array HeroPhoto
        string array HeroPhoto2
        string array HeroPhoto3
        real array HeroDiff
        integer array HeroType
        private integer heroId = 1
    endglobals

    private function setHeroData takes integer uid, integer diff, string voice1, string voice2, string voice3, string icon1, string icon2 returns nothing
        local string s = ""
        set HeroType[heroId] = uid
        set HeroDiff[heroId] = diff
        
        if voice1 != "" then
            set s = "war3mapImported\\" + voice1
        endif
        set HeroVoice[heroId] = s
        set s = ""

        if voice2 != "" then
            set s = "war3mapImported\\" + voice2
        endif
        set HeroVoice2[heroId] = s
        set s = ""

        if voice3 != "" then
            set s = "war3mapImported\\" + voice3
        endif
        set HeroVoice3[heroId] = s
        set s = ""

        if icon1 != "" then
            set s = "PhotoPath\\" + icon1
        endif
        set HeroPhoto[heroId] = s
        set s = ""

        if icon1 != "" then
            set s = "PhotoPathDis\\" + icon1
        endif
        set HeroPhoto2[heroId] = s
        set s = ""
        
        if icon2 != "" then
            set s = "Portraited\\" + icon2
        endif
        set HeroPhoto3[heroId] = s
        
        set heroId = heroId + 1
    endfunction

    globals
        integer MaxHero = 0
        private integer preloadCount = 1
        boolean preloadIconFinish = false
    endglobals

    private function preloadIconData takes nothing returns nothing
        local integer i = 0
        local integer akey1 = 0
        local integer akey2 = 4
        local integer abilId
        local string s = ""
        local string s2 = ""
        local string s3 = ""
        local string s4 = ""
        if preloadCount <= MaxHero then
            set s = GetUnitBaseStringFieldById(HeroType[preloadCount], UNIT_SF_HERO_ABILITY_LIST)
            loop
                exitwhen akey2 > StringLength(s)
                set s2 = SubString(s, akey1, akey2)
                set abilId = String2Id(s2)
                set s3 = GetAbilityBaseStringFieldById(abilId, ABILITY_SF_ICON_NORMAL)
                set s4 = "|cffFFD600" + GetAbilityBaseStringFieldById(abilId, ABILITY_SF_NAME) + "|r|n|n" + GetAbilityBaseStringLevelFieldById(abilId, ABILITY_SLF_TOOLTIP_LEARN_EXTENDED, 0)
                call SaveStr(ht, StringHash("SpellIcon_" + I2S(i)), HeroType[preloadCount], s3)
                call SaveStr(ht, StringHash("SpellTip_" + I2S(i)), HeroType[preloadCount], s4)
                set akey1 = akey1 + 5
                set akey2 = akey2 + 5
                set i = i + 1
            endloop
            set preloadCount = preloadCount + 1
        else
            set preloadIconFinish = true 
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        endif
    endfunction

    globals
        real SelectHeroTime = 60
    endglobals

    function setIconData takes nothing returns nothing
        call setHeroData('H046', 2, "aizenpick.mp3", "aizen10k.mp3", "aizen15k.mp3", "Aizen-icon.blp", "Aizen-icon.blp")
        call setHeroData('H00J', 2, "akamepick.mp3", "", "", "Akame-icon.blp", "Akame-icon.blp")
        call setHeroData('H0CX', 3, "", "", "", "Alibaba-icon.blp", "Alibaba-icon.blp")
        call setHeroData('H011', 2, "alicepick.mp3", "alice10k.mp3", "alice15k.mp3", "Alice-icon.blp", "Alice-icon.blp")
        call setHeroData('H00E', 2, "anospick.mp3", "", "", "Anos-icon.blp", "Anos-icon.blp")
        call setHeroData('H0FY', 1, "", "", "", "Aokiji-icon.blp", "Aokiji-icon.blp")
        call setHeroData('H00T', 1, "", "", "", "Arash-icon.blp", "Arash-icon.blp")
        call setHeroData('H00G', 2, "", "", "", "Aya-icon.blp", "Aya-icon.blp")
        call setHeroData('H04M', 3, "kizarupick.mp3", "kizaru10k.mp3", "kizaru15k.mp3", "Kizaru-icon.blp", "Borsalino-icon.blp")
        call setHeroData('H0CA', 1, "byakuranpick.mp3", "byakuran10k.mp3", "byakuran15k.mp3", "Byakuran-icon.blp", "Byakuran-icon.blp")
        
        call setHeroData('H00I', 1, "", "", "", "Chtholly-icon.blp", "Chtholly-icon.blp")
        call setHeroData('H010', 2, "", "", "", "CloudS-icon.blp", "CloudS-icon.blp")
        call setHeroData('H05Z', 2, "cronuspick.mp3", "cronus10k.mp3", "cronus15k.mp3", "Cronus-icon.blp", "Cronus-icon.blp")
        call setHeroData('H003', 2, "diegopick.mp3", "diego10k.mp3", "diego15k.mp3", "Diego-icon.blp", "Diego-icon.blp")
        call setHeroData('H00H', 2, "diopick.mp3", "", "", "Dio-icon.blp", "Dio-icon.blp")
        call setHeroData('H004', 3, "emiyapick.mp3", "emiya10k.mp3", "emiya15k.mp3", "Shirou-icon.blp", "Emiya-icon.blp")
        call setHeroData('H0G2', 3, "", "", "", "Escanor-icon.blp", "Escanor-icon.blp")
        call setHeroData('H02Q', 3, "esdeathpick.mp3", "", "", "Esdeath-icon.blp", "Esdeath-icon.blp")
        call setHeroData('H001', 3, "fuhuapick.mp3", "fuhua10k.mp3", "fuhua15k.mp3", "Fuhua-icon.blp", "Fuhua-icon.blp")
        call setHeroData('H00K', 1, "", "", "", "Fujiren-icon.blp", "Fujiren-icon.blp")
        
        call setHeroData('H00Z', 3, "", "", "", "Moko-icon.blp", "Fujiwara-icon.blp")
        call setHeroData('H0DH', 2, "gajeelpick.mp3", "gajeel10k.mp3", "gajeel15k.mp3", "Gajeel-icon.blp", "Gajeel-icon.blp")
        call setHeroData('H00F', 2, "", "", "", "Gin-icon.blp", "Gin-icon.blp")
        call setHeroData('H0CU', 3, "", "", "", "Gon-icon.blp", "Gon-icon.blp")
        call setHeroData('H04R', 3, "", "", "", "Gray-icon.blp", "Gray-icon.blp")
        call setHeroData('H0EF', 3, "", "", "", "Guts-icon.blp", "Guts-icon.blp")
        call setHeroData('H0EQ', 2, "hibaripick.mp3", "hibari10k.mp3", "hibari15k.mp3", "Hibari-icon.blp", "Hibari-icon.blp")
        call setHeroData('H0G1', 1, "", "", "", "Toshiro-icon.blp", "Toshiro-icon.blp")
        call setHeroData('H0D0', 3, "", "", "", "Jellal-icon.blp", "Jellal-icon.blp")
        call setHeroData('H0CW', 3, "jotaropick.mp3", "jotaro10k.mp3", "jotaro15k.mp3", "Jotaro-icon.blp", "Jotaro-icon.blp")
        call setHeroData('H07C', 1, "tanjiropick.mp3", "tanjiro10k.mp3", "tanjiro15k.mp3", "Tanjiro-icon.blp", "Tanjiro-icon.blp")
        
        call setHeroData('H0FS', 3, "tomapick.mp3", "toma10k.mp3", "toma15k.mp3", "Toma-icon.blp", "Toma-icon.blp")
        call setHeroData('H0A1', 2, "kanzakipick.mp3", "", "", "Kanzaki-icon.blp", "Kanzaki-icon.blp")
        call setHeroData('H002', 2, "", "", "", "Kenshin-icon.blp", "Kenshin-icon.blp")
        call setHeroData('H0CN', 1, "", "", "", "Kenshiro-icon.blp", "Kenshiro-icon.blp")
        call setHeroData('H01Z', 3, "kianapick.mp3", "kiana10k.mp3", "kiana15k.mp3", "Kiana-icon.blp", "Kiana-icon.blp")
        call setHeroData('H0AN', 3, "hassanpick.mp3", "hassan10k.mp3", "hassan15k.mp3", "Hassan-icon.blp", "Hassan-icon.blp")
        call setHeroData('H05G', 1, "kiritopick.mp3", "kirito10k.mp3", "kirito15k.mp3", "Kirito-icon.blp", "Kirito-icon.blp")
        call setHeroData('H0CR', 3, "misogipick.mp3", "misogi10k.mp3", "misogi15k.mp3", "Misogi-icon.blp", "Misogi-icon.blp")
        call setHeroData('H00R', 1, "ikkipick.mp3", "", "", "Ikki-icon.blp", "Ikki-icon.blp")
        call setHeroData('H00V', 1, "ichigopick.mp3", "ichigo10k.mp3", "ichigo15k.mp3", "Ichigo-icon.blp", "Ichigo-icon.blp")
        
        call setHeroData('H0B4', 3, "kuroyukipick.mp3", "kuroyuki10k.mp3", "kuroyuki15k.mp3", "Kuroyukihime-icon.blp", "Kuroyukihime-icon.blp")
        call setHeroData('H0D6', 2, "laxuspick.mp3", "laxus10k.mp3", "laxus15k.mp3", "Laxus-icon.blp", "Laxus-icon.blp")
        call setHeroData('H00C', 2, "", "", "", "Levi-icon.blp", "Levi-icon.blp")
        call setHeroData('H063', 2, "mokitapick.mp3", "mokita10k.mp3", "mokita15k.mp3", "Mokita-icon.blp", "Mokita-icon.blp")
        call setHeroData('H01L', 1, "minatopick.mp3", "minato10k.mp3", "minato15k.mp3", "Minato-icon.blp", "Minato-icon.blp")
        call setHeroData('H00B', 3, "", "", "", "Misaka-icon.blp", "Misaka-icon.blp")
        call setHeroData('H0D5', 3, "", "", "", "Luffy-icon.blp", "Luffy-icon.blp")
        call setHeroData('H0CY', 1, "musashipick.mp3", "musashi10k.mp3", "musashi15k.mp3", "Musashi-icon.blp", "Musashi-icon.blp")
        call setHeroData('H007', 3, "", "", "", "Mystogan-icon.blp", "Mystogan-icon.blp")
        call setHeroData('H005', 3, "", "", "", "Naruto-icon.blp", "Naruto-icon.blp")
        
        call setHeroData('H03A', 1, "natsupick.mp3", "natsu10k.mp3", "natsu15k.mp3", "Natsu-icon.blp", "Natsu-icon.blp")
        call setHeroData('H0FX', 2, "neptunpick.mp3", "neptun10k.mp3", "neptun15k.mp3", "Neptun-icon.blp", "Neptun-icon.blp")
        call setHeroData('H0D1', 3, "", "", "", "Nura-icon.blp", "Nura-icon.blp")
        call setHeroData('H00M', 1, "", "", "", "Ogita-icon.blp", "Ogita-icon.blp")
        call setHeroData('H03E', 1, "", "", "", "Omashu-icon.blp", "Omashu-icon.blp")
        call setHeroData('H009', 3, "", "", "", "Pein-icon.blp", "Pein-icon.blp")
        call setHeroData('H0BM', 2, "", "", "", "Ace-icon.blp", "Ace-icon.blp")
        call setHeroData('H0CV', 2, "", "", "", "Reimu-icon.blp", "Reimu-icon.blp")
        call setHeroData('H09Y', 2, "", "", "", "Zwei-icon.blp", "Zwei-icon.blp")
        call setHeroData('H0D4', 2, "", "", "", "Okumura-icon.blp", "Okumura-icon.blp")
        
        call setHeroData('H0G3', 3, "", "", "", "Rogue-icon.blp", "Rogue-icon.blp")
        call setHeroData('H02L', 3, "zoropick.mp3", "zoro10k.mp3", "zoro15k.mp3", "Zoro-icon.blp", "Zoro-icon.blp")
        call setHeroData('H00P', 2, "", "", "", "Ryuzaki-icon.blp", "Ryuzaki-icon.blp")
        call setHeroData('H0D3', 2, "", "", "", "Sabo-icon.blp", "Sabo-icon.blp")
        call setHeroData('H0CT', 2, "izayoipick.mp3", "", "", "Izayoi-icon.blp", "Izayoi-icon.blp")
        call setHeroData('H00N', 2, "", "", "", "Akainu-icon.blp", "Akainu-icon.blp")
        call setHeroData('H0CZ', 2, "", "", "", "Sasuke-icon.blp", "Sasuke-icon.blp")
        call setHeroData('H02E', 2, "satomipick.mp3", "", "", "Satomi-icon.blp", "Satomi-icon.blp")
        call setHeroData('H042', 3, "tsunapick.mp3", "tsuna10k.mp3", "tsuna15k.mp3", "Sawada-icon.blp", "Sawada-icon.blp")
        call setHeroData('H0G0', 1, "shanapick.mp3", "shana10k.mp3", "shana15k.mp3", "Shana-icon.blp", "Shana-icon.blp")
        
        call setHeroData('H0CQ', 2, "nanayapick.mp3", "nanaya10k.mp3", "nanaya15k.mp3", "Nanaya-icon.blp", "Nanaya-icon.blp")
        call setHeroData('H0FC', 2, "", "", "", "Ryougi-icon.blp", "Ryougi-icon.blp")
        call setHeroData('H0EG', 2, "tohnopick.mp3", "tohno10k.mp3", "tohno15k.mp3", "Tohno-icon.blp", "Tohno-icon.blp")
        call setHeroData('H00W', 3, "", "", "", "Sistina-icon.blp", "Sistina-icon.blp")
        call setHeroData('H03B', 1, "", "", "", "Sting-icon.blp", "Sting-icon.blp")
        call setHeroData('H00X', 1, "", "", "", "Momiji-icon.blp", "Momiji-icon.blp")
        call setHeroData('H029', 3, "", "", "", "Kisara-icon.blp", "Kisara-icon.blp")
        call setHeroData('H00Y', 1, "", "", "", "Kirin-icon.blp", "Kirin-icon.blp")
        call setHeroData('H00U', 3, "", "", "", "Tohka-icon.blp", "Tohka-icon.blp")
        call setHeroData('H02V', 2, "kurumipick.mp3", "", "", "Kurumi-icon.blp", "Kurumi-icon.blp")
        
        call setHeroData('H05R', 3, "vegetapick.mp3", "vegeta10k.mp3", "vegeta15k.mp3", "Vegeta-icon.blp", "Vegeta-icon.blp")
        call setHeroData('H0CP', 3, "", "", "", "Wendy-icon.blp", "Wendy-icon.blp")
        call setHeroData('H0FU', 3, "", "", "", "Yamaji-icon.blp", "Yamaji-icon.blp")
        call setHeroData('H00Q', 2, "", "", "", "Miu-icon.blp", "Miu-icon.blp")
        call setHeroData('H008', 1, "yomipick.mp3", "", "", "Yomi-icon.blp", "Yomi-icon.blp")
        call setHeroData('H0D2', 2, "", "", "", "Yugi-icon.blp", "Yugi-icon.blp")
        call setHeroData('H030', 3, "", "", "", "Zancrow-icon.blp", "Zancrow-icon.blp")

        set MaxHero = heroId - 1
        call TimerStart(CreateTimer(), 0.2, true, function preloadIconData)
    endfunction
endlibrary