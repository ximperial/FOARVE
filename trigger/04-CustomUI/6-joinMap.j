scope joinMap initializer init

    private function action takes nothing returns nothing
        local unit u = GetIndexUnit()
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local string s = ""
        local string s2 = ""
        local string s3 = ""
        local string s4 = ""
        local integer akey1 = 0
        local integer akey2 = 4
        local integer aidkey = 0
        local integer aid
    
        if IsUnitHero(u) and UserPlayer(GetOwningPlayer(u)) then
            set s = GetUnitStringField(u, UNIT_SF_HERO_ABILITY_LIST)
            loop
                exitwhen akey2 > StringLength(s)
                set s2 = SubString(s, akey1, akey2)
                set aid = String2Id(s2)
                call SaveInteger(ht, StringHash("AbilKey_" + I2S(pid)) , aidkey, aid)
                if GetUnitAbilityLevel(u, aid) == 0 and(aidkey == 0 or aidkey == 1 or aidkey == 2) then
                    call UnitAddAbility(u, aid)
                    call UnitMakeAbilityPermanent(u, true, aid)
                endif
                set akey1 = akey1 + 5
                set akey2 = akey2 + 5
                set aidkey = aidkey + 1
            endloop
            
            set s = GetUnitStringField(u, UNIT_SF_ABILITY_LIST)
            set s2 = SubString(s, 0, 4)
            set aid = String2Id(s2)
            call SaveInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 5, aid)
            call DisableAbilityEx(u, aid, true)
        
            set s2 = SubString(s, 5, 9)
            set aid = String2Id(s2)
            call SaveInteger(ht, StringHash("AbilKey_" + I2S(pid)) , 6, aid)
            call DisableAbilityEx(u, aid, true)

            call izayoiW2(u)
        endif
                
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterUnitIndexEvent(function action)
    endfunction
endscope