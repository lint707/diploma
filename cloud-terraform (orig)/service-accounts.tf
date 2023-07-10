resource "yandex_iam_service_account" "docker-view" {
  name        = "docker-view"
  description = "service account to use container registry"
}

resource "yandex_iam_service_account" "docker-push" {
  name        = "docker-push"
  description = "service account to use container registry"
}

resource "yandex_iam_service_account" "docker-pull" {
  name        = "docker-pull"
  description = "service account to use container registry"
}

resource "yandex_iam_service_account" "instances" {
  name        = "instances"
  description = "service account to manage VMs"
}

####

resource "yandex_resourcemanager_folder_iam_binding" "viewer" {
  folder_id = var.yc_folder_id

  role = "viewer"

  members = [
    "serviceAccount:${yandex_iam_service_account.docker-view.id}",
  ]

  depends_on = [
    yandex_iam_service_account.docker-view
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "pusher" {
  folder_id = var.yc_folder_id

  role = "container-registry.images.pusher"

  members = [
    "serviceAccount:${yandex_iam_service_account.docker-push.id}",
  ]

  depends_on = [
    yandex_iam_service_account.docker-push
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "puller" {
  folder_id = var.yc_folder_id

  role = "container-registry.images.puller"

  members = [
    "serviceAccount:${yandex_iam_service_account.docker-pull.id}",
  ]

  depends_on = [
    yandex_iam_service_account.docker-pull
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id = var.yc_folder_id

  role = "editor"

  members = [
    "serviceAccount:${yandex_iam_service_account.instances.id}",
  ]

  depends_on = [
    yandex_iam_service_account.instances
  ]
}
