%% Tests avec valeurs précises
nb_vect=50;

norm_t=5;
s_norm_t=1;
theta_t=1.3;
s_theta_t=0.3;

test=[norm_t,s_norm_t,theta_t,s_theta_t]; 
vect_t=gen_meteore(test(1),test(2),test(3),test(4),nb_vect);

[R1, R1_b, theta,V,v,delta,s,k]=circ_data(vect_t(:,2)); %theta=theta, v=sd

nm=mean(vect_t(:,1));
sd=sqrt(var(vect_t(:,1)));


res=[nm,sd,theta,v]
diff=res-test
div=res./test