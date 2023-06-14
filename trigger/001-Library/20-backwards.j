library backwards uses Utilities
    function EffectUnitColor takes unit u, string str, real x, real y, real z, real yaw, real pitch, real roll, real scale, real duration, integer r, integer g, integer b, integer a returns effect
        call Effect(str, x, y, z, yaw, pitch, roll, scale, duration, r, g, b, a)
        
        return bj_lastCreatedEffect
    endfunction
    
    function SetEffectX takes effect e, real x returns nothing
        call SetSpecialEffectX(e, x)
    endfunction
    
    function SetEffectY takes effect e, real y returns nothing
        call SetSpecialEffectY(e, y)
    endfunction
    
    function SetEffectZ takes effect e, real z returns nothing
        call SetSpecialEffectZ(e, z)
    endfunction
    
    function Slope takes real x1, real y1, real z1, real x2, real y2, real z2 returns real
        local real d = SquareRoot((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
        local real r1 = (z2 - z1) / d
        return Atan(-r1) * bj_RADTODEG
    endfunction 
                                                                                                                                                                                                                                      
    function GetParabolaZ takes real x, real d, real h returns real
        return 4 * h * x * (d - x) / (d * d)
    endfunction
                                                                                                                                                                                                                                  
    function GetParabolaZEx takes real x, real d, real h, real z0, real zd returns real
        return 4 * h * x * (d - x) / (d * d) + x * (zd - z0) / d + z0
    endfunction
                                                                                                                                                                                                                                                                                          
    function MoveEffect2End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local effect e = LoadEffectHandle(ht, GetHandleId(z) , 0)
        local real speed = LoadReal(ht, GetHandleId(z) , 0)
        local real time = LoadReal(ht, GetHandleId(z) , 1)
        local real angle = LoadReal(ht, GetHandleId(z) , 2)
        local real x = PolarX(GetEffectX(e) , speed, angle)
        local real y = PolarY(GetEffectY(e) , speed, angle)
        local real z1 = LoadReal(ht, GetHandleId(z) , 3) + GetAxisZ(GetEffectX(e) , GetEffectY(e))
        set time = time - 0.02
        call SaveReal(ht, GetHandleId(z) , 1, time)
        call SetSpecialEffectPositionEx(e, x, y, z1)
        if time <= 0 then 
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set e = null
    endfunction
                                                                                                                                                                                                                                                                                              
    function MoveEffect2 takes effect e, real speed, real time, real angle returns nothing
        local timer z = CreateTimer()
        local real z1 = GetEffectZ(e)
        call SaveEffectHandle(ht, GetHandleId(z) , 0, e)
        call SaveReal(ht, GetHandleId(z) , 0, speed)
        call SaveReal(ht, GetHandleId(z) , 1, time)
        call SaveReal(ht, GetHandleId(z) , 2, angle)
        call SaveReal(ht, GetHandleId(z) , 3, z1)
        call TimerStart(z, 0.02, true, function MoveEffect2End)
        set z = null
    endfunction
                                                                                                                                                                                                                          
    function MoveEffect3End takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local effect e = LoadEffectHandle(ht, GetHandleId(z) , 0)
        local real speed = LoadReal(ht, GetHandleId(z) , 0)
        local real time = LoadReal(ht, GetHandleId(z) , 1)
        local real angle = LoadReal(ht, GetHandleId(z) , 2)
        local real ex = GetEffectX(e)
        local real ey = GetEffectY(e)
        local real ez = GetEffectZ(e)
        local real x = PolarX(ex, speed, angle)
        local real y = PolarY(ey, speed, angle)
        local real z1 = ez + GetAxisZ(ex + 0.01, ey) - GetAxisZ(ex - 0.01, ey) + LoadReal(ht, GetHandleId(z) , 3)
        set time = time - 0.02
        call SaveReal(ht, GetHandleId(z) , 1, time)
        call SetSpecialEffectPositionEx(e, x, y, z1)
        if time <= 0 then 
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        set z = null
        set e = null
    endfunction
                                                                                                                                                                                                                                                                                              
    function MoveEffect3 takes effect e, real speed, real zRate, real time, real angle returns nothing
        local timer z = CreateTimer()
        call SaveEffectHandle(ht, GetHandleId(z) , 0, e)
        call SaveReal(ht, GetHandleId(z) , 0, speed)
        call SaveReal(ht, GetHandleId(z) , 1, time)
        call SaveReal(ht, GetHandleId(z) , 2, angle)
        call SaveReal(ht, GetHandleId(z) , 3, zRate)
        call TimerStart(z, 0.02, true, function MoveEffect3End)
        set z = null
    endfunction
endlibrary