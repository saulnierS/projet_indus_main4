function [Tp]= f_T(Cp_b,Sp_b)
%% Calcul des Tp :
Tp=atan(Sp_b/Cp_b);
if Cp_b <0
    Tp=Tp+pi;
else
    if Sp_b<0 && Cp_b>0
        Tp=Tp+2*pi;
    end
end
end