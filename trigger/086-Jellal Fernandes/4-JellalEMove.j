//TESH.scrollpos=0
//TESH.alwaysfold=0
scope JellalE

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
        
        if LoadReal(ht, JellalEXHash, GetHandleId(c)) != .impact.x or LoadReal(ht, JellalEYHash, GetHandleId(c)) != .impact.y then 
            return true 
        endif
            
        return false
    endmethod
                
    method onRemove takes nothing returns nothing
        call IssueImmediateOrderById(c, 851972)
        set c = null
    endmethod
                
endstruct
    
function Trig_JellalEMove_Actions takes nothing returns nothing
    local unit c = GetTriggerUnit()
    local real x = GetOrderPointX()
    local real y = GetOrderPointY()
    local real dist
    local real a
    local Missile move
    if LoadBoolean(ht, JellalEHash, GetHandleId(c)) then 
        if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
            set dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
            set a = Angle(GetUnitX(c), GetUnitY(c), x, y)
            if dist > 1300 then
                set x = PolarX(GetUnitX(c), 1300, a)
                set y = PolarY(GetUnitY(c), 1300, a)
            endif
            call SaveReal(ht, JellalEXHash, GetHandleId(c), x)
            call SaveReal(ht, JellalEYHash, GetHandleId(c), y)
            set move = Missile.create(GetUnitX(c), GetUnitY(c), 0, x, y, 0)
            set move.c = c
            set move.speed = 1500
            set move.curve = GetRandomReal(- 15, 15)
            call move.launch()
            call SaveInteger(ht, JellalSoundHash, GetHandleId(c), LoadInteger(ht, JellalSoundHash, GetHandleId(c)) + 1) 
            if LoadInteger(ht, JellalSoundHash, GetHandleId(c)) >= 4 then
                call SaveInteger(ht, JellalSoundHash, GetHandleId(c), 0) 
                if GetRandomInt(1, 2) == 1 then
                    call SoundStart("war3mapImported\\Jellal_3-1.mp3")
                else
                    if GetRandomInt(1, 2) == 1 then
                        call SoundStart("war3mapImported\\Jellal_3-2.mp3")
                    else
                        call SoundStart("war3mapImported\\Jellal_3-3.mp3")
                    endif
                endif
            endif
        endif
    endif
    set c = null
endfunction

endscope
    
//===========================================================================
function InitTrig_JellalEMove takes nothing returns nothing
    set gg_trg_JellalEMove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JellalEMove, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction( gg_trg_JellalEMove, function Trig_JellalEMove_Actions )
endfunction