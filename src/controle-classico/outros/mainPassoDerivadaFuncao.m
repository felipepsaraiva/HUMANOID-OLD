%-----------------------------------------------------------
%M�todo para calcular o melhor passo (h) 
%para o c�lculo de um derivada num�rica
%-----------------------------------------------------------
%-----------------------------------------------------------
%iniciar, limpar mem�ria, fechar todas as janelas
%-----------------------------------------------------------
clear all
clc
close all
%-----------------------------------------------------------
%inicio do m�todo
%-----------------------------------------------------------
h = 0;%passo    
x = pi/180;%ponto de avalia��o
df = cos(x);%derivada da fun��o

%-----------------------------------------------------------
%valores para n
%-----------------------------------------------------------
n = 1:0.01:16;
%-----------------------------------------------------------
%tamanho do vetor n
%-----------------------------------------------------------
tam = size(n);
tam = tam(1,2);
%-----------------------------------------------------------
%criar um vetor para o c�lculo do erro
%-----------------------------------------------------------
erro = zeros(1,tam);
for i = 1:1:tam
%-----------------------------------------------------------
%atualizando o tamanho do passo
%-----------------------------------------------------------
    h = 10^-n(1,i);
%-----------------------------------------------------------
%c�lculo par�metros derivada centrada
%-----------------------------------------------------------
    a = sin(x +2*h);
    b = sin(x +  h);
    c = sin(x -  h);
    d = sin(x -2*h);
%-----------------------------------------------------------
%derivada centrada
%-----------------------------------------------------------
    d1 = (-a + 8*b  -8*c + d) / (12 * h)  + h^4;  
%-----------------------------------------------------------
%valor do erro
%-----------------------------------------------------------
    erro(1,i) = abs(df - d1);
%-----------------------------------------------------------
%verificar o andamento do loop
%-----------------------------------------------------------    
    msg = sprintf('%d de %d:',i,tam);
    disp(msg);
end
%-----------------------------------------------------------
%mostrar gr�fico na tela
%e configurar gr�fico
%-----------------------------------------------------------    
loglog(n,erro)
grid on
xlabel('n')
ylabel('log(erro)')
title('log(erro) para h = 10e-n')
%-----------------------------------------------------------
%C�lculos para obter o melhor valor de n
%-----------------------------------------------------------
valorOtimo(:,1) = erro(1,:)';
valorOtimo(:,2) = n(1,:)';
%-----------------------------------------------------------
%ordenar a matriz pela coluna de erro
%em ordem crescente
%o melhor valor de n � dado pela primeiro elemento
%da segunda coluna do ValorOtimoPasso
%-----------------------------------------------------------
valorOtimo = sortrows(valorOtimo);
%-----------------------------------------------------------
%Imprimir o melhor valor no console
%-----------------------------------------------------------
disp('**************************************************')
msg = sprintf('valor n : %d:',valorOtimo(1,2));
disp(msg)
msg = sprintf('erro  : %d:',valorOtimo(1,1));
disp(msg) 