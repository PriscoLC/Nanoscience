#include <iostream>
#include <fstream>
#include <math.h>
#include <complex>
#include <Eigen/Eigenvalues> 

#define PI acos(-1)


const double m_As = 33;
const double m_Ga = 31;
const double m_Al = 13;

const double k_Ga = 0.90860;
const double k_Al = 0.94723;

const int n_step = 500; //number of bins in k space

void selectionSort(double a[], int n) {
	int i, j, min;
	double temp;
	for (i = 0; i < n - 1; i++) {
		min = i;
		for (j = i + 1; j < n; j++)
			if (a[j] < a[min])
				min = j;
		temp = a[i];
		a[i] = a[min];
		a[min] = temp;
	}
}

int main()
{

	const int m = 4;
	Eigen::MatrixXcd a(m, m);
	typedef std::complex<double> C;
	double temp_array[m];

	a <<
		C(2*k_Ga/m_Ga,0), C(0,0), C(-k_Ga/m_Ga,0), C(0,0),
		C(0,0), C(2*k_Al/m_Al,0), C(-k_Al/m_Al,0), C(-k_Al/m_Al,0),
		C(-k_Ga/m_As,0), C(-k_Al/m_As,0), C((k_Ga+k_Al)/m_As,0), C(0,0),
		C(0,0), C(-k_Al/m_As,0), C(0,0), C((k_Al+k_Ga)/m_As,0);


	Eigen::ComplexEigenSolver<Eigen::MatrixXcd> ces;

	ces.compute(a);

	std::ofstream out1 ("autovettori_Gamma.txt");
	std::ofstream out2 ("out.txt");

	double cappa;


	for (int step = -n_step/2; step <= n_step/2 ; step++) {

		cappa = PI*step/n_step;

		out2 << cappa << "	";


		a(0,3) = C(-k_Ga*cos(PI*step/n_step)/m_Ga,k_Ga*sin(PI*step/n_step)/m_Ga);
		a(3,0) = C(-k_Ga*cos(PI*step/n_step)/m_As,-k_Ga*sin(PI*step/n_step)/m_As);

		ces.compute(a);

		if ( step == 0) {

			double temp = 0;
			double rel_err = 0;
			Eigen::VectorXcd b(m);

			out1 << ces.eigenvectors() << std::endl;

			for (int i = 0; i < 4; i++) { // find maximum relative error (in euclidean norm)

				b =  ces.eigenvectors().col(i); 

				temp  = (a*b - ces.eigenvalues()[i]*b).norm() / b.norm();
				rel_err = temp>rel_err? temp : rel_err;
			}

			std::cout << rel_err << std::endl; 
		}

		for (int i = 0; i<m; i++) {

			temp_array[i] =sqrt(ces.eigenvalues()[i].real());
		}

		selectionSort(temp_array,m);


		for (int i = 0; i< m ; i++) {

			out2 << temp_array[i] << "	";

		}

		out2 << std::endl;

	}
	return 0;
}
