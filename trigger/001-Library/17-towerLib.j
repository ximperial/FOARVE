scope towerLib initializer init

    private function action takes nothing returns nothing
        local unit u = GetAttacker()
        local unit t = GetTriggerUnit()
        local unit v
        local group g

        if GetUnitTypeId(u) == 'o005' then
            call Effect("war3mapImported\\ArcaneExplosion.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\AquaSpike.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set g = CreateGroup()
            call GroupEnumUnitsInRange(g, GetUnitX(t), GetUnitY(t), 500, null)
            loop
                set v = GroupForEachUnit(g)
                exitwhen v == null
                if FilterGeneral(u, v) then
                    call DamageUnit(u, v, 100 + GetUnitMaxLife(v) * 0.03)
                endif
            endloop
            call DestroyGroup(g)
        endif

        if GetUnitTypeId(u) == 'o003' then
            call Effect("war3mapImported\\[A]Flame Burst2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set g = CreateGroup()
            call GroupEnumUnitsInRange(g, GetUnitX(t), GetUnitY(t), 500, null)
            loop
                set v = GroupForEachUnit(g)
                exitwhen v == null
                if FilterGeneral(u, v) then
                    call DamageUnit(u, v, 150 + GetUnitMaxLife(v) * 0.03)
                endif
            endloop
            call DestroyGroup(g)
        endif

        set u = null
        set t = null
        set g = null
        set v = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, function action)
    endfunction
endscope

