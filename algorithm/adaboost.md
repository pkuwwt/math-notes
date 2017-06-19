
# AdaBoost

## Algorithm

Given $$N$$ samples $$\{x_i\}$$ and labels $$\{y_i\}$$, 

  1. Initialize the observation weights $$w_i = 1/N, i=1,2,\cdots,N$$,
  2. For $$m=1$$ to $$M$$:
    a. Fit a classifier $$G_m(x)$$ to the training data using weights $$w_i$$.
    b. Compute 
$$
	err_m = \frac{\sum_{i=1}^Nw_i 1(y_i\neq G_m(x_i))}{\sum_{i=1}^Nw_i}.
$$
    c. Compute $$\alpha_m = \log((1-err_m)/err_m)$$.
    d. Set $$w_i\gets w_i\cdot\exp[\alpha_m\cdot 1(y_i\neq G_m(x_i))],\,i=1,2,3\cdots,N$$.
  3. Output $$G(x)=\mathop{sign}\left[\sum_{m=1}^M\alpha G_m(x)\right]$$.

## Reference

  * Trevor Hastie, Robert Tibshirani, Jerome Friedman. Elements of Statistical Learning.

