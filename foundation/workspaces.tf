data "tfe_project" "Test" {
  name         = "Test"
  organization = "danielschniepp"
}

data "tfe_organizations" "this" {
}

output "organization" {
  value = data.tfe_organizations.this.ids
}

output "project" {
  value = data.tfe_project.Test.id
}

resource "tfe_workspace" "workspace1" {
  name                  = "workspace1"
  project_id            = data.tfe_project.Test.id
  organization          = "danielschniepp"
  description           = "workspace1"
  auto_apply            = true
  file_triggers_enabled = true
  #remote_state_consumer_ids = tfe_workspace.workspace2.id
  working_directory = "/workspace1"
  vcs_repo {
    identifier                 = "msamendinger/tc-poc"
    github_app_installation_id = "37664124"
  }
}

resource "tfe_workspace" "workspace2" {
  name                  = "workspace2"
  project_id            = data.tfe_project.Test.id
  organization          = "danielschniepp"
  description           = "workspace2"
  auto_apply            = true
  file_triggers_enabled = true
  working_directory     = "/workspace2"
  vcs_repo {
    identifier                 = "msamendinger/tc-poc"
    github_app_installation_id = "37664124"
  }
}

