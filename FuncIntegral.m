a = 1;
b = 2;

function resultado = integracao_trapezoidal(funcao, a, b, numero_trapezios)
    % Função para calcular a integral usando o Método dos Trapézios

    % Calcula o passo da subdivisão
    h = (b - a) / numero_trapezios;

    % Calcula a soma inicial
    soma = (funcao(a) + funcao(b)) / 2;

    % Loop para somar as áreas dos trapézios
    for i = 1:(numero_trapezios - 1)
        x = a + i * h;
        soma = soma + funcao(x);
    end

    % Multiplica pela largura do trapézio e retorna o resultado
    resultado = h * soma;
end

% Exemplo de uso:
% Defina a função que deseja integrar
funcao = @(x) (-9)/(x^2);

% Defina o intervalo [a, b]

% Especifica o número de trapezóides (quanto maior, mais preciso)
numero_trapezios = 1000;

% Chama a função de integração
resultado_integral = integracao_trapezoidal(funcao, a, b, numero_trapezios);

% Exibe o resultado
fprintf('O valor da integral é: %f\n', resultado_integral);

