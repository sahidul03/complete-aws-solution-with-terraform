# How to set up

## dev

1. Update profile name in [dev/.devcontainer/devcontainer.json].
  
    `aws-vault exec dark-store-dev ...` → `aws-vault exec $your-profile-name ...`

    ```
    {
      ...
      "initializeCommand": "aws-vault exec dark-store-dev -- env | grep AWS > dark-store-dev.env",
      ..
    }
    ```
2. Open `.dev` directory via Visual Studio Code
3. Call `Remote-Containers: Reopen in Container`

## prod
