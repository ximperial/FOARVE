globals
    framehandle GameUI = null
    framehandle UnitMsgUI = null
    framehandle ChatMsgUI = null
    framehandle ConsoleUI = null
    framehandle HPBarUI = null
    framehandle ResourceUI = null
    framehandle QuestUI = null
    framehandle MenuUI = null
    framehandle AllyUI = null
    framehandle ChatButtonUI = null
    framehandle todUI = null
    framehandle CEditBarUI = null
    framehandle WorldUI = null
    framehandle CommandBarUI = null
    framehandle array CommandButtonUI
    framehandle array ItemButtonUI
    framehandle MiniMapUI = null
    framehandle PortraitUI = null
    framehandle CUberTipUI = null
endglobals

function Trig_StartInitFrame_Actions takes nothing returns nothing

    set GameUI = GetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
    set UnitMsgUI = GetOriginFrame(ORIGIN_FRAME_UNIT_MSG, 0)
    set ChatMsgUI = GetOriginFrame(ORIGIN_FRAME_CHAT_MSG, 0)
    set ConsoleUI = GetOriginFrame(ORIGIN_FRAME_CONSOLE_UI, 0)
    set HPBarUI = GetOriginFrame(ORIGIN_FRAME_HERO_BAR, 0)
    set ResourceUI = GetFrameByName("ResourceBarFrame", 0)
    set QuestUI = GetFrameByName("UpperButtonBarQuestsButton", 0)
    set MenuUI = GetFrameByName("UpperButtonBarMenuButton", 0)
    set AllyUI = GetFrameByName("UpperButtonBarAlliesButton", 0)
    set ChatButtonUI = GetFrameByName("UpperButtonBarChatButton", 0)
    set todUI = GetOriginFrame(ORIGIN_FRAME_TIME_OF_DAY_INDICATOR, 0)
    set CEditBarUI = GetOriginFrame(ORIGIN_FRAME_CHAT_EDITBAR, 0)
    set WorldUI = GetOriginFrame(ORIGIN_FRAME_WORLD_FRAME, 0)
    set CommandBarUI = GetOriginFrame(ORIGIN_FRAME_COMMAND_BAR, 0)
    set CommandButtonUI[0] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 0)
    set CommandButtonUI[1] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 1)
    set CommandButtonUI[2] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 2)
    set CommandButtonUI[3] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 3)
    set CommandButtonUI[4] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 4)
    set CommandButtonUI[5] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 5)
    set CommandButtonUI[6] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 6)
    set CommandButtonUI[7] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 7)
    set CommandButtonUI[8] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 8)
    set CommandButtonUI[9] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 9)
    set CommandButtonUI[10] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 10)
    set CommandButtonUI[11] = GetOriginFrame(ORIGIN_FRAME_COMMAND_BUTTON, 11)
    set ItemButtonUI[0] = GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 0)
    set ItemButtonUI[1] = GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 1)
    set ItemButtonUI[2] = GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 2)
    set ItemButtonUI[3] = GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 3)
    set ItemButtonUI[4] = GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 4)
    set ItemButtonUI[5] = GetOriginFrame(ORIGIN_FRAME_ITEM_BUTTON, 5)
    set MiniMapUI = GetOriginFrame(ORIGIN_FRAME_MINIMAP, 0)
    set PortraitUI = GetOriginFrame(ORIGIN_FRAME_PORTRAIT, 0)
    call ClearFrameAllPoints(MiniMapUI)

endfunction

//===========================================================================
function InitTrig_StartInitFrame takes nothing returns nothing
    set gg_trg_StartInitFrame = CreateTrigger(  )
    call TriggerAddAction( gg_trg_StartInitFrame, function Trig_StartInitFrame_Actions )
endfunction