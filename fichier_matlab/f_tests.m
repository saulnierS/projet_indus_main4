function [vec_val,vec_res]=f_tests(nb_tests,nb_vects, rg_n, rg_n_s, rg_th, rg_th_s)
vec_val=zeros(nb_tests,4); %La matrice contenant toutes les valeurs qui auront été utilisées comme tests
vec_res=zeros(nb_tests,4); %La matrice contentant tous les résultats approchés renvoyés par le programme

for i=1:nb_tests
    %Remplir vec_val :
    vec_val(i,1)=unifrnd(rg_n(1),rg_n(2));
    vec_val(i,2)=unifrnd(rg_n_s(1),rg_n_s(2));
    vec_val(i,3)=unifrnd(rg_th(1),rg_th(2));
    vec_val(i,4)=unifrnd(rg_th_s(1),rg_th_s(2));
    
    %Générer un vecteur à partir de ces valeurs :
    vect_t=gen_meteore(vec_val(i,1),vec_val(i,2),vec_val(i,3),vec_val(i,4),nb_vects);
    
    %Remplir vec_res :
    vec_res(i,1)=mean(vect_t(:,1));
    vec_res(i,2)=sqrt(var(vect_t(:,1)));
    [R1, R1_b, theta,V,v,delta,s,k]=circ_data(vect_t(:,2));
    vec_res(i,3)=theta;
    vec_res(i,4)=v;
    
end