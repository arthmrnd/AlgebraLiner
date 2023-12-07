inicio = 0;
fim = 1;
interacoes = 0;

function resultado = integracao_trapezoidal(funcao, inicio, fim, interacoes)

    h = (fim - inicio) / interacoes;

    soma = (funcao(inicio) + funcao(fim)) / 2;

    for i = 1:(interacoes - 1)
        x = inicio + i * h;
        soma = soma + funcao(x);
    end

    resultado = h * soma;
end

funcao = @(x) (x);

while true

    disp('Caso deseje encerrar digite o inicio igual a o fim');
    inicio = input('Digite o inicio do intervalo: ');
    fim = input('Digite o fim do intervalo: ');


    if inicio == fim

        disp('Obrigado com licença.')
        break;

    end

    funcao = input('Digite a funcao');
    interacoes = input('Digite a quantidade de interações: ');

    resultado_integral = integracao_trapezoidal(funcao, inicio, fim, interacoes);
    fprintf('O valor da integral é: %f\n', resultado_integral);

end



%Membros da equipe Arthur, João Vitor, Matheus, Pedro
