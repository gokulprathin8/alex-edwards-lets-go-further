#!/usr/bin/env sh

migrate create -seq -ext=sql -dir=migrations add_movies_check_constraints
migrate -path=migrations -database=$GREENLIGHT_DB_DSN up


# migrate down
#$ migrate -path=./migrations -database =$EXAMPLE_DSN down 1