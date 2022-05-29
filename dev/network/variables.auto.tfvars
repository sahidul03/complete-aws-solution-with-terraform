vpc = {
  cidr_block = "10.20.0.0/16"
}

azs = ["1a", "1c"]

subnet = {
  private = {
    "1a" = {
      availability_zone = "ap-northeast-1a"
      cidr_block = "10.20.1.0/24"
    }
    "1c" = {
      availability_zone = "ap-northeast-1c"
      cidr_block = "10.20.2.0/24"
    }
  }
  public = {
    "1a" = {
      availability_zone = "ap-northeast-1a"
      cidr_block = "10.20.101.0/24"
    }
    "1c" = {
      availability_zone = "ap-northeast-1c"
      cidr_block = "10.20.102.0/24"
    }
  }
}

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKvMJ4w0yKyq5RWXgYjV86Ter8DnStOWCUpcXKnx6Tx9JX4UfTpQcULxqxVfAduqCi5nRMtzqqCnibI6FZX9lHHrRqL6v2CqxIcUlu1OzkzyRVWDCjMNrZf4lNL1HRHwFI98Ds2tMSafWBx7Nap9EkYEFPoaGcLPkLOhqY/etovDwby51L3RbwcQXixGfqbPJyNvBtHWYHTJBDkgi25w5ahsMAFOIgz/Y7AgwNk4MkWNilaN30Swtxr929BuT744fOzfuKoKlDZ1TRD1MiNiDrfXLj48NvIo/NQnkSCJxy1DayuMiMQwmNkOYf5a5TFdFPYOU47VBPxIB7HW2YB9LgYIh8dTmWtXssOmfRjtWBKFRZ0H8EAbiQeNsy5zVSptyW6+xFaHb4g959ukDq8pi3825XSoWf8dCH1C1aNsOgejCk/UnEJm2upfuW/w6hCGL8ILqo9B1od4Cmfkeaw9Tb3vtAfsl5TyMn5NhBrCzdDeJCpOOE1PuZU9liJeCYaptAZWAwRn3bQrC4MrOsGuS3ETynzuyJTDVkkeqWhzAvwCh8OIntEdAQC2N+C4iQVbr3fRFlVPvZVLuv7OfMEcuhnZIhNrGElasr2QKqXKjawON3rJQVCyJ22M8lt46sxO/YSvrdFTe/BTudV5TCYOUjGzwscglMhiwdRuotPnNrtw== sahidul03@gmail.com"
