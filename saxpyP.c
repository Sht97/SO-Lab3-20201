/**
 * @defgroup   SAXPY saxpy
 *
 * @brief      This file implements an iterative saxpy operation
 * 
 * @param[in] <-p> {vector size} 
 * @param[in] <-s> {seed}
 * @param[in] <-n> {number of threads to create} 
 * @param[in] <-i> {maximum itertions} 
 *
 * @author     Danny Munera
 * @date       2020
 */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/time.h>
#include <pthread.h>

double* X;
double a;
double* Y;
double* Y_avgs;
// int it;
int p = 10000000;
int n_threads = 2;
int max_iters = 1000;
pthread_mutex_t mutex;

void* saxpy (void* arg);

// Estructura para los parámetros
typedef struct _param{
	int init;
	int end;

} param_t;

int main(int argc, char* argv[]){
	// Variables to obtain command line parameters
	unsigned int seed = 1;
  	// int p = 10000000;
  	// int n_threads = 2;
  	// int max_iters = 1000;
  	// Variables to perform SAXPY operation
	// double* X;
	// double a;
	// double* Y;
	// double* Y_avgs;
	// int it;
	int i;
	// Variables to get execution time
	struct timeval t_start, t_end;
	double exec_time;

	// Getting input values
	int opt;
	while((opt = getopt(argc, argv, ":p:s:n:i:")) != -1){  
		switch(opt){  
			case 'p':  
			printf("vector size: %s\n", optarg);
			p = strtol(optarg, NULL, 10);
			assert(p > 0 && p <= 2147483647);
			break;  
			case 's':  
			printf("seed: %s\n", optarg);
			seed = strtol(optarg, NULL, 10);
			break;
			case 'n':  
			printf("threads number: %s\n", optarg);
			n_threads = strtol(optarg, NULL, 10);
			break;  
			case 'i':  
			printf("max. iterations: %s\n", optarg);
			max_iters = strtol(optarg, NULL, 10);
			break;  
			case ':':  
			printf("option -%c needs a value\n", optopt);  
			break;  
			case '?':  
			fprintf(stderr, "Usage: %s [-p <vector size>] [-s <seed>] [-n <threads number>]\n", argv[0]);
			exit(EXIT_FAILURE);
		}  
	}  
	srand(seed);

	printf("p = %d, seed = %d, n_threads = %d, max_iters = %d\n", \
	 p, seed, n_threads, max_iters);	

	// initializing data
	X = (double*) malloc(sizeof(double) * p);
	Y = (double*) malloc(sizeof(double) * p);
	Y_avgs = (double*) malloc(sizeof(double) * max_iters);

	for(i = 0; i < p; i++){
		X[i] = (double)rand() / RAND_MAX;
		Y[i] = (double)rand() / RAND_MAX;
	}
	for(i = 0; i < max_iters; i++){
		Y_avgs[i] = 0.0;
	}
	a = (double)rand() / RAND_MAX;

#ifdef DEBUG
	printf("vector X= [ ");
	for(i = 0; i < p-1; i++){
		printf("%f, ",X[i]);
	}
	printf("%f ]\n",X[p-1]);

	printf("vector Y= [ ");
	for(i = 0; i < p-1; i++){
		printf("%f, ", Y[i]);
	}
	printf("%f ]\n", Y[p-1]);

	printf("a= %f \n", a);	
#endif

	/*
	 *	Function to parallelize 
	 */
	gettimeofday(&t_start, NULL);


	//SAXPY iterative SAXPY mfunction
	//Arreglo de hilos y parametros
	pthread_t threadArr[n_threads];
	param_t paramArr[n_threads];
	pthread_mutex_init(&mutex, NULL);

	//crear hilos
	for(i = 0; i < n_threads; i++){

		paramArr[i].init = (p / n_threads) * i;
		paramArr[i].end = (p / n_threads) * (i + 1);
		if(i == n_threads-1){
			paramArr[i].end = p;
		}
		pthread_create(&threadArr[i],NULL,&saxpy,&paramArr[i]);	
	}

	//join hilos
	for(i = 0; i < n_threads; i++){

		pthread_join(threadArr[i],NULL);
	}

	pthread_mutex_destroy(&mutex);

	gettimeofday(&t_end, NULL);

#ifdef DEBUG
	printf("RES: final vector Y= [ ");
	for(i = 0; i < p-1; i++){
		printf("%f, ", Y[i]);
	}
	printf("%f ]\n", Y[p-1]);
#endif
	
	// Computing execution time
	exec_time = (t_end.tv_sec - t_start.tv_sec) * 1000.0;  // sec to ms
	exec_time += (t_end.tv_usec - t_start.tv_usec) / 1000.0; // us to ms
	printf("Execution time: %f ms \n", exec_time);
	printf("Last 3 values of Y: %f, %f, %f \n", Y[p-3], Y[p-2], Y[p-1]);
	printf("Last 3 values of Y_avgs: %f, %f, %f \n", Y_avgs[max_iters-3], Y_avgs[max_iters-2], Y_avgs[max_iters-1]);
	return 0;
}

void* saxpy(void * arg){
	
	param_t* param =(param_t *) arg;

	int init = param->init;
	int end = param->end;
	int i;
	double acc;
	int it;
	for(it=0;it<max_iters;it++){

		acc=0;
		for(i = init; i < end; i++){
			Y[i] = Y[i] + a * X[i];
			acc += Y[i];
		}
		pthread_mutex_lock(&mutex);
		Y_avgs[it] += (acc/p); //Critical section?
		pthread_mutex_unlock(&mutex);
	}


	return NULL;
}

// Anotaciones, se puede crear una función para el ciclo interno o toda una función con ambos ciclos
// Existe un costo por crear los hilos, por lo que no se recomienda crear un hilo en cada iteración
// Pasos
// 1)Crear una función que le será asignada a cada hilo void* compute (void*)
// 2)Ajustar los parámetros de la función con una estructura
// 3)Dentro de la función castear los parámetros y asignarlo a variables auxiliares ->
// 4)Hacer visibles Y,a,X,Y_avgs, además de todos los flags que recibe el programa
