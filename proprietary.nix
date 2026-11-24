{ config , pkgs , ... } :
    {
        config =
            {
                promoter.polling =
                    {
                        "promoter.core" =
                            {
                                committer =
                                    {
                                        name = "Emory Merryman" ;
                                        email = "emory.merryman@gmail.com" ;
                                        ssh-command = "${ pkgs.openssh }/bin/ssh -i ${ config.ssh-key } -o StrictHostKeyChecking=accept-new" ;
                                    } ;
                                url = "git@github.com:AFnRFCb7/5ed1b239-ef69-406b-a793-03d07826b6a5.git" ;
                            } ;
                        "promoter.machine" =
                            {
                                committer =
                                    {
                                        name = "Emory Merryman" ;
                                        email = "emory.merryman@gmail.com" ;
                                        ssh-command = "${ pkgs.openssh }/bin/ssh -i ${ config.ssh-key } -o StrictHostKeyChecking=accept-new" ;
                                    } ;
                                url = "git@github.com:AFnRFCb7/6bab4423-1f26-4580-979e-564e138bfbe3.git" ;
                            } ;
                    } ;
                ssh-key = "/run/identity" ;
        } ;
    }
