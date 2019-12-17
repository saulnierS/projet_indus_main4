#include "circ_data.h"

float circ_data_Sin(float* vec,int taille,int p)
{
	float Sp=0;
	for (int i = 0; i < taille; ++i)
	{
		float temp=p*vec[i];
		Sp=Sp+sin(temp);
	}
	return Sp;
}

float circ_data_Cos(float* vec,int taille,int p)
{
	float Cp=0;
	for (int i = 0; i < taille; ++i)
	{
		Cp=Cp+cos(p*vec[i]);
	}
	return Cp;
}

float circ_data_ATan(float Cp_b, float Sp_b)
{
	float Tp=atan(Sp_b/Cp_b);

	if (Cp_b<0)
	{
		Tp=Tp+3.14;
	}
	else if(Cp_b>0 && Sp_b<0)
	{
		Tp=Tp+2*3.14;
	}

	return Tp;
}

float circ_data_R(float C, float S)
{
	return sqrt(pow(C,2)+pow(S,2));
};

float circ_data_Var(float R)
{
	return 1-R;
}

float circ_data_sigma(float R)
{
	return sqrt(-2*logf(R));
}

float circ_data_delta(float T, float R)
{
	return (1-T)/(2*R*R);
}

float circ_data_skewnessis(float R1, float R2, float T1, float T2)
{
	return (R2*sin(T2-2*T1))/pow((1-R1),3/2);
}

float circ_data_kurtosis(float R1, float R2, float T1, float T2)
{
	return (R2*cos(T2-2*T1)-pow(R1,4))/pow((1-R1),3/2);
}

void circ_data_calcul(float* vec, int taille, float* R1, float* R1_b, float* theta, float* Var, float* sigma, float* delta, float* skewnessis, float* kurtosis)
{

	//Creation Cp, Cp_b, Sp, Sp_b 
	float C1=circ_data_Cos(vec,taille,1);
	float C2=circ_data_Cos(vec,taille,2);
	float C1_b=C1/(float)taille;
	float C2_b=C2/(float)taille;

	float S1=circ_data_Sin(vec,taille,1);
	float S2=circ_data_Sin(vec,taille,2);
	float S1_b=S1/(float)taille;
	float S2_b=S2/(float)taille;

	float T1=circ_data_ATan(C1_b,S1_b);
	float T2=circ_data_ATan(C2_b,S2_b);

	//Calculs des retours
	*(R1)=circ_data_R(C1,S1);
	float R2=circ_data_R(C2,S2);

	*(R1_b)=*(R1)/(float)taille;
	float R2_b=R2/(float)taille;	

	*(theta)=T1;

	*(Var)=circ_data_Var(*(R1_b));

	*(sigma)=circ_data_sigma(*(R1_b));

	*(delta)=circ_data_delta(T2,*(R1_b));

	*(skewnessis)=circ_data_skewnessis(*(R1_b),R2_b,T1,T2);

	*(kurtosis)=circ_data_kurtosis(*(R1_b),R2_b,T1,T2);
};