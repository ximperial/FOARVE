scope dynamicability

    private function Filtered takes integer aid returns boolean
        return aid == 'A0C9' or aid == 'A01Q'
    endfunction
    
    function DynamicAbility takes nothing returns nothing
        local ability ab = GetEnumAbility()
        local integer aid = GetAbilityTypeId(ab)
        local integer alvl = GetAbilityLevel(ab)
        local unit u = GetAbilityOwner(ab)
        local string oldstr = LoadStr(ht, StringHash("AbilityTip") , GetHandleId(ab))
        local string s = ""
        local integer val
        local integer val2

        if aid == 'A0AA' then // Portgas D. Ace
            set val = GetHeroStr(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0AB' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0AC' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"
        elseif aid == 'A0AF' then
            set val = (6 + 2 * alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0AE' then
            set val = 15 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 2000|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0AD' then
            set val = 11 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0AG' then
            set val = 8 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0AA' then // Satomi Rentaro
            set val = GetHeroStr(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 800|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A01G' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A01K' then
            set val = R2I(5 + 0.03 * alvl * GetHeroStr(u, true))
            set val2 = 2 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : None|n|cff00ffffCast Range|r : None|n|cff7cbfc1Passive|r : Increase life regeneration by " + I2S(val) + " and [D] damage dealt by " + I2S(val2)
        elseif aid == 'A00H' then
            set val = (6 + 2 * alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A01I' then
            set val = 15 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A01J' then
            set val = 11 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A01M' then
            set val = 10 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0JC' then // Saber Alter
            set val = GetHeroStr(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0JD' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0JE' then
            set val = R2I(0.04 * alvl * GetHeroStr(u, true)) 
            set val2 = GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : Increase life regeneration by " + I2S(val) + " and [R] damage dealt by " + I2S(val2) + " for 15s|n|cffff80ffCooldown|r 40 second"
        elseif aid == 'A0JF' then
            set val = (B2I(GetUnitAbilityLevel(u, 'B01D') > 0) * GetHeroStr(u, true)) + (6 + 2 * alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0JG' then
            set val = 15 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0JH' then
            set val = 11 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 2000|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0JI' then
            set val = 8 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 700|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A04F' then // Vegeta
            set val = GetHeroStr(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A04H' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A04I' then
            set val = R2I(5 + 0.03 * alvl * GetHeroStr(u, true))
            set val2 = 2 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : None|n|cff00ffffCast Range|r : None|n|cff7cbfc1Passive|r : Increase life regeneration by " + I2S(val) + " and [D] damage dealt by " + I2S(val2)
        elseif aid == 'A01Z' then
            set val = (6 + 2 * alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A04L' then
            set val = 15 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 900|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A029' then
            set val = 11 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A04N' then
            set val = 10 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A015' then // Sakamaki Izayoi
            set val = GetHeroStr(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A01B' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A051' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroStr(u, true))
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 60 second"
        elseif aid == 'A01R' then
            set val = (6 + 2 * alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A01S' then
            set val = 15 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A021' then
            set val = 11 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A022' then
            set val = 8 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0IC' then // Cloud Strife
            set val = GetHeroStr(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0ID' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0IE' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroStr(u, true))
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0IF' then
            set val = (6 + 2 * alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0IG' then
            set val = 15 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0IH' then
            set val = 11 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0II' then
            set val = 8 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0CE' then // Escanor
            set val = GetHeroStr(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0CF' then
            set val = (1 + alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0CG' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroStr(u, true))
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0CH' then
            set val = (6 + 2 * alvl) * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0CI' then
            set val = 15 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0CJ' then
            set val = 11 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0CK' then
            set val = 8 * GetHeroStr(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A03U' then // Aizen Sousuke
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A03P' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A03V' then
            set val = R2I(GetUnitBaseMoveSpeed(u) * (0.03 * alvl))
            set val2 = 2 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : None|n|cff00ffffCast Range|r : None|n|cff7cbfc1Passive|r : Increase movespeed by " + I2S(val) + " and [D] damage dealt by " + I2S(val2)
        elseif aid == 'A03Q' then
            set val = (6 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A03R' then
            set val = 15 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A03S' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A00U' then
            set val = 10 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0FO' then // Akame
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0FP' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0FQ' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroAgi(u, true))
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0FR' then
            set val = (6 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0FS' then
            set val = 15 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0FT' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0FU' then
            set val = 8 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0JX' then // Arthuria Pendragon
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0JY' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0JZ' then
            set val = R2I(5 + 0.03 * alvl * GetHeroAgi(u, true))
            set val2 = 2 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : None|n|cff00ffffCast Range|r : None|n|cff7cbfc1Passive|r : Increase life regeneration by " + I2S(val) + " and [D] damage dealt by " + I2S(val2)
        elseif aid == 'A0K0' then
            set val = (6 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0K1' then
            set val = 15 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0K2' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 2000|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0K3' then
            set val = 10 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A04R' then // Majin okita
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A04S' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0CS' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroAgi(u, true))
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A04T' then
            set val = (6 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A04U' then
            set val = 15 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A04V' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A04W' then
            set val = 8 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0I4' then // Alice Zuberg
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0I5' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0I6' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroAgi(u, true))
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0I7' then
            set val = (5 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0I8' then
            set val = 14 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1400|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0I9' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0IB' then
            set val = 8 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0G2' then // Ogita Soji
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0GE' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0GF' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroAgi(u, true))
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0GG' then
            set val = (6 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0GH' then
            set val = 15 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0GI' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0GJ' then
            set val = 8 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A0D6' then // Emiya Shirou
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0D7' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0D8' then
            set val = (6 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Instant|n|cff00ffffCast Range|r : None|n|cff5edc8dActive|r : Negate " + I2S(val) + " damage for 5s|n|cffff80ffCooldown|r 60 second"
        elseif aid == 'A0D9' then
            set val = (6 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0DA' then
            set val = 15 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0DB' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1400|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0DC' then
            set val = 8 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A052' then // Alpha CW
            set val = GetHeroAgi(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A053' then
            set val = (1 + alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A054' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroAgi(u, true))
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A056' then
            set val = (6 + 2 * alvl) * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A057' then
            set val = 15 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A058' then
            set val = 11 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A059' then
            set val = 8 * GetHeroAgi(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A00E' then // Hitsugaya Toshiro
            set val = GetHeroInt(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A0C8' then
            set val = (1 + alvl) * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 700|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A0CA' then
            set val = (6 + 2 * alvl) * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0CB' then
            set val = 15 * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0CC' then
            set val = 11 * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A0CD' then
            set val = 8 * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"

        elseif aid == 'A05E' then // Oma Shu
            set val = GetHeroInt(u, true) + 90 * alvl
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1200|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 20 second"
        elseif aid == 'A05F' then
            set val = (1 + alvl) * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A05K' then
            set val = R2I((1.5 + 0.5 * alvl) * GetHeroInt(u, true))
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 30 second"
        elseif aid == 'A05M' then
            set val = (6 + 2 * alvl) * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A05P' then
            set val = 15 * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 1400|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A05Q' then
            set val = 11 * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Unit Target|n|cff00ffffCast Range|r : 600|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 90 second"
        elseif aid == 'A05R' then
            set val = 8 * GetHeroInt(u, true)
            set s = "|cffffff80Target Type|r : Point Target|n|cff00ffffCast Range|r : 800|n|cff5edc8dActive|r : " + I2S(val) + " damage|n|cffff80ffCooldown|r 40 second"
        endif

        if s != oldstr and not Filtered(aid) then
            call SetAbilityStringLevelField(ab, ABILITY_SLF_TOOLTIP_NORMAL_EXTENDED, 0, s)
            call SaveStr(ht, StringHash("AbilityTip") , GetHandleId(ab) , s)
        endif

        set ab = null
        set u = null
    endfunction
endscope