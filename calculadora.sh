#!/bin/bash

touch resultado.txt

echo "Bem-vindo a Calculadora shell"
echo "Realizar operações com + - * e /"
echo "Use () para priorizar alguma parte sobre a outra."

echo "Instruções: "
echo "Digite e para sair."
echo "Digite s para começar e para continuar."
echo "Digite r para usar o último resultado."

while read -p "Escolha uma opção: " op
do
    if [ $op = 's' ]; then
        read -p "Digite uma expressão: " n1
        let result=$n1
        echo $result > resultado.txt
        temp=$(cat resultado.txt)
        
        echo "Resposta: $result"
    elif [ $op = 'r' ]; then
        echo "($temp" > resultado.txt
        temp=$(cat resultado.txt)
        read -p "$temp" n1
        let result=$temp$n1
        echo $result > resultado.txt
        temp=$(cat resultado.txt)
        
        echo "Resposta: $result"
    elif [ $op = "e" ] ; then
        echo "Programa encerrado!"
        break
    else
        echo "Erro, selecione uma opção existente."
    fi
done
