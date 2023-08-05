function Trig_StartInitFrame_Actions takes nothing returns nothing
    call ClearFrameAllPoints(GetOriginFrame(ORIGIN_FRAME_MINIMAP, 0))
endfunction

function InitTrig_StartInitFrame takes nothing returns nothing
    set gg_trg_StartInitFrame = CreateTrigger(  )
    call TriggerAddAction( gg_trg_StartInitFrame, function Trig_StartInitFrame_Actions )
endfunction