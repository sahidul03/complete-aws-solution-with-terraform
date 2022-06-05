#!/usr/bin/env bash

output="secret.auto.tfvars"

read -p 'please enter your AWS profile for (complete-aws-solution-dev) > ' profile

keys="
/cas/MYSQL_HOST
/cas/MYSQL_PORT
/cas/MYSQL_DATABASE_NAME
/cas/MYSQL_USER
/cas/MYSQL_PASSWORD
"

echo "ssm_parameter = {" > $output

for key in $keys
do
  echo $key
  ssm_parameter=$(aws-vault exec $profile -- aws ssm get-parameter --name $key --with-decryption --output json)
  echo $ssm_parameter
  type=$(echo $ssm_parameter | jq '.Parameter.Type')
  value=$(echo $ssm_parameter | jq '.Parameter.Value')
  echo "\"$key\" = {" >> $output
  echo "type = $type," >> $output
  echo "value = $value" >> $output
  echo "}" >> $output
done

echo "}" >> $output
