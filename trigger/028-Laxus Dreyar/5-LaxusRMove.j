//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_LaxusRMove_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    local real x = GetOrderPointX()
    local real y = GetOrderPointY()
    if LoadBoolean(ht, LaxusRHash, GetHandleId(c)) then 
        if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
            call SaveReal(ht, LaxusRXHash, GetHandleId(c), x)
            call SaveReal(ht, LaxusRYHash, GetHandleId(c), y)
        endif
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_LaxusRMove takes nothing returns nothing
    set gg_trg_LaxusRMove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LaxusRMove, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction( gg_trg_LaxusRMove, function Trig_LaxusRMove_Actions )
endfunction