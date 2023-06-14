library InteractionUI uses Utilities
    globals
        boolean array isVoiceActive
        boolean array isVoiceOnce
        string array VoiceText
    endglobals
    
    function VoiceButtonReset takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local player p = LoadPlayerHandle(ht, GetHandleId(z), 0)
        local framehandle pFrame
        local string s = "war3mapImported\\BTNvoicebutton.blp"
        local integer pid = GetPlayerId(p)
        local integer fid = LoadInteger(ht, GetHandleId(z), 0)

        set pFrame = GetFrameByName("VoiceButtonIcon", fid)
        call SetFrameTexture(pFrame, s, 0, true)

        set isVoiceActive[fid] = false
        set isVoiceOnce[pid] = false
        call FlushChildHashtable(ht, GetHandleId(z))
        call DestroyTimer(z)
        
        set z = null
        set p = null
        set pFrame = null
    endfunction
    
    function VoiceButtonActive takes nothing returns nothing
        local timer z
        local player p = GetTriggerPlayer()
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2
        local string s = ""
        local integer pid = GetPlayerId(p)
        local integer fid = LoadInteger(ht, StringHash("voice"), GetHandleId(pFrame))
        
        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif
        
        if not isVoiceActive[fid] and not isVoiceOnce[pid] then
            set isVoiceActive[fid] = true
            set isVoiceOnce[pid] = true
            
            call DisplayChatMessage(p, CHAT_RECIPIENT_ALL, VoiceText[fid])

            set s = "war3mapImported\\voicewheel" + I2S(fid + 1) + ".mp3"
            call SoundStart(s)

            set pFrame2 = GetFrameByName("VoiceButtonIcon", fid)
            set s = "war3mapImported\\DISBTNvoicebutton.blp"
            call SetFrameTexture(pFrame2, s, 0, true)
            
            set z = CreateTimer()
            call SavePlayerHandle(ht, GetHandleId(z), 0, p)
            call SaveInteger(ht, GetHandleId(z), 0, fid)
            call TimerStart(z, 40, false, function VoiceButtonReset)
        endif
        
        set z = null
        set p = null
        set pFrame = null
        set pFrame2 = null
    endfunction
    
    globals
        integer array MemoHero
        integer array HeroFrameId
        boolean array HeroGone
        boolean array SelectedYet
        boolean array BanYet
        private framehandle array frameSelected
    endglobals
    
    function HeroConfirmButton takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2
        local string s = ""
        local integer pid = GetPlayerId(p)
        local integer hid = MemoHero[pid]
        local integer fid = HeroFrameId[pid]
    
        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif
    
        if hid != 0 and not SelectedYet[pid] and not HeroGone[hid] then
            set pFrame2 = GetFrameByName("HeroSelectorButtonOKIcon", 0)
            set s = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNY.blp"
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame2, s, 0, true)
            endif
        
            set pFrame2 = GetFrameByName("HeroSelectorButtonBANIcon", 0)
            set s = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNCancel.blp"
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame2, s, 0, true)
            endif
        
            set pFrame2 = GetFrameByName("HeroSelectorButtonRANDOMIcon", 0)
            set s = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNSelectHeroOn.blp"
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame2, s, 0, true)
            endif

            set pFrame2 = GetFrameByName("HeroSelectorIconView", pid)
            set s = HeroPhoto[hid]
            call SetFrameTexture(pFrame2, s, 0, true)
        
            if GetUnitBaseIntegerFieldById(HeroType[hid], UNIT_IF_PRIMARY_ATTRIBUTE) == 1 then
                set pFrame2 = GetFrameByName("HeroSelectorButtonIcon", fid)
                set s = HeroPhoto2[hid]
                call SetFrameTexture(pFrame2, s, 0, true)
            elseif GetUnitBaseIntegerFieldById(HeroType[hid], UNIT_IF_PRIMARY_ATTRIBUTE) == 3 then
                set pFrame2 = GetFrameByName("HeroSelectorButton2Icon", fid)
                set s = HeroPhoto2[hid]
                call SetFrameTexture(pFrame2, s, 0, true)
            else
                set pFrame2 = GetFrameByName("HeroSelectorButton3Icon", fid)
                set s = HeroPhoto2[hid]
                call SetFrameTexture(pFrame2, s, 0, true)
            endif
        
            set s = HeroVoice[hid]
            if s != "" then
                call SoundStartPlayer(s, p, true)
            endif
        
            set HeroGone[hid] = true
            set SelectedYet[pid] = true
        endif
    
        set p = null
        set pFrame = null
        set pFrame2 = null
    endfunction

    function HeroBanButton takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2
        local framehandle pFrame3
        local string s = ""
        local integer pid = GetPlayerId(p)
        local integer hid = MemoHero[pid]
        local integer fid = HeroFrameId[pid]
    
        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif
    
        if hid != 0 and not BanYet[pid] and not SelectedYet[pid] then
            set pFrame2 = GetFrameByName("HeroSelectorButtonBANIcon", 0)
            set s = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNCancel.blp"
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame2, s, 0, true)
            endif
        
            if GetUnitBaseIntegerFieldById(HeroType[hid], UNIT_IF_PRIMARY_ATTRIBUTE) == 1 then
                set pFrame2 = GetFrameByName("HeroSelectorButtonIcon", fid)
                call SetFrameTexture(pFrame2, HeroPhoto2[hid], 0, true)
            elseif GetUnitBaseIntegerFieldById(HeroType[hid], UNIT_IF_PRIMARY_ATTRIBUTE) == 3 then
                set pFrame2 = GetFrameByName("HeroSelectorButton2Icon", fid)
                call SetFrameTexture(pFrame2, HeroPhoto2[hid], 0, true)
            else
                set pFrame2 = GetFrameByName("HeroSelectorButton3Icon", fid)
                call SetFrameTexture(pFrame2, HeroPhoto2[hid], 0, true)
            endif
        
            set HeroGone[hid] = true
            set BanYet[pid] = true
        endif
    
        set p = null
        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
    endfunction

    function HeroRandomButton takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2
        local string s = ""
        local real diff
        local integer pid = GetPlayerId(p)
        local integer fid
        local integer randomI
        local integer i
    
        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif
    
        if not SelectedYet[pid] then
            set pFrame2 = GetFrameByName("HeroSelectorButtonOKIcon", 0)
            set s = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNY.blp"
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame2, s, 0, true)
            endif
        
            set pFrame2 = GetFrameByName("HeroSelectorButtonBANIcon", 0)
            set s = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNCancel.blp"
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame2, s, 0, true)
            endif
        
            set pFrame2 = GetFrameByName("HeroSelectorButtonRANDOMIcon", 0)
            set s = "ReplaceableTextures\\CommandButtonsDisabled\\DISBTNSelectHeroOn.blp"
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame2, s, 0, true)
            endif
        
            loop
                exitwhen SelectedYet[pid]
                set randomI = GetRandomInt(1, MaxHero)
                set fid = LoadInteger(ht, StringHash("iconFrame"), randomI)
                set diff = HeroDiff[fid]  
                if not HeroGone[randomI] then
                    set MemoHero[pid] = randomI
                    set i = 0
                    loop
                        exitwhen i > 2
                        if diff > 0 then
                            set pFrame2 = GetFrameByName("HeroSelectorTipStar", i)
                            if GetLocalPlayer() == p then
                                call ShowFrame(pFrame2, true)
                            endif
                            set diff = diff - 1
                        else
                            set pFrame2 = GetFrameByName("HeroSelectorTipStar", i)
                            if GetLocalPlayer() == p then
                                call ShowFrame(pFrame2, false)
                            endif
                        endif
                        set i = i + 1
                    endloop
                    set pFrame2 = GetFrameByName("HeroSelectorTipText", 0)
                    set s = "|cffDAA520" + GetUnitBaseStringFieldById(HeroType[randomI], UNIT_SF_NAME)
                    if GetLocalPlayer() == p then
                        call SetFrameText(pFrame2, s)
                    endif
                    set pFrame2 = GetFrameByName("HeroSelectorTipIcon", 0)
                    if GetLocalPlayer() == p then
                        call SetFrameTexture(pFrame2, HeroPhoto[randomI], 0, true)
                    endif
                    set i = 0
                    loop
                        exitwhen i > 4
                        set pFrame = GetFrameByName("HeroSelectorButtonSpellIcon", i)
                        set s = LoadStr(ht, StringHash("SpellIcon_" + I2S(i)), HeroType[randomI])
                        if GetLocalPlayer() == p then
                            call SetFrameTexture(pFrame, s, 0, true)
                        endif
                        set pFrame = GetFrameByName("HeroSelectorButtonSpellText", i)
                        set s = LoadStr(ht, StringHash("SpellTip_" + I2S(i)), HeroType[randomI])
                        if GetLocalPlayer() == p then
                            call SetFrameText(pFrame, s)
                        endif
                        set i = i + 1
                    endloop
                    set pFrame2 = GetFrameByName("HeroSelectorIconView", pid)
                    call SetFrameTexture(pFrame2, HeroPhoto[randomI], 0, true)
                    if GetUnitBaseIntegerFieldById(HeroType[randomI], UNIT_IF_PRIMARY_ATTRIBUTE) == 1 then
                        set pFrame2 = GetFrameByName("HeroSelectorButtonIcon", fid)
                        call SetFrameTexture(pFrame2, HeroPhoto2[randomI], 0, true)
                    elseif GetUnitBaseIntegerFieldById(HeroType[randomI], UNIT_IF_PRIMARY_ATTRIBUTE) == 3 then
                        set pFrame2 = GetFrameByName("HeroSelectorButton2Icon", fid)
                        call SetFrameTexture(pFrame2, HeroPhoto2[randomI], 0, true)
                    else
                        set pFrame2 = GetFrameByName("HeroSelectorButton3Icon", fid)
                        call SetFrameTexture(pFrame2, HeroPhoto2[randomI], 0, true)
                    endif
                    if HeroVoice[randomI] != "" then
                        call SoundStartPlayer(HeroVoice[randomI], p, true)
                    endif
                    call AdjustPlayerStateBJ(200, p, PLAYER_STATE_RESOURCE_GOLD)    
                    set HeroGone[randomI] = true
                    set SelectedYet[pid] = true
                endif
            endloop
        endif
    
        set p = null
        set pFrame = null
        set pFrame2 = null
    endfunction

    function EndFocusButton takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle pFrame = GetTriggerFrame()
    
        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif
    
        set p = null
        set pFrame = null
    endfunction
    
    globals
        unit array MainHero
    endglobals
    
    function UpdateScoreBoard takes nothing returns nothing
        local unit u
        local item it
        local framehandle pFrame
        local string s = ""
        local integer ulvl
        local integer i
        local integer i2
        local integer i3
        
        set i = 0
        loop
            exitwhen i > 11
            set u = MainHero[i]
            if u != null then
                set pFrame = GetFrameByName("TextPlayerLevel", i) 
                set ulvl = GetHeroLevel(u)
                set s = "|cffDAA520" + I2S(ulvl)
                if GetFrameText(pFrame) != s then
                    call SetFrameText(pFrame, s)
                endif

                set pFrame = GetFrameByName("TextPlayerKDA", i)
                set s = "|cffDAA520" + I2S(scoreKill[i]) + " / " + I2S(scoreDeath[i]) + " / " + I2S(scoreAssist[i])
                if GetFrameText(pFrame) != s then
                    call SetFrameText(pFrame, s)
                endif
        
                set i2 = 0
                loop 
                    set it = UnitItemInSlot(u, i2)
                    set i3 = (i * 10) + i2
                    if it != null then
                        set pFrame = GetFrameByName("ItemSlotBackground", i3)
                        set s = GetItemStringField(it, ITEM_SF_ICON)
                        if LoadStr(ht, StringHash("itemUI"), i3) != s then
                            call SetFrameTexture(pFrame, s, 0, true)
                            call SaveStr(ht, StringHash("itemUI"), i3, s)
                        endif
                    else
                        set pFrame = GetFrameByName("ItemSlotBackground", i3)
                        set s = "ReplaceableTextures\\CommandButtons\\BTNCancel.blp"
                        if LoadStr(ht, StringHash("itemUI"), i3) != s then
                            call SetFrameTexture(pFrame, s, 0, true)
                            call SaveStr(ht, StringHash("itemUI"), i3, s)
                        endif
                    endif
                    set i2 = i2 + 1
                    exitwhen i2 > 5
                endloop
            endif
            set i = i + 1
        endloop
        
        set u = null
        set it = null
        set pFrame = null
    endfunction

    function HeroIconButton takes nothing returns nothing
        local player p = GetTriggerPlayer()
        local framehandle pFrame = GetTriggerFrame()
        local string s = ""
        local integer fid = LoadInteger(ht, StringHash("iconFrame"), GetHandleId(pFrame))
        local integer fid2 = LoadInteger(ht, StringHash("iconFrame"), fid)
        local integer uid = HeroType[fid]
        local integer pid = GetPlayerId(p)
        local real diff = HeroDiff[fid]
        local integer i = 0

        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif

        if frameSelected[pid] != pFrame and not HeroGone[fid] and not SelectedYet[pid] then
            set frameSelected[pid] = pFrame
            set MemoHero[pid] = fid
            set HeroFrameId[pid] = fid2

            loop
                exitwhen i > 2
                if diff > 0 then
                    set pFrame = GetFrameByName("HeroSelectorTipStar", i)
                    if GetLocalPlayer() == p then
                        call ShowFrame(pFrame, true)
                    endif
                    set diff = diff - 1
                else
                    set pFrame = GetFrameByName("HeroSelectorTipStar", i)
                    if GetLocalPlayer() == p then
                        call ShowFrame(pFrame, false)
                    endif
                endif
                set i = i + 1
            endloop

            set pFrame = GetFrameByName("HeroSelectorTipText", 0)
            set s = "|cffDAA520" + GetUnitBaseStringFieldById(uid, UNIT_SF_NAME)
            if GetLocalPlayer() == p then
                call SetFrameText(pFrame, s)
            endif

            set pFrame = GetFrameByName("HeroSelectorTipIcon", 0)
            if GetLocalPlayer() == p then
                call SetFrameTexture(pFrame, HeroPhoto[fid], 0, true)
            endif
            
            set i = 0
            loop
                exitwhen i > 4
                set pFrame = GetFrameByName("HeroSelectorButtonSpellIcon", i)
                set s = LoadStr(ht, StringHash("SpellIcon_" + I2S(i)), uid)
                if GetLocalPlayer() == p then
                    call SetFrameTexture(pFrame, s, 0, true)
                endif

                set pFrame = GetFrameByName("HeroSelectorButtonSpellText", i)
                set s = LoadStr(ht, StringHash("SpellTip_" + I2S(i)), uid)
                if GetLocalPlayer() == p then
                    call SetFrameText(pFrame, s)
                endif
                
                set i = i + 1
            endloop
        endif

        set p = null
        set pFrame = null
    endfunction

    globals
        private integer array lastClick1
    endglobals

    function ShopBuyButton takes nothing returns nothing
        local framehandle pFrame = GetTriggerFrame()
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)
        local integer i
        local integer i2

        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif

        set i = 0
        set i2 = 0
        loop
            exitwhen i > 5
            if UnitItemInSlot(MainHero[pid], i) != null then
                set i2 = i2 + 1
            endif
            set i = i + 1
        endloop

        if GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) >= shopharga[lastClick1[pid]] and i2 < 6 and IsUnitAlive(MainHero[pid]) and lastClick1[pid] > - 1 then
            call AdjustPlayerStateBJ(- shopharga[lastClick1[pid]], p, PLAYER_STATE_RESOURCE_GOLD)
            call UnitAddItemByIdSwapped(shopItemInt[lastClick1[pid]], MainHero[pid])
        endif

        set pFrame = null
        set p = null
    endfunction

    globals
        framehandle shopItemSprite = null
        string array shopSearchTxt
    endglobals

    function ShopItemButton takes nothing returns nothing
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2 = GetFrameByName("ShopItemTip", 0)
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)

        set lastClick1[pid] = LoadInteger(ht, StringHash("shopItemIndeks"), GetHandleId(pFrame))

        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
            call ClearFrameAllPoints(shopItemSprite)
            call SetFrameRelativePoint(shopItemSprite, FRAMEPOINT_BOTTOMLEFT, pFrame, FRAMEPOINT_BOTTOMLEFT, - 0.0046, - 0.0045)
            call SetFrameSpriteScale(shopItemSprite, 0.6)
            if not IsFrameVisible(shopItemSprite) then
                call ShowFrame(shopItemSprite, true)
            endif
            if GetFrameText(pFrame2) != shopTipText[lastClick1[pid]] then
                call SetFrameText(pFrame2, shopTipText[lastClick1[pid]])
            endif
        endif

        set pFrame = null
        set p = null
    endfunction

    private function ShopSearchFunc1 takes player p, string txt returns nothing
        local framehandle pFrame = GetFrameByName("ShopBordir", 0)
        local framehandle pFrame2 = GetFrameByName("ShopSkrol", 0)
        local framehandle pFrame3
        local real value = GetFrameValue(pFrame2)
        local integer i
        local integer i2
        local integer i3

        if txt != "" and txt != null then
            set i = 0
            set i2 = 0
            loop
                exitwhen i == shopItemIndex or i2 >= 34
                set pFrame3 = GetFrameByName("ShopItem", i)
                if StringContains(shopItemName[i], txt, false) then
                    if GetLocalPlayer() == p and not IsFrameVisible(pFrame3) then
                        call ShowFrame(pFrame3, true)
                    endif
                    set i2 = i2 + 1
                else
                    if GetLocalPlayer() == p and IsFrameVisible(pFrame3) then
                        call ShowFrame(pFrame3, false)
                    endif
                endif
                set i = i + 1
            endloop
            set i = 0
            set i3 = 0
            loop
                exitwhen i == shopItemIndex or i3 >= i2
                set pFrame3 = GetFrameByName("ShopItem", i)
                if GetLocalPlayer() == p and IsFrameVisible(pFrame3) then
                    call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[i3], shopItemPosY[i3])
                    set i3 = i3 + 1
                endif
                set i = i + 1
            endloop
        else
            set i = 0
            loop
                exitwhen i == shopItemIndex
                set pFrame3 = GetFrameByName("ShopItem", i)
                if GetLocalPlayer() == p and IsFrameVisible(pFrame3) then
                    call ShowFrame(pFrame3, false)
                endif
                set i = i + 1
            endloop
            if value == 1 then
                set i = 0
                loop
                    exitwhen i == shopItemIndex
                    if i >= 7 and i <= 41 then
                        set pFrame3 = GetFrameByName("ShopItem", i)
                        if GetLocalPlayer() == p and not IsFrameVisible(pFrame3) then
                            call ShowFrame(pFrame3, true)
                        endif
                        if GetLocalPlayer() == p then
                            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[i - 7], shopItemPosY[i - 7])
                        endif
                    endif
                    set i = i + 1
                endloop
            elseif value == 2 then
                set i = 0
                loop
                    exitwhen i == shopItemIndex
                    if i >= 0 and i <= 34 then
                        set pFrame3 = GetFrameByName("ShopItem", i)
                        if GetLocalPlayer() == p and not IsFrameVisible(pFrame3) then
                            call ShowFrame(pFrame3, true)
                        endif
                        if GetLocalPlayer() == p then
                            call SetFrameRelativePoint(pFrame3, FRAMEPOINT_TOPLEFT, pFrame, FRAMEPOINT_TOPLEFT, shopItemPosX[i], shopItemPosY[i])
                        endif
                    endif
                    set i = i + 1
                endloop
            endif
        endif

        set pFrame = null
        set pFrame2 = null
    endfunction

    function shopItemWheel takes nothing returns nothing
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2 = GetFrameByName("ShopSkrol", 0)
        local framehandle pFrame3
        local framehandle pFrame4
        local player p = GetTriggerPlayer()
        local integer pid = GetPlayerId(p)
        local real value = GetTriggerFrameReal()
        local real value2
        local integer i

        if value > 0 then
            if GetLocalPlayer() == p then
                call SetFrameValue(pFrame2, GetFrameValue(pFrame2) + 1)
            endif
        else
            if GetLocalPlayer() == p then
                call SetFrameValue(pFrame2, GetFrameValue(pFrame2) - 1)
            endif
        endif

        set pFrame3 = GetFrameByName("ShopItemTip", 0)
        if GetLocalPlayer() == p then
            if IsFrameVisible(shopItemSprite) then
                call ShowFrame(shopItemSprite, false)
            endif
            if GetFrameText(pFrame3) != "" then
                call SetFrameText(pFrame3, "")
            endif
        endif
        set lastClick1[pid] = - 1

        set pFrame3 = GetFrameByName("ShopBordir", 0)
        set value2 = GetFrameValue(pFrame2)
        set i = 0
        loop
            exitwhen i == shopItemIndex
            set pFrame4 = GetFrameByName("ShopItem", i)
            if GetLocalPlayer() == p and IsFrameVisible(pFrame4) then
                call ShowFrame(pFrame4, false)
            endif
            set i = i + 1
        endloop
        if value2 == 1 then
            set i = 0
            loop
                exitwhen i == shopItemIndex
                if i >= 7 and i <= 41 then
                    set pFrame4 = GetFrameByName("ShopItem", i)
                    if GetLocalPlayer() == p and not IsFrameVisible(pFrame4) then
                        call ShowFrame(pFrame4, true)
                    endif
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPLEFT, shopItemPosX[i - 7], shopItemPosY[i - 7])
                    endif
                endif
                set i = i + 1
            endloop
        elseif value2 == 2 then
            set i = 0
            loop
                exitwhen i == shopItemIndex
                if i >= 0 and i <= 34 then
                    set pFrame4 = GetFrameByName("ShopItem", i)
                    if GetLocalPlayer() == p and not IsFrameVisible(pFrame4) then
                        call ShowFrame(pFrame4, true)
                    endif
                    if GetLocalPlayer() == p then
                        call SetFrameRelativePoint(pFrame4, FRAMEPOINT_TOPLEFT, pFrame3, FRAMEPOINT_TOPLEFT, shopItemPosX[i], shopItemPosY[i])
                    endif
                endif
                set i = i + 1
            endloop
        endif
        if shopSearchTxt[pid] != "" and shopSearchTxt[pid] != null then
            call ShopSearchFunc1(p, shopSearchTxt[pid])
        endif

        set pFrame = null
        set pFrame2 = null
        set pFrame3 = null
        set pFrame4 = null
        set p = null
    endfunction

    function shopItemFocus takes nothing returns nothing
        local framehandle pFrame = GetTriggerFrame()
        local player p = GetTriggerPlayer()

        if GetLocalPlayer() == p then
            call SetFrameEnabled(pFrame, false)
            call SetFrameEnabled(pFrame, true)
        endif

        set pFrame = null
        set p = null
    endfunction

    function shopItemSearch takes nothing returns nothing
        local framehandle pFrame = GetTriggerFrame()
        local framehandle pFrame2 = GetFrameByName("ShopItemTip", 0)
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
        set lastClick1[pid] = - 1

        set shopSearchTxt[pid] = txt
        call ShopSearchFunc1(p, txt)

        set pFrame = null
        set pFrame2 = null
        set p = null
    endfunction
endlibrary