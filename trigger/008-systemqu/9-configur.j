//! inject config
    call SetMapName( "TRIGSTR_8038" )
    call SetMapDescription( "TRIGSTR_8040" )
    call SetPlayers( 12 )
    call SetTeams( 12 )
    call SetGamePlacement( MAP_PLACEMENT_TEAMS_TOGETHER )

    call DefineStartLocation( 0, 11904.0, -13184.0 )
    call DefineStartLocation( 1, 11904.0, -13184.0 )
    call DefineStartLocation( 2, 11904.0, -13184.0 )
    call DefineStartLocation( 3, 11904.0, -13184.0 )
    call DefineStartLocation( 4, 11904.0, -13184.0 )
    call DefineStartLocation( 5, 11904.0, -13184.0 )
    call DefineStartLocation( 6, 11904.0, -13184.0 )
    call DefineStartLocation( 7, 11904.0, -13184.0 )
    call DefineStartLocation( 8, 11904.0, -13184.0 )
    call DefineStartLocation( 9, 11904.0, -13184.0 )
    call DefineStartLocation( 10, 11904.0, -13184.0 )
    call DefineStartLocation( 11, 11904.0, -13184.0 )

    // Player setup
    call InitCustomPlayerSlots(  )
    call InitCustomTeams(  )
    call InitAllyPriorities(  )
    call PlayMusic("Music\\1.mp3;Music\\2.mp3;Music\\3.mp3;Music\\4.mp3;Music\\5.mp3;Music\\6.mp3;Music\\7.mp3;Music\\8.mp3")
//! endinject