resource "tfe_workspace" "workspace1" {
  name                  = "workspace1"
  project_id            = tfe_project.POC.id
  organization          = "danielschniepp"
  description           = "workspace1"
  auto_apply            = true
  file_triggers_enabled = true
  #remote_state_consumer_ids = tfe_workspace.workspace2.id
  working_directory = "/workspace1"
  vcs_repo {
    identifier = "msamendinger/tc-poc"
  }
}

resource "tfe_workspace" "workspace2" {
  name                  = "workspace2"
  project_id            = tfe_project.POC.id
  organization          = "danielschniepp"
  description           = "workspace2"
  auto_apply            = true
  file_triggers_enabled = true
  working_directory     = "/workspace2"
  vcs_repo {
    identifier = "msamendinger/tc-poc"
  }
}

