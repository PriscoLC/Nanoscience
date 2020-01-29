#include <iostream>
#include <fstream>
#include <math.h>
#include <complex>
#include <Eigen/Eigenvalues> 

#define PI acos(-1)

//using cgs units everywhere

const long double mass_unit = 1.67*pow(10,-24); //m_p = 1

const long double m_As = 74.921*mass_unit;
const long double m_Ga = 69.723*mass_unit;
const long double m_Al = 26.98*mass_unit;

const double k_Ga = 90860; // dyn/cm 
const double k_Al = 94723; 
const double k_Ga_Al = 8142; //average between Ga-Ga and Al-Al
const double k_As_As = 14346;

const int n_step = 200; //number of bins in k space

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
		C(2*(k_Ga+k_Ga_Al)/m_Ga,0), C(-k_Ga/m_Ga,0), C(0,0), C(0,0),
		C(-k_Ga/m_As,0), C((k_Ga+k_Al+2*k_As_As)/m_As,0), C(-k_Al/m_As,0), C(0,0),
		C(0,0), C(-k_Al/m_Al,0), C(2*(k_Al+k_Ga_Al)/m_Al,0), C(-k_Al/m_Al,0),
		C(0,0), C(0,0), C(-k_Al/m_As,0),C((k_Ga+k_Al+2*k_As_As)/m_As,0); 


	Eigen::ComplexEigenSolver<Eigen::MatrixXcd> ces;

	ces.compute(a);

	std::ofstream out1 ("autovettori_Gamma_secondi.txt");
	std::ofstream out2 ("out.txt");

	double cappa;


	for (double step = -n_step/2; step <= n_step/2 ; step++) {

		cappa = 2*PI*step/n_step;

		out2 << cappa/PI << "	";


		a(0,2) = C(-k_Ga_Al*(1 + cos(cappa))/m_Ga,k_Ga_Al*sin(cappa)/m_Ga);
		a(0,3) = C(-k_Ga*cos(cappa)/m_Ga,k_Ga*sin(cappa)/m_Ga);
		a(1,3) = C(-k_As_As*(1 + cos(cappa))/m_As,k_As_As*sin(cappa)/m_As);
		a(2,0) = C(-k_Ga_Al*(1 + cos(cappa))/m_Al,-k_Ga_Al*sin(cappa)/m_Al);
		a(3,0) = C(-k_Ga*cos(cappa)/m_As,-k_Ga*sin(cappa)/m_As);
		a(3,1) = C(-k_As_As*(1 + cos(cappa))/m_As,-k_As_As*sin(cappa)/m_As);

		ces.compute(a);

		if ( step == 0) {

			out1 << ces.eigenvectors() << std::endl;
		//	double temp = 0;
		//	double rel_err = 0;
		//	Eigen::VectorXcd b(m);


		//	for (int i = 0; i < 4; i++) { // find maximum relative error (in euclidean norm)

		//		b =  ces.eigenvectors().col(i); 

		//		temp  = (a*b - ces.eigenvalues()[i]*b).norm() / (b.norm());
		//		rel_err = temp>rel_err? temp : rel_err;
		//	}

	//		std::cout << rel_err << std::endl; 
		}

		for (int i = 0; i < m; i++) {

			temp_array[i] =	(sqrt(ces.eigenvalues()[i].real()))/(6*PI*pow(10,10)); // denominator is 2pi*c, to go from angular frequency to cm^-1
		}

		selectionSort(temp_array,m);


		for (int i = 0; i < m ; i++) {

			out2 << temp_array[i] << "	";

		}

		out2 << std::endl;

	}
	return 0;
}
