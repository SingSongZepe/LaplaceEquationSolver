# Brief description to the solver designing

### overview

This solver is used to solve laplace's equation, using Jacobi iteration method.

the core is the following formula:

$u_{i,j}^{(k+1)}=\frac{1}{4}(u_{i-1,j}^{(k)}+u_{i+1,j}^{(k)}+u_{i,j-1}^{(k)}+u_{i,j+1}^{(k)})$

We know the right hand value as Dirichlet Boundary Condition stored in txt file "bdry_Values_?.txt", and we only update those points that in ROI (region of interest), stored in "ROI_?.txt".

We start with "main.m" file, and call other function to solve the PDE to get numerical solution.

### functions

- `iterate_method_A.m`

> implement Jacobi iteration method of the method A required.

- `iterate_method_B.m`

> implement Jacobi iteration method of the method B required.

- `plot_grid.m`

> give the matrix and visualise it in graph.

- read_file.m

> read data from txt files, like "ROI_1.txt", "bdry_Values_2.txt" into matlab variables.



### relationship of parts

code in "main.m" calls all the other functions, and other functions do not call each other. That makes code more decoupling, and easy to understand and pretty.



### structure chart

![](structure_chart.png)



### result sample of code

I make a half-circle ROI and it's boundary value condition. And by running my code, got such a sample of work.

![](sample.png)
