//TESH.scrollpos=0
//TESH.alwaysfold=0
scope MystoE

    private struct Missile extends Missiles
        
    unit c
                
    method onPeriod takes nothing returns boolean
        local real a = Angle(GetUnitX(c), GetUnitY(c), .impact.x, .impact.y)
        
        if Distance(GetUnitX(c), GetUnitY(c), .x, .y) > 1400 then
            return true
        endif
        
        if not IsTerrainPathable(.x, .y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, .x)
            call SetUnitY(c, .y)
        endif
        call SetUnitFacingEx(c, a, true)
        
        if LoadReal(ht, MystoEXHash, GetHandleId(c)) != .impact.x or LoadReal(ht, MystoEYHash, GetHandleId(c)) != .impact.y then 
            return true 
        endif
            
        return false
    endmethod
                
    method onRemove takes nothing returns nothing
        call IssueImmediateOrderById(c, 851972)
        set c = null
    endmethod
                
endstruct
    
function Trig_MystoEMove_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    local real x = GetOrderPointX()
    local real y = GetOrderPointY()
    local real dist
    local real a
    local Missile move
    if LoadBoolean(ht, MystoEHash, GetHandleId(c)) then 
        if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
            set dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
            set a = Angle(GetUnitX(c), GetUnitY(c), x, y)
            if dist > 1200 then
                set x = PolarX(GetUnitX(c), 1200, a)
                set y = PolarY(GetUnitY(c), 1200, a)
            endif
            call SaveReal(ht, MystoEXHash, GetHandleId(c), x)
            call SaveReal(ht, MystoEYHash, GetHandleId(c), y)
            set move = Missile.create(GetUnitX(c), GetUnitY(c), 0, x, y, 0)
            set move.c = c
            set move.speed = 1400
            set move.curve = GetRandomReal(- 15, 15)
            call move.launch()
            call SaveInteger(ht, MystoSoundHash, GetHandleId(c), LoadInteger(ht, MystoSoundHash, GetHandleId(c)) + 1) 
            if LoadInteger(ht, MystoSoundHash, GetHandleId(c)) >= 4 then
                call SaveInteger(ht, MystoSoundHash, GetHandleId(c), 0) 
                call SoundStart("war3mapImported\\Mysto_3-1.mp3")
            endif
        endif
    endif
    set c = null
endfunction

endscope
    
//===========================================================================
function InitTrig_MystoEMove takes nothing returns nothing
    set gg_trg_MystoEMove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoEMove, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction( gg_trg_MystoEMove, function Trig_MystoEMove_Actions )
endfunction