## media storage
resource "kubernetes_persistent_volume_v1" "jellyfin_media_pv" {
  metadata {
    name = "${var.namespace}-media-pv"
    labels = merge(
      local.labels,
      { storage = "media" }
    )
  }

  spec {
    capacity = {
      storage = "10Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = var.storage_class_name

    persistent_volume_source {
      nfs {
        path   = var.jellyfin_media_path
        server = var.nfs_ipv4
      }
    }
  }

  timeouts {
    create = "2m"
  }
}

resource "kubernetes_persistent_volume_claim_v1" "jellyfin_media_pvc" {
  metadata {
    name      = "${var.namespace}-media-pvc"
    namespace = kubernetes_namespace_v1.jellyfin_ns.metadata[0].name
    labels    = local.labels
  }

  spec {
    storage_class_name = var.storage_class_name
    access_modes       = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    selector {
      match_labels = {
        storage = "media"
      }
    }
  }
}

## config storage
resource "kubernetes_persistent_volume_v1" "jellyfin_config_pv" {
  metadata {
    name = "${var.namespace}-${local.config_vol}-pv"
    labels = merge(
      local.labels,
      { storage = "config" }
    )
  }

  spec {
    capacity = {
      storage = "10Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = var.storage_class_name

    persistent_volume_source {
      nfs {
        path   = var.jellyfin_config_path
        server = var.nfs_ipv4
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "jellyfin_config_pvc" {
  metadata {
    name      = "${var.namespace}-${local.config_vol}-pvc"
    namespace = kubernetes_namespace_v1.jellyfin_ns.metadata[0].name
    labels    = local.labels
  }

  spec {
    storage_class_name = var.storage_class_name
    access_modes       = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    selector {
      match_labels = {
        storage = "config"
      }
    }
  }
}

## cache storage
resource "kubernetes_persistent_volume_v1" "jellyfin_cache_pv" {
  metadata {
    name = "${var.namespace}-${local.cache_vol}-pv"
    labels = merge(
      local.labels,
      { storage = "cache" }
    )
  }

  spec {
    capacity = {
      storage = "10Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = var.storage_class_name

    persistent_volume_source {
      nfs {
        path   = var.jellyfin_cache_path
        server = var.nfs_ipv4
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "jellyfin_cache_pvc" {
  metadata {
    name      = "${var.namespace}-${local.cache_vol}-pvc"
    namespace = kubernetes_namespace_v1.jellyfin_ns.metadata[0].name
    labels    = local.labels
  }

  spec {
    storage_class_name = var.storage_class_name
    access_modes       = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    selector {
      match_labels = {
        storage = "cache"
      }
    }
  }
}