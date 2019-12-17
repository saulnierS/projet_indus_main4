function [R1, R1_b, theta,V,v,delta,s,k]= circ_data(vec)
%% Prend vec un vecteur d'angles en degrés et renvoie :
% R1 : resultant length (longueur résultate)
% R1_b : mean resultant length (la moyenne de la longueur résultante)
% theta : mean direction (la direction moyenne) (estimation)
% V : circular variance (variance circulaire)
% v : circular standard deviantion (variance circulaire standard)
% delta : circular dispertion (dispertion circulaire, pour les calculs
% d'intervalles de confiance)
% s : skewness
% k : kurtosis
N=length(vec);

%% Appels aux fonctions de création pour Cp, Cp_barre, etc.
C1=f_C(vec,N,1);
C2=f_C(vec,N,2);
C1_b=C1/N;
C2_b=C2/N;

S1=f_S(vec,N,1);
S2=f_S(vec,N,2);
S1_b=S1/N;
S2_b=S2/N;

T1=f_T(C1_b,S1_b);
T2=f_T(C2_b,S2_b);

%% Calculs des retours
%R :
R1=sqrt(C1^2+S1^2);
R2=sqrt(C2^2+S2^2);

R1_b=R1/N;
R2_b=R2/N;

%theta :
theta=T1;

%V et v :
V=1-R1_b;
v=sqrt(-2*log(R1_b));

%delta :
delta=(1-T2)/(2*R1_b^2);

%s :
s=(R2_b*sin(T2-2*T1))/(1-R1_b)^(3/2);

%k :
k=(R2_b*cos(T2-2*T1)-R1_b^4)/(1-R1_b)^2;
end