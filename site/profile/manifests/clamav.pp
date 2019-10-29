class profile::clamav {
    class { '::clamav':
        before => File['/quarantine/'],
    }
    file {'/quarantine/':
        ensure  => directory,
        owner   => "clamscan",
        group   => "clamscan",
    }
    Cron { user => root, }
    case $::osfamily {
        'redhat': {
           cron {"freshclam":
               command => '/usr/bin/freshclam \
                       --log=/var/log/freshclam.log',
               hour    => 3,
               minute  => 25,
           }
        }
    }
    cron {"clamscan":
        command => "/usr/bin/clamscan --log=/var/log/clamscan.log \
                --infected --suppress-ok-results --bytecode=yes \
                --detect-pua=yes --detect-structured=yes \
                --algorithmic-detection=yes \
                --allmatch --move=/quarantine/ --recursive \
                /boot/ /etc/ /lib* /opt/ /root/ /usr/ /tmp/ /var/",
        hour    => 4,
        minute  => 45,
    }
}
