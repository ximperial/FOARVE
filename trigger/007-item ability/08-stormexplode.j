scope stormexplode initializer init

    private function action takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local real dmg

        if GetSpellAbilityId() == 'A056' then
            call Effect("war3mapImported\\SuperShinyThingy5.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\DTRed.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\SuperBigBombExplosionRed.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            if UnitHasItemOfTypeBJ(u, 'I04L') then
                set dmg = 7 * GetHeroInt(u, true)
            elseif UnitHasItemOfTypeBJ(u, 'I02N') then
                set dmg = 6 * GetHeroInt(u, true)
            else
                set dmg = 5 * GetHeroInt(u, true)
            endif
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 700, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, dmg)
                endif
            endloop
            call GroupClear(gGroup)
            call UnitAddAbility(u, 'A052')
            call UnitMakeAbilityPermanent(u, true, 'A052')
            call LinkSpell(u, 'A052', 5, true)
            call LinkSpell(u, 'B01G', 5, true)
        endif

        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope