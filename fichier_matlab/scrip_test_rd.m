%% Tests randoms
%nombre de tests
nb_tests=100;
nb_vects=500;

%range norme
rg_n=[0,15];
rg_n_s=[0,3];
    
%range theta
rg_th=[0,2*pi];
rg_th_s=[0,pi/2];

[val,res]=f_tests(nb_tests,nb_vects, rg_n, rg_n_s, rg_th, rg_th_s);
diff=val-res;
div=res./val;
moy_diff=[mean(diff(:,1)), mean(diff(:,2)), mean(diff(:,3)), mean(diff(:,4))]
moy_div=[mean(div(:,1)), mean(div(:,2)), mean(div(:,3)), mean(div(:,4))]

%% Conclusions :
% Tout fonctionne parfaitement bien ormis theta qui donne assez souvent des
% valeurs complètement arbitraires (quand theta est trop petit)

%Calculer intervalles de confiance ??