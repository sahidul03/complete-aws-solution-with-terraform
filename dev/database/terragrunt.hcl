dependency network {
  config_path = "../network"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  network = dependency.network.outputs.network
}
