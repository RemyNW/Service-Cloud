terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.0.0"
}

variable "github_token" {
  type      = string
  sensitive = true
}

provider "github" {
  token = var.github_token
  owner = "RemyNW"
}

resource "github_repository" "repo_terraform_demo" {
  name        = "repo-cree-par-terraform"
  description = "Repo GitHub créé automatiquement avec Terraform depuis le TP Service-Cloud"
  visibility  = "private"   # ou "public" selon l'énoncé

  has_issues = true
  auto_init  = true   # crée un README automatiquement
}
