function [Sp]= f_S(vec,N,p)
%% Calcul des Sp avec :
% vec le vecteur des angles
% N la longueur de vec
% p le paramètre p (=1 ou 2 ici)

Sp=0;
for i=1:N
    Sp=Sp+sin(p*vec(i));
end
end