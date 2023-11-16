scope MiscLib
    function healpot takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer ulvl = LoadInteger(ht, zid, 0)
        local integer userid = GetUnitUserData(u)

        if GetUnitAbilityLevel(u, 'B01C') == 0 or not IsUnitAlive(u) then
            set hpreg[userid] = hpreg[userid] - 20 - 3 * ulvl
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    function manapot takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer ulvl = LoadInteger(ht, zid, 0)
        local integer userid = GetUnitUserData(u)

        if GetUnitAbilityLevel(u, 'B01K') == 0 or not IsUnitAlive(u) then
            set mpreg[userid] = mpreg[userid] - 15 - 2 * ulvl
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    function satomiE takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer userid = GetUnitUserData(u)
        local real reg

        if u == null then
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        if IsUnitAlive(u) then
            set reg = 5 + (0.03 * GetUnitAbilityLevel(u, 'A01K') * GetHeroStr(u, true))
            if reg != LoadReal(ht, zid, 0) then
                set hpreg[userid] = hpreg[userid] + reg - LoadReal(ht, zid, 0)
                call SaveReal(ht, zid, 0, reg)
            endif
        endif
        
        set z = null
        set u = null
    endfunction

    function arthurE takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer userid = GetUnitUserData(u)
        local real reg

        if u == null then
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        if IsUnitAlive(u) then
            set reg = 5 + (0.03 * GetUnitAbilityLevel(u, 'A0JZ') * GetHeroAgi(u, true))
            if reg != LoadReal(ht, zid, 0) then
                set hpreg[userid] = hpreg[userid] + reg - LoadReal(ht, zid, 0)
                call SaveReal(ht, zid, 0, reg)
            endif
        endif
        
        set z = null
        set u = null
    endfunction

    function salterE takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer userid = GetUnitUserData(u)
        local real reg

        if IsUnitAlive(u) and GetUnitAbilityLevel(u, 'B01D') > 0 then
            set reg = (0.04 * GetUnitAbilityLevel(u, 'A0JE') * GetHeroStr(u, true))
            if reg != LoadReal(ht, zid, 0) then
                set hpreg[userid] = hpreg[userid] + reg - LoadReal(ht, zid, 0)
                call SaveReal(ht, zid, 0, reg)
            endif
        else
            set hpreg[userid] = hpreg[userid] - LoadReal(ht, zid, 0)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
    endfunction

    function vegetaE takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer userid = GetUnitUserData(u)
        local real reg

        if u == null then
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        if IsUnitAlive(u) then
            set reg = 5 + (0.03 * GetUnitAbilityLevel(u, 'A04I') * GetHeroStr(u, true))
            if reg != LoadReal(ht, zid, 0) then
                set hpreg[userid] = hpreg[userid] + reg - LoadReal(ht, zid, 0)
                call SaveReal(ht, zid, 0, reg)
            endif
        endif
        
        set z = null
        set u = null
    endfunction
endscope