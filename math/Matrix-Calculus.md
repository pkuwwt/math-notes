# Matrix Calculus

[http://www.psi.toronto.edu/matrix/calculus.html]()

## Notation

  * $$d/dx(\mathbf{y})$$ is a vector whose $$i$$-element is $$d\mathbf{y}_i/dx$$
  * $$d/d\mathbf{x}$$ is a vector whose $$i$$-element is $$dy/d\mathbf{x}_i$$
  * $$d/d\mathbf{x}(\mathbf{y}^T)$$ is a matrix whose $$(i,j)$$-element is $$d\mathbf{y}_j/d\mathbf{x}_i$$
  * $$d/dx(\mathbf{Y})$$ is a matrix whose $$(i,j)$$-element is $$d\mathbf{Y}_{ij}/dx$$
  * $$d/d\mathbf{X}(y)$$ is a matrix whose $$(i,j)$$-element is $$dy/d\mathbf{X}_{ij}$$

Note that the Hermitan transpose is not used because complex conjugates are not analytic.

In the expressions below matrices and vectors $$A,B,C$$ do not depend on $$X$$.

## Derivatives of Linear Products

  * $$d/dx(A\mathbf{Y}B) = A*d/dx(\mathbf{Y}) * B$$
    * $$d/d\mathbf{x}(A\mathbf{y}) = A*d/d\mathbf{x}(\mathbf{y})$$
  * $$d/dx(\mathbf{x}^TA)=A$$
    * $$d/d\mathbf{x}(\mathbf{x}^T)=I$$
	* $$d/d\mathbf{x}(\mathbf{x}^T\mathbf{a})=d/d\mathbf{x}(\mathbf{a}^T\mathbf{x})=\mathbf{a}$$
  * $$d/d\mathbf{X}(\mathbf{a}^T\mathbf{X}\mathbf{b})=\mathbf{a}\mathbf{b}^T$$
    * $$d/d\mathbf{X}(\mathbf{a}^T\mathbf{X}\mathbf{a})=\mathbf{a}\mathbf{a}^T$$
  * $$d/d\mathbf{X}(\mathbf{a}^T\mathbf{X}^T\mathbf{b})=\mathbf{b}\mathbf{a}^T$$
  * $$d/dx(\mathbf{Y}\mathbf{Z})=\mathbf{Y}*d/dx(\mathbf{Z})+d/dx(\mathbf{Y})*\mathbf{Z}$$

## Derivatives of Quadratic Products

  * $$d/d\Bx(A\Bx+\Bb)^TC(D\Bx+\Be)=A^TC(D\Bx+\Be)+D^TC^T(A\Bx+\Bb)$$
    * $$d/d\Bx(\Bx^TC\Bx)=(C+C^T)\Bx$$
	  * Symmetric $$C$$: $$d/d\Bx(\Bx^TC\Bx)=2C\Bx$$
	  * $$d/d\Bx(\Bx^T\Bx)=2\Bx$$
	* $$d/d\Bx(A\Bx+\Bb)^T(D\Bx+\Be)=A^T(D\Bx+\Be)+D^T(A\Bx+\Bb)$$
	  * $$d/d\Bx(A\Bx+\Bb)^T(A\Bx+\Bb)=2A^T(A\Bx+\Bb)$$
	* Symmetric $$C$$: $$d/d\Bx(A\Bx+\Bb)^TC(A\Bx+\Bb)=2A^TC(A\Bx+\Bb)$$
  * $$d/d\BX(\Ba^T\BX^T\BX\Bb)= \BX(\Ba\Bb^T+\Bb\Ba^T)$$
    * $$d/d\BX(\Ba^T\BX^T\BX\Ba)=2\BX\Ba\Ba^T$$
  * $$d/d\BX(\Ba^T\BX^TC\BX\Bb)=C^T\BX\Ba\Bb^T+C\BX\Bb\Ba^T$$
    * $$d/d\BX(\Ba^T\BX^TC\BX\Ba)=(C+C^T)\BX\Ba\Ba^T$$
	* Symmetric $$C$$: $$d/d\BX(\Ba^T\BX^TC\BX\Ba)=2C\BX\Ba\Ba^T$$
  * $$d/d\BX(\BX\Ba+\Bb)^TC(\BX\Ba+\Bb) = (C+C^T)(\BX\Ba+\Bb)\Ba^T$$

## Derivatives of Cubic Products

  * $$d/d\Bx(\Bx^TA\Bx\Bx^T)=(A+A^T)\Bx\Bx^T+\Bx^TA\Bx I$$

## Derivatives of Inverses

  * $$d/dx(\BY^{-1})=-\BY^{-1}d/dx(\BY)\BY^{-1}$$

## Derivatives of Trace

  * $$d/d\BX(tr(\BX))=I$$
  * $$d/d\BX(tr(\BX^k))=k(\BX^{k-1})^T$$
  * $$d/d\BX(tr(A\BX^k))=\sum_{r=0}^{k-1}(\BX^rA\BX^{k-r-1})^T$$
  * $$d/d\BX(tr(A\BX^{-1}B))=-(\BX^{-1}BA\BX^{-1})^T$$
    * $$d/d\BX(tr(A\BX^{-1}))=d/d\BX(tr(\BX^{-1}A))=-\BX^{-T}A^T\BX^{-T}$$
  * $$d/d\BX(tr(A^T\BX B^T))=d/d\BX(tr(B\BX^TA))=AB$$
    * $$d/d\BX(tr(\BX A^T))=d/d\BX(tr(A^T\BX))=d/d\BX(tr(\BX^TA))=d/d\BX(tr(A\BX^T))=A$$
  * $$d/d\BX(tr(A\BX B\BX^T))=A^T\BX B^T+A\BX B$$
    * $$d/d\BX(tr(\BX A\BX^T))=\BX(A+A^T)$$
    * $$d/d\BX(tr(\BX^T A\BX))=\BX^T(A+A^T)$$
    * $$d/d\BX(tr(A\BX^T\BX))=(A+A^T)\BX$$
  * $$d/d\BX(tr(A\BXB\BX))=A^T\BX^TB^T + B^T\BX^TA^T$$
  * Symmetric $$C$$: $$d/d\BX(tr((\BX^TC\BX)^{-1}A))=d/d\BX(tr(A(\BX^TC\BX)^{-1}))=-(C\BX(\BX^TC\BX)^{-1})(A+A^T)(\BX^TC\BX)^{-1}$$
  * Symmetric $$B,C$$: $$d/d\BX (tr((\BX^TC\BX)^{-1}(\BX^TB\BX))) = d/d\BX (tr((\BX^TB\BX)(\BX^TC\BX)^{-1})) = -2(C\BX(\BX^TC\BX)^{-1})\BX^TB\BX(\BX^TC\BX)^{-1} + 2B\BX(\BX^TC\BX)^{-1}$$

## Derivatives of Determinant

  * $$d/d\BX(\det(\BX))=d/d\BX(\det(\BX^T))=\det(\BX)*\BX^{-T}$$
    * $$d/d\BX(\det(A\BXB))=\det(A\BXB)*\BX^{-T}$$
    * $$d/d\BX(\ln\det(A\BXB))=\BX^{-T}$$
  * $$d/d\BX(\det(\BX^k)) = k*\det(\BX^k)*\BX^{-T}$$
    * $$d/dX(\ln\det(\BX^k))=k\BX^{-T}$$
  * Real: $$d/d\BX(\det(\BX^TC\BX))=\det(\BX^TC\BX)*(C+C^T)\BX(\BX^TC\BX)^{-1}$$
    * Real Symmetric $$C$$: $$d/d\BX(\det(\BX^TC\BX))=2\det(\BX^TC\BX)*C\BX(\BX^TC\BX)^{-1}$$
  * Real Symmetric $$C$$: $$d/d\BX(\ln\det(\BX^TC\BX))=2C\BX(\BX^TC\BX)^{-1}$$

## Jacobian

  * Jacobian matrix of $$\By$$ respect to $$\Bx$$: $$d\By^T/d\Bx$$
  * The abosolute value of determinant of Jacobian is the ratio between the volume of hyper-volumes $$d\By$$ and $$d\Bx$$: $$\int f(\By)d\By = \int f(\By(\Bx))\Vert d\By^T/d\Bx\Vert d\Bx$$

## Hessian matrix
  * Hessian matrix of $$f(\Bx)$$: $$Hf(\Bx)=d^2f/d\Bx^2=d/d\Bx^T(df(d\Bx)$$
  * Hessian matrix $$Hf(\Bx)=\mathbf{0}$$ means $$\Bx$$ is a critical point, and Hessian being positive definite, negative definite or indefinite corresponds to minimum, maximum or saddle point accordingly
  * $$H(\Ba^T\Bx)=0$$
  * $$H(A\Bx+\Bb)^TC(D\Bx+\Be)=A^TCD+D^TC^TA$$
    * $$H(\Bx^TC\Bx)=C+C^T$$
	  * $$H(\Bx^T\Bx)=2I$$
	* $$H(A\Bx+\Bb)^T(D\Bx+\Be)=A^TD+D^TA$$
	  * $$H(A\Bx+\Bb)^T(A\Bx+\Bb)=2A^TA$$
	* Symmetric $$C$$: $$H(A\Bx+\Bb)^TC(A\Bx+\Bb)=2A^TCA$$


## Applications

### Least Square Regression
For $$m$$ random sample $$\Bx_i\in\bR^n,i=0,1,\cdots,m-1$$ and corresponding $$y_i\in\bR$$, we want to model it linearly with

$$
y = \Bx^T\Bw + b
$$

or simply

$$
y = \tilde\Bx^T\tilde\Bw,\quad \tilde\Bx=\binom{\Bx}{1},\tilde\Bw=\binom{\Bw}{b}.
$$

If we choose L2-norm as the loss function, this becomes an optimization problem

$$
\tilde\Bw^* = \mathop{argmin}\limits_{\tilde\Bw}\sum_{i=0}^{m-1}\Vert y_i-(\tilde\Bx_i^T\tilde\Bw)\Vert^2 = \mathop{argmin}\limits_{\tilde\Bw}J(\tilde\Bw).
$$

By expanding the objection function

$$
\begin{array}{rcl}
J(\tilde\Bw) &=& \sum\Vert y_i-(\tilde\Bx_i^T\tilde\Bw) \Vert^2 \\
			   &=& \sum(y_i^2-2y_i(\tilde\Bx_i^T\tilde\Bw)+(\tilde\Bx_i^T\tilde\Bw)^2) \\
\end{array}
$$

we get the derivative

$$
\frac{dJ}{d\tilde\Bw} = \sum(2(\tilde\Bx_i^T\tilde\Bw)\tilde\Bx_i-2y_i\tilde\Bx_i = 
2\left(\sum(\tilde\Bx_i\tilde\Bx_i^T)\right)\tilde\Bw - 2\sum(y_i\tilde\Bx_i) 
$$

The critical point is

$$
\tilde\Bw^* = \left(\sum(\tilde\Bx_i\tilde\Bx_i^T)\right)^{-1}\sum(y_i\tilde\Bx_i) = (\tilde X\tilde X^T)^{-1}\tilde X\By.
$$

where

$$
X=[\Bx_1,\Bx_2,\cdots,\Bx_m],\quad \tilde X = \begin{bmatrix}\Bx_1&\Bx_2&\cdots&\Bx_m\\1&1&\cdots&1\end{bmatrix}=\begin{bmatrix}X\\\mathbf{1}_m^T\end{bmatrix},\quad \By=(y_1,y_2,\cdots,y_m)^T.
$$

### Principal Component Analysis
