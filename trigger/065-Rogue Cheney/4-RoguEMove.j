//TESH.scrollpos=0
//TESH.alwaysfold=0
scope RoguE

    private struct Missile extends Missiles
        
    unit c
                
    method onPeriod takes nothing returns boolean
        local real a = Angle(GetUnitX(c), GetUnitY(c), .impact.x, .impact.y)
        
        if not IsTerrainPathable(.x, .y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, .x)
            call SetUnitY(c, .y)
        endif
        call SetUnitFacingEx(c, a, true)
        
        if LoadReal(ht, RoguEXHash, GetHandleId(c)) != .impact.x or LoadReal(ht, RoguEYHash, GetHandleId(c)) != .impact.y then 
            return true 
        endif
            
        return false
    endmethod
                
    method onRemove takes nothing returns nothing
        call IssueImmediateOrderById(c, 851972)
        set c = null
    endmethod
                
endstruct
    
function Trig_RoguEMove_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    local real x = GetOrderPointX()
    local real y = GetOrderPointY()
    local real dist
    local real a
    local Missile move
    if LoadBoolean(ht, RoguEHash, GetHandleId(c)) then 
        if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
            set dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
            set a = Angle(GetUnitX(c), GetUnitY(c), x, y)
            if dist > 1300 then
                set x = PolarX(GetUnitX(c), 1300, a)
                set y = PolarY(GetUnitY(c), 1300, a)
            endif
            call SaveReal(ht, RoguEXHash, GetHandleId(c), x)
            call SaveReal(ht, RoguEYHash, GetHandleId(c), y)
            set move = Missile.create(GetUnitX(c), GetUnitY(c), 0, x, y, 0)
            set move.c = c
            set move.speed = 1500
            set move.curve = GetRandomReal(- 15, 15)
            call move.launch()
        endif
    endif
    set c = null
endfunction

endscope
    
//===========================================================================
function InitTrig_RoguEMove takes nothing returns nothing
    set gg_trg_RoguEMove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RoguEMove, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction( gg_trg_RoguEMove, function Trig_RoguEMove_Actions )
endfunction