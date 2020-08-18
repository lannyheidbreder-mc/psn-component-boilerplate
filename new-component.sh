#!/bin/bash

function join_by { local IFS="$1"; shift; echo "$*"; }

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
dest=$(pwd);

if [ "$dest" = "$dir" ];then
  echo 'Run this script from where you want the component to be created, not inside its own folder!' 1>&2;
  exit 1;
fi

read -p 'Type the component name in title case, with spaces between words. ' nameTitleCase

namePascalCase=$(tr -d ' ' <<< $nameTitleCase)
nameCamelCase="$(tr '[:upper:]' '[:lower:]' <<< ${namePascalCase:0:1})${namePascalCase:1}"
nameKebabCase="$(echo $nameTitleCase | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"
nameSnakeCase="$(echo $nameKebabCase | tr '-' '_')"

placeholderTitleCase="Component Name"
placeholderPascalCase="ComponentName"
placeholderCamelCase="componentName"
placeholderKebabCase="component-name"
placeholderSnakeCase="component_name"
echo "$nameTitleCase"
echo "$namePascalCase"
echo "$nameCamelCase"
echo "$nameKebabCase"
echo "$nameSnakeCase"

cp -r "$dir" "${dest}/${nameKebabCase}"
cd "./${nameKebabCase}"

sed -i '' "s/${placeholderTitleCase}/${nameTitleCase}/g" ./*
sed -i '' "s/${placeholderPascalCase}/${namePascalCase}/g" ./*
sed -i '' "s/${placeholderCamelCase}/${nameCamelCase}/g" ./*
sed -i '' "s/${placeholderKebabCase}/${nameKebabCase}/g" ./*
sed -i '' "s/${placeholderSnakeCase}/${nameSnakeCase}/g" ./*

find . -type f -name "${placeholderKebabCase}*" | while read FILE ; do
  newfile="$(echo ${FILE} | sed -e "s/${placeholderKebabCase}/${nameKebabCase}/")";
  mv "${FILE}" "${newfile}" ;
done

rm -f new-component.sh
