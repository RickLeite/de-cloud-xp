#!/usr/bin/env bash

cd infrastructure

PACKAGE="package"

if [ -d $PACKAGE ]
then
  echo "O Diretório $PACKAGE já existe."
else
    echo "===>"
    echo "Criando o diretório $PACKAGE"
    mkdir $PACKAGE
    echo "O diretório $PACKAGE foi criado."
    echo "<==="
fi

# Localiza o requirements com as dependências do projeto
FILE_REQUIREMENTS=../etl/lambda_requirements.txt

# Verifica se o arquivo lambda_requirements.txt existe
if [ -f $FILE_REQUIREMENTS ]
then
    echo "===>"
    echo "Instalando as dependências localizadas no arquivo "$FILE_REQUIREMENTS""
    pip install --target ./package -r $FILE_REQUIREMENTS
    echo "As dependências foram instaladas."
    echo "<==="
    exit 1
fi

cd $PACKAGE

# Localiza a função lambda para reutilização
LAMBDA_FUNCTION=../../etl/lambda_function.py

# Verifica se o arquivo lambda_function.py existe
if [ -f $LAMBDA_FUNCTION ]
then
    echo "===>"
    echo "Copiando função Handler do arquivo "$LAMBDA_FUNCTION""
    cp $LAMBDA_FUNCTION .
    echo "O arquivo "$LAMBDA_FUNCTION" foi copiado."
    echo "===="
    echo "Compactando o arquivo lambda_function_payload.zip"
    zip -r9 ../lambda_function_payload.zip .
    echo "O arquivo lambda_function_payload.zip foi compactado."
    echo "<==="
    exit 1
fi

cd ..