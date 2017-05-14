
# Regularization for Deep Learning

  * regularization: any modification we make to a learning algorithm that is intended to reduce its generalization error but not its training error
  * strategies of regularization: 
    * extra constraints, e.g. restrictions on parameter values
	* extra terms in the objectionve function, soft constraints on parameter values
	* used to encode specific kind of prior knowledge
	* designed to express a generic preference for a simpler model class in order to promote generalization
	* make an underdetermined problem determined
	* ensemble methods, combine multiple hypotheses that explain the training data
  * regularizing estimator: trading increased bias for reduced variance. Goal of regularization is to transform the 3rd situation to 2nd situation
    1. excluded the true data generating process, corresponding to underfitting and inducing bias
	2. mathed the true data generating process
	3. included the generating process but also many other possible generating processes

## Parameter Norm Penalties

  * Regularized objective function

$$
\begin{array}{rcl}
\tilde J(\theta;X,y) &=& J(\theta;X,y)+\alpha\Omega(\theta), \quad\alpha\in[0,\infty) \\
\tilde J(\Bw,\Bb;X,y) &=& J(\Bw,\Bb;X,y)+\alpha\Omega(\Bw) 
\end{array}
$$

### $$L^2$$ Parameter Regularization

  * weight decay, ridge regression or Tikhonov regularization

$$
\tilde J(\Bw;X,y) = J(\Bw;X,y) + \frac\alpha2\Bw^T\Bw
$$

  * gradient update

$$
\begin{array}{rcl}
\nabla_\Bw\tilde J &=& \alpha\Bw + \nabla_\Bw J \\
\Bw &\leftarrow& \Bw-\epsilon\nabla_\Bw\tilde J = (1-\epsilon\alpha)\Bw - \epsilon\nabla_\Bw J
\end{array}
$$

  * approxmation of $$\tilde J$$, $$\Bw^*$$ the minimum, $$H$$ positive semidefinite

$$
\hat J(\Bw) = J(\Bw^*) + \frac12(\Bw-\Bw^*)^TH(\Bw-\Bw^*)
$$

  * gradient of $$\hat J$$

$$
\nabla_\Bw\hat J(\Bw) = H(\Bw-\Bw^*)\to0 \Longrightarrow \tilde\Bw=(H+\alpha I)^{-1}H\Bw^*
$$

  * By eigen-decomposition $$H=Q\Lambda Q^T$$, where $$\Lambda$$ diagonal

$$
\tilde\Bw = Q(\Lambda+\alpha I)^{-1}\Lambda Q^T\Bw^*
$$

  * Scale factor along $$i$$-th eigenvector $$\frac{\lambda_i}{\lambda_i+\alpha}$$
  * effects: rule out small $$\lambda_i$$ so that the contour ellipsoids of $$J(\Bw)$$ becomes rounder

### $$L^1$$ Parameter Regularization

  * $$L^1$$ regularization

$$
\tilde J(\Bw;X,\By) = J(\Bw; X,\By) + \alpha\lVert\Bw\rVert_1
$$

## Norm Penalties as Constrained Optimization

## Regularization and Under-Constrained Problems

## Dataset Augmentation

## Noise Robustness

## Semi-Supervised Learning

## Multi-Task Learning

## Early Stopping

## Parameter Tying and Parameter Sharing

## Sparse Representation

## Bagging and Other Ensemble Methods

## Dropout

## Adversarial Training

## Tangent Distance, Tangent Prop, and Manifold Tangent Classifier
