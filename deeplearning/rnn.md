
# Recurrent Neural Network

## Definition

For a sequence $$\{x_t\}$$ and corresponding hidden states $$\{s_t\}$$, a Recurrent Neural Network (RNN) is defined as

$$
\begin{array}{rcl}
s_t &=& \tanh(Ux_t + Ws_{t-1}) \\
\hat y_t &=& \mathop{softmax}(Vs_t).
\end{array}
$$

where $$U,V,W$$ are coefficient matrices, $$x_t,s_t,\hat y_t$$ are vectors, and $$\hat y_t$$ is the predicted output at time $$t$$ with respect to the expected output $$y_t$$.

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
\begin{aligned}
\frac{\partial E_t}{\partial V} &= \frac{\partial E_t}{\partial\hat y_t}\frac{\partial\hat y_j}{\partial V} \\
		&= \frac{\partial E_t}{\partial\hat y_t}\frac{\partial\hat y_t}{\partial z_t}\otimes\frac{\partial z_t}{\partial V} & (z_t=Vs_t)\\
		&= -\frac{y_t^T}{\hat y_t^T}\left(\mathop{diag} \hat y_t - \hat y_t\hat y_t^T\right)\otimes s_t &\frac{\cdot}{\cdot}\text{~is element-wise}\\
		&= (\sum_i(y_t^{(i)})\hat y_t^T-y_t^T)\otimes s_t \\
		&= (\hat y_t^T-y_t^T)\otimes s_t & y_t\text{~is an one-hot vector, i.e. the only nonzero element is 1}
\end{aligned}
$$

So $$\frac{\partial E_t}{\partial V}$$ only depends on information at time $$t$$, which is not true for matrices $$U$$ and $$W$$.

### Matrix $$U$$

We can compute $$\frac{\partial E_t}{\partial U}$$ as

$$
\begin{aligned}
\frac{\partial E_t}{\partial U} &= \frac{\partial E_t}{\partial\hat y_t}\frac{\partial\hat y_t}{\partial s_t}\frac{\partial s_t}{\partial U} \\
		&= \frac{\partial E_t}{\partial\hat y_t}\frac{\partial\hat y_t}{\partial s_t}\frac{\partial s_t}{\partial z_t}\otimes x_t & z_t=Ux_t+Ws_{t-1}
\end{aligned}
$$

### Matrix $$W$$

### Algorithm

```python
def bptt(self, x, y):
	T = len(y)
	o, s= self.forward_propagation(x,y)
	dLdU = np.zeros(self.U.shape)
	dLdV = np.zeros(self.V.shape)
	dLdW = np.zeros(self.W.shape)
	delta_o = o
	delta_o[np.arange(len(y)), y) -= 1
	for t in np.arange(T)[::-1]:
		dLdV += np.outer(delta_o[t], s[t].T)
		delta_t = self.V.T.dot(delta_o[t]) * (1-(s[t]**2))
		for bptt_step in np.arange(max(0, t-self.bptt_truncate), t+1)[::-1]:
			dLdW += np.outer(delta_t, s[bptt_step-1])
			dLdU[:, x[bptt_step]] += delta_t
			delta_t = self.W.T.dot(delta_t) * (1-s[bptt_step-1]**2)
	return [dLdU, dLdV, dLdW]
```
