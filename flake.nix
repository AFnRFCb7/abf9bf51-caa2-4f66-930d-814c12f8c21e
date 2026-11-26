# 7387965329269119
{
    inputs =
        {
            nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11" ;
            promoter-core.url = "github:AFnRFCb7/5ed1b239-ef69-406b-a793-03d07826b6a5" ;
            ssh-key-core.url = "github:AFnRFCb7/f2a72e50-6d44-49ec-80f0-98ecfb3cfd97";
        } ;
    outputs =
        { nixpkgs , self , promoter-core , ssh-key-core } :
            let
                implementation =
                    let
                        system = "x86_64-linux" ;
                        configuration =
                            nixpkgs.lib.nixosSystem
                                {
                                    inherit system ;
                                    modules =
                                        [
                                            ( promoter-core.lib { } ).implementation
                                            ./proprietary.nix
                                            ( ssh-key-core.lib { } ).implementation
                                            ./hardware-configuration.nix
                                        ] ;
                                } ;
                        in
                            {
                                nixosConfigurations.promoter = configuration ;
                                # checks.${ system } = { } ;
                            } ;
                in
                    {
                        lib =
                            { ... } :
                                {
                                    check =
                                        {
                                            nixosTest ,
                                            obviated-by
                                        } :
                                        {
                                        } :
                                        {
                                        } :
                                            let
                                                test =
                                                    nixosTest
                                                        {
                                                            name = "promoter-machine" ;
                                                            nodes.client = { ... } : { } ;
                                                            testScript =
                                                                ''
                                                                    client.wait_for_unit("multi-user.target")
                                                                '' ;
                                                        } ;
                                                in
                                                    {
                                                        obviated-by = obviated-by ;
                                                        test = test ;
                                                        type = "promoter-machine" ;
                                                    } ;
                                    # checks = { } ;
                                    implementation = implementation ;
                                } ;
                            nixosConfigurations = implementation.nixosConfigurations ;
                    } ;
}