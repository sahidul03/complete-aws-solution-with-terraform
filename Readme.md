# How to set up

## dev

1. Update profile name in [dev/.devcontainer/devcontainer.json].
  
    `aws-vault exec complete-aws-solution-dev ...` → `aws-vault exec $your-profile-name ...`

    ```
    {
      ...
      "initializeCommand": "aws-vault exec complete-aws-solution-dev -- env | grep AWS > complete-aws-solution-dev.env",
      ..
    }
    ```
2. Open `.dev` directory via Visual Studio Code
3. Call `Remote-Containers: Reopen in Container`

## prod
