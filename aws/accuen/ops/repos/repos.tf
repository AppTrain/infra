data "github_team" "accuen" {
  slug = "accuen"
}

data "github_repository" "apd" {
  name = "apd"
}

data "github_repository" "smp" {
  name = "smp"
}

data "github_repository" "python" {
  name = "docker-python"
}

data "github_repository" "airflow" {
  name = "airflow"
}

data "github_repository" "buildenv" {
  name = "packer-buildenv"
}

data "github_repository" "smp_complications" {
  name = "smp-complications"
}
