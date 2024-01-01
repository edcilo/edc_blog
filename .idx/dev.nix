{ pkgs, ... }: {
    channel = "stable-23.05";

    # Use https://search.nixos.org/packages to find packages
    packages = [
        pkgs.nodejs_18
        pkgs.bun
    ];

    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    idx.extensions = [
        "astro-build.astro-vscode"
    ];

    # Sets environment variables in the workspace
    env = {
        APP_ENVIRONMENT = "development";
    };

    idx.previews = {
        enable = true;
        previews = [
            {
                command = [
                    "bun"
                    "run"
                    "dev"
                    "--hos" "0.0.0.0"
                    "--port" "4321"
                ];
                manager = "web";
                id = "web";
            }
        ];
    };
}
