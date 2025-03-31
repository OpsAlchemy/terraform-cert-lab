resource "docker_service" "redis" {
  name = "redis"
  mode {
    replicated {
      replicas = 1
    }
  }

  task_spec {
    container_spec {
      image = "redis:alpine"
    }
    networks_advanced {
      name = docker_network.frontend.name
    }
  }
}

resource "docker_service" "db" {
  name = "db"
  mode {
    replicated {
      replicas = 1
    }
  }

  task_spec {
    container_spec {
      image = "postgres:15-alpine"
      env = {
        POSTGRES_USER     = "postgres"
        POSTGRES_PASSWORD = "postgres"
      }
      mounts {
        target = "/var/lib/postgresql/data"
        source = docker_volume.db_data.name
        type   = "volume"
      }
    }
    networks_advanced {
      name = docker_network.backend.name
    }
  }
}


resource "docker_service" "vote" {
  name = "vote"
  mode {
    replicated {
      replicas = 3
    }
  }

  endpoint_spec {
    ports {
      target_port    = 80
      published_port = 8080
    }
  }

  task_spec {
    container_spec {
      image = "dockersamples/examplevotingapp_vote"
    }

    networks_advanced {
      name = docker_network.frontend.name
    }
  }
}



resource "docker_service" "result" {
  name = "result"
  mode {
    replicated {
      replicas = 1
    }
  }

  endpoint_spec {
    ports {
      target_port    = 80
      published_port = 8081
    }
  }

  task_spec {
    container_spec {
      image = "dockersamples/examplevotingapp_result"
    }

    networks_advanced {
      name = docker_network.backend.name
    }
  }
}



resource "docker_service" "worker" {
  name = "worker"
  mode {
    replicated {
      replicas = 2
    }
  }

  task_spec {
    container_spec {
      image = "dockersamples/examplevotingapp_worker"
    }

    networks_advanced {
      name = docker_network.frontend.name
    }

    networks_advanced {
      name = docker_network.backend.name
    }
  }
}
