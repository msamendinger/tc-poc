resource "tfe_workspace" "foundation" {
  name                  = "foundation"
  project_id            = tfe_project.POC.id
  organization          = "danielschniepp"
  description           = "Terraform Cloud Configuration"
  auto_apply            = true
  file_triggers_enabled = true
  working_directory     = "/foundation"
  vcs_repo {
    identifier = "msamendinger/tc-poc"
  }
}
