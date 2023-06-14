//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_GonFMove_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    local real x = GetOrderPointX()
    local real y = GetOrderPointY()
    if LoadBoolean(ht, GonFHash, GetHandleId(c)) then 
        if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
            call SaveReal(ht, GonFXHash, GetHandleId(c), x)
            call SaveReal(ht, GonFYHash, GetHandleId(c), y)
        endif
    endif
    set c = null
endfunction

//===========================================================================
function InitTrig_GonFMove takes nothing returns nothing
    set gg_trg_GonFMove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GonFMove, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction( gg_trg_GonFMove, function Trig_GonFMove_Actions )
endfunction