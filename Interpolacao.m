valor_interpolar = 2.5;
pontos = [1, 2; 2, 3; 3, 5; 4, 7];

disp('Bem vindo ao programa de interpolacao da melhor equipe de MAT174! \n');
while true


    disp('Caso deseje encerrar digite o valor a interpolar igual aos pontos');
    valor_interpolar = input('Digite o valor a ser interpolado:');
    pontos = input('Digite os pontos da função: ');

    if valor_interpolar == pontos

        disp('Obrigado com licença.')
        break;

    end

    resultado_lagrange = interpol_lagrange(valor_interpolar, pontos);
    fprintf('Interpolacao do ponto x=%f pelo metodo de lagrange %f\n', valor_interpolar, resultado_lagrange);

    [newton_resultado, estimativa_erro] = newton_interpolation(valor_interpolar, pontos);
    fprintf('Interpolacao do ponto x=%f pelo metodo de Newton %f\n', valor_interpolar, newton_resultado);
    fprintf('Estimativa do erro: %f\n', estimativa_erro);

end


function resultado = interpol_lagrange(x, pontos)

    n = length(pontos);
    resultado = 0;

    for i = 1:n
        interpolador = pontos(i, 2);
        for j = 1:n
            if j != i
                interpolador = interpolador * (x - pontos(j, 1)) / (pontos(i, 1) - pontos(j, 1));
            end
        end
        resultado = resultado + interpolador;
    end
end


function [resultado, estimativa_erro] = newton_interpolation(x, pontos)

    n = length(pontos);
    f = zeros(n, n);

    for i = 1:n
        f(i, 1) = pontos(i, 2);
    end

    for j = 2:n
        for i = 1:n - j + 1
            f(i, j) = (f(i + 1, j - 1) - f(i, j - 1)) / (pontos(i + j - 1, 1) - pontos(i, 1));
        end
    end

    resultado = f(1, 1);
    interpolador = 1;

    for i = 2:n
        interpolador = interpolador * (x - pontos(i - 1, 1));
        resultado = resultado + interpolador * f(1, i);
    end

    estimativa_erro = interpolador * f(1, end);
end


%Membros da equipe Arthur, João Vitor, Matheus, Pedro
