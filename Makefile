# Variables
DOCKER_UID := $(shell id -u)

# Commandes Docker
.PHONY: install ssh up stop down cs-fix test

# Installation des dépendances et création de la base de données
install:
	docker exec php bash -c 'composer install && bin/console d:d:c'

# Connexion SSH au conteneur PHP
ssh:
	docker exec -it php /bin/bash

# Démarrage des conteneurs Docker
up:
	docker compose up -d

# Arrêt des conteneurs Docker
stop:
	docker compose stop

# Suppression des conteneurs Docker
down:
	docker compose down

# Correction du style de code
cs-fix:
	docker compose exec php bash -c 'vendor/bin/php-cs-fixer fix'

# Exécution des tests
test:
	docker compose exec php bash -c 'vendor/bin/phpunit'