#!/bin/bash

mysql -u simple -psimple -hdatabase simple < /sql/estructura.sql

mysql -u simple -psimple -hdatabase simple < /sql/datos.sql
