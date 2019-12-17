#ifndef __CIRC_DATA_H
#define __CIRC_DATA_H
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

float circ_data_Sin(float* vec,int taille,int p);

float circ_data_Cos(float* vec,int taille,int p);

float circ_data_ATan(float Cp_b, float Sp_b);

float circ_data_R(float C, float S);

float circ_data_Var(float R);

float circ_data_sigma(float R);

float circ_data_delta(float T,float R);

float circ_data_skewnessis(float R1, float R2, float T1, float T2);

float circ_data_kurtosis(float R1, float R2, float T1, float T2);

void circ_data_calcul(float* vec, int taille, float* R1, float* R1_b, float* theta, float* V, float* sigma, float* delta, float* s, float* k); 

#endif