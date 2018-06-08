%--------------------------------------------------------------------------
% Program     : Fractal Dimension (boxcounting.m)

% Written by  : Maysa Macedo

% email       : marcelo@cbpf.br ; maysagm@cbpf.br, dario@cbpf.br

% Copyright(©): Centro Brasileiro de Pesquisas Fisicas - CBPF/MCT/Rio de Janeiro/Brazil

% Version     : 1.0

% Objective   : Dimension Fractal Computing

% Compiler    : Matlab 6.5

% Project     : -

% Authors     : Maysa Macedo, Dario oliveira, Marcelo Portes de Albquerque, MPA

% Mode        : In Matlab 6.5 prompt, you should execute the comand:
% boxcounting('path\nameImage.png');

% Comments    : This program is distributed in the hope that it will be useful,
%                but WITHOUT ANY WARRANTY; without even the implied warranty of
%                MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. It is FREEWARE.   
%--------------------------------------------------------------------------

%A funcao 'boxcounting' binariza uma imagem de entrada e  divide a mesma em (2^n) quadrados.
%Calcula a dimensao fractal 
%ImEntrada: caminho da imagem que se deseja calcular a dimensao
%fractal
%Saida: Dimensao fractal da imagem (RegDimension.dimensao)
%       Imagem Original (RegDimension.original)
%       Vetor com log(N(s)) (RegDimension.grafico1)
%       Vetor com log(1/s) (RegDimension.grafico2)
%
%Chama a funçao "Contar" do mesmo arquivo (boxcounting.m)
%-----------------------------------------------------------------------
function [RegDimension] = BoxCounting(ImEntrada)
% Cabecalho

           fprintf('Fractal Dimension -  Version 1.0\n'); 

           fprintf('Centro Brasileiro de Pesquisas Fisicas - CBPF Brazil\n'); 


warning off;
 RegDimension = struct( 'dimensao',	{0},...
                        'original',{0},...
                        'grafico1',{0},...
                        'grafico2',{0});
                       
                             
%Le a imagem de entrada e binariza
imagem = imread(ImEntrada);
imagemAjust = imadjust(imagem,[min(min(im2double(imagem))) max(max(im2double(imagem)))],[0 1]);
imagemAjust=im2bw(imagemAjust);

RegDimension.original=imagemAjust;
tamanho=size(imagemAjust);
lower=tamanho(1);
upper=tamanho(2);
     

MatLogN=[];
[menorTam index]=min(tamanho);
maiorTam =max(tamanho);
N={};
maximo_divisao=log2(menorTam);
h = waitbar(0,'Calculando...');
for n=1:maximo_divisao
      %Define o lado do quadrado (2^n)
     if (index==1)
             lado= lower/2^n;
     else
             lado= upper/2^n;
     end   
     
     intUpper = floor(upper/lado);
     intLower = floor(lower/lado);     
      for i=0:(intUpper-1)
            for j=0:(intLower-1)
                    if (i==0 && j==0) 
                        Cont = Contar(imagemAjust,lado*i,lado*(i+1),lado*j,lado*(j+1));
                        N{n} = Cont.number;
                        w=ceil(maiorTam/lado);
                        MatLogN(n)=log(ceil(maiorTam/lado));
                     else
                         Cont = Contar(imagemAjust,lado*i,lado*(i+1),lado*j,lado*(j+1));
                         N{n} = N{n}+Cont.number;
                         % Caso existam sobras na imagem 
                         if ((lado*(i+1)<upper) && (lado*(i+2)>upper)) 
                             Cont = Contar(imagemAjust,lado*(i+1),upper,lado*j,lado*(j+1));
                             N{n} = N{n}+Cont.number;                             
                         end
                         if ((lado*(j+1)<lower) && (lado*(j+2)>lower)) 
                             Cont = Contar(imagemAjust,lado*(i),lado*(i+1),lado*(j+1),lower);
                             N{n} = N{n}+Cont.number;                             
                         end                         
                     end
                
            end 
            
      end
      waitbar(n/maximo_divisao);
end 
  close(h); 

MatLog=log(cell2mat(N));


Soma=0;
SomaN=0;
MediaN=0;
n_interval=0;

% media de todos os calculos possiveis do coeficiente angular da reta log/log 
for j=1:(n-1)
    for i=j+1:n
      Soma=(MatLog(i)-MatLog(j));
      SomaN=(MatLogN(i)-MatLogN(j));
      MediaN= MediaN+(Soma/SomaN);
      d=Soma/SomaN;
      n_interval=n_interval+1;
    end  
end  

Dimensao=MediaN/n_interval;
RegDimension.dimensao = Dimensao;
RegDimension.grafico1 = MatLog;
RegDimension.grafico2 = MatLogN;

%--------------------------------------------------------------------------
%A funçao 'Contar' calcula se existe pixel aceso na area da imagem que eh 
%fornecida atraves de quatro parametros.
%Entrada: imagemEntrada - imagem original.
%         lowerW        - coordenada horizontal inicial
%         upperW        - coordenada horizontal final
%         lowerH        - coordenada vertical inicial
%         upperH        - coordenada vertical final
%Saida:   Contagem.number- resposta para existencia de pixel aceso na area forncecida.
%                          0- nao existe pixel aceso
%                          1- existe pixel aceso
%--------------------------------------------------------------------------
function [Contagem] = Contar(imagemEntrada,lowerW,upperW,lowerH,upperH)
warning off;
Contagem = struct( 'number',	{0});
contador=0;

for i=lowerW+1:upperW
   for j=lowerH+1:upperH
       i=int16(i);
       j=int16(j);       
        if (imagemEntrada(j,i)~=1)
         
           contador=1;
           i=upperW+1;
           break;
       end
   end
end   

Contagem.number=contador;                            
    
