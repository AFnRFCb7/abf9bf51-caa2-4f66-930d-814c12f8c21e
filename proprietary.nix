{ config , pkgs , ... } :
    {
        config =
            {
                environment =
                    {
                        sessionVariables =
                            {
                                HALT = config.promoter.bin.halt ;
                                POLL = config.promoter.bin.poll ;
                                SSH = pkgs.openssh ;
                            } ;
                    } ;
                promoter.polling =
                    {
                        "personal.core" =
                            {
                                committer =
                                    {
                                        name = "Emory Merryman" ;
                                        email = "emory.merryman@gmail.com" ;
                                        ssh-command = ''"$SSH"/bin/ssh -i ${ config.ssh-key } -o StrictHostKeyChecking=accept-new" ;''
                                    } ;
                                url = "git@github.com:AFnRFCb7/ed1391c1-4e58-49ea-86dd-f0e982fd5805.git" ;
                            } ;
                        "personal.machine" =
                            {
                                committer =
                                    {
                                        name = "Emory Merryman" ;
                                        email = "emory.merryman@gmail.com" ;
                                        ssh-command = ''"$SSH"/bin/ssh -i ${ config.ssh-key } -o StrictHostKeyChecking=accept-new" ;''
                                    } ;
                                url = "git@github.com:AFnRFCb7/1bee96a9-a46e-49b6-b2f4-3a81676015ce.git" ;
                            } ;
                        "promoter.core" =
                            {
                                committer =
                                    {
                                        name = "Emory Merryman" ;
                                        email = "emory.merryman@gmail.com" ;
                                        ssh-command = ''"$SSH"/bin/ssh -i ${ config.ssh-key } -o StrictHostKeyChecking=accept-new" ;''
                                    } ;
                                url = "git@github.com:AFnRFCb7/5ed1b239-ef69-406b-a793-03d07826b6a5.git" ;
                            } ;
                        "promoter.machine" =
                            {
                                committer =
                                    {
                                        name = "Emory Merryman" ;
                                        email = "emory.merryman@gmail.com" ;
                                        ssh-command = ''"$SSH"/bin/ssh -i ${ config.ssh-key } -o StrictHostKeyChecking=accept-new" ;''
                                    } ;
                                url = "git@github.com:AFnRFCb7/6bab4423-1f26-4580-979e-564e138bfbe3.git" ;
                            } ;
                    } ;
                ssh-key = "/run/identity" ;
        } ;
    }
