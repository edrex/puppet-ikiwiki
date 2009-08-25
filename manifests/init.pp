# ensure ikiwiki is installed on the system
    package { ikiwiki: ensure => installed }

    # idea: either initiate a new public wiki
    # or clone an existing public wiki as a local wiki

    define wiki ($srcdir, $repo='', $offline=false) {
        # add more use cases as needed
        if $create
        file { "/etc/nginx/sites-available/${name}.conf":
            content => template($conf_source),
            ensure => present,
        }
        file { "/etc/nginx/sites-enabled/${name}.conf":
            ensure => link,
            target => "/etc/nginx/sites-available/${name}.conf",
        }
    }
}


