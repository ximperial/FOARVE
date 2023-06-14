//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_EscaFMove_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    local real x = GetOrderPointX()
    local real y = GetOrderPointY()
    if LoadBoolean(ht, EscaFHash, GetHandleId(c)) then 
        if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
            call SaveReal(ht, EscaFXHash, GetHandleId(c), x)
            call SaveReal(ht, EscaFYHash, GetHandleId(c), y)
        endif
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_EscaFMove takes nothing returns nothing
    set gg_trg_EscaFMove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EscaFMove, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction( gg_trg_EscaFMove, function Trig_EscaFMove_Actions )
endfunction