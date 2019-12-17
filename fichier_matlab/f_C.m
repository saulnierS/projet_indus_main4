function [Cp]= f_C(vec,N,p)
%% Calcul des Cp avec :
% vec le vecteur des angles
% N la longueur de vec
% p le paramètre p (=1 ou 2 ici)

Cp=0;
for i=1:N
    Cp=Cp+cos(p*vec(i));
end
end