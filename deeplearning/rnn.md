
# Recurrent Neural Network

## Definition

For a sequence $$\{x_t\}$$ and corresponding hidden states $$\{s_t\}$$, a Recurrent Neural Network (RNN) is defined as

$$
\begin{array}{rcl}
s_t &=& \tanh(Ux_t + Ws_{t-1}) \\
\hat y_t &=& \mathop{softmax}(Vs_t).
\end{array}
$$

where $$U,V,W$$ are coefficient matrices, $$x_t,s_t,\hat y_t$$ are vectors, and $$\hat y_t$$ is the predicted output at time $$t$$.

To train a RNN from $$\{x_t\}$$ and expected outputs $$\{y_t\}$$, we use back-propagation to refine those coefficient matrices $$U,V,W$$.

The loss function is defined
$$
\begin{array}{rcl}
E(y,\hat y) &=& \sum_t E_t(y_t,\hat y_t) \\
E_t(y_t,\hat y_t) &=& -y_t\cdot\log\hat y_t.
\end{array}
$$

## Back-propagation

### Matrix $$V$$

Because $$E=\sum_t E_t$$, we have
$$
\frac{\partial E}{\partial V} = \sum_t\frac{\partial E_t}{\partial V}.
$$

We can compute $$\frac{\partial E_i}{\partial V}$$ as

$$
\begin{array}{rcl}
\frac{\partial E_t}{\partial V} &=& \frac{\partial E_t}{\partial\hat y_t}\frac{\partial\hat y_j}{\partial V} \\
		&=& \frac{\partial E_t}{\partial\hat y_t}\frac{\partial\hat y_t}{\partial z_t}\otimes\frac{\partial z_t}{\partial V} \quad\quad (z_t=Vs_t)\\
		&=& -\frac{y_t^T}{\hat y_t^T}\left(\mathop{diag} \hat y_t - \hat y_t\hat y_t^T\right)\otimes s_t \quad\quad\frac{\cdot}{\cdot}\text{~is element-wise}\\
		&=& (\sum_i(y_t^{(i)})\hat y_t^T-y_t^T)\otimes s_t \\
		&=& (\hat y_t^T-y_t^T)\otimes s_t \quad\quad y_t\text{~is an one-shot vector, i.e. the only nonzero element is 1}
		
\end{array}
$$

### Matrix $$U$$
