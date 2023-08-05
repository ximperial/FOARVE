scope joinMap initializer init

    private function action takes nothing returns nothing
        local unit u = GetIndexUnit()
        local ability a
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        local string s = ""
        local string s2 = ""
        local string s3 = ""
        local string s4 = ""
        local integer akey1 = 0
        local integer akey2 = 4
        local integer aidkey = 0
        local integer abilId
    
        if IsUnitHero(u) and UserPlayer(GetOwningPlayer(u)) then
            set s = GetUnitStringField(u, UNIT_SF_HERO_ABILITY_LIST)
            loop
                exitwhen akey2 > StringLength(s)
                set s2 = SubString(s, akey1, akey2)
                set abilId = String2Id(s2)
                call SaveInteger(ht, StringHash("AbilKey_" + I2S(pid)), aidkey, abilId)
                if GetUnitAbilityLevel(u, abilId) == 0 and (aidkey == 0 or aidkey == 1 or aidkey == 2) then
                    call UnitAddAbility(u, abilId)
                    call UnitMakeAbilityPermanent(u, true, abilId)
                endif
                set akey1 = akey1 + 5
                set akey2 = akey2 + 5
                set aidkey = aidkey + 1
            endloop
            
            set s = GetUnitStringField(u, UNIT_SF_ABILITY_LIST)
            set s2 = SubString(s, 0, 4)
            set abilId = String2Id(s2)
            call SaveInteger(ht, StringHash("AbilKey_" + I2S(pid)), 5, abilId)
            set a = GetUnitAbility(u, abilId)
            call DisableAbility(a, true, true)
        
            set s2 = SubString(s, 5, 9)
            set abilId = String2Id(s2)
            call SaveInteger(ht, StringHash("AbilKey_" + I2S(pid)), 6, abilId)
            set a = GetUnitAbility(u, abilId)
            call DisableAbility(a, true, true)
        
            set abilId = LoadInteger(ht, StringHash("AbilKey_" + I2S(pid)), 2)
            call HibariEGain(u, abilId, 0.15)
            call MinatoEGain(u, abilId)
            call KirinEGain(u, abilId, 0.3)
        endif
                
        set u = null
        set a = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterUnitIndexEvent(function action)
    endfunction
endscope