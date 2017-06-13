#!/bin/bash

mysql -u simple -psimple -hsimple-db simple < /sql/estructura.sql

mysql -u simple -psimple -hsimple-db simple < /sql/datos.sql
