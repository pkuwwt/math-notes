
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

### $$L^2$$ Parameter Regularization

### $$L^1$$ Parameter Regularization

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
