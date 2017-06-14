
# A Survey of Transfer Learning

  * Author: Sinno Jialin Pan, Qiang Yang
  * Year: 2009
  * Keywords: Transfer Learning, Survey, Machine Learning Data Mining
  * Abstract: 
    * Assumption (training and future data in the same feature space) usually not hold
	* Transfer learning can avoid expensive data labeling efforts
	* This survey focuses on **categorizing** and **reviewing** current progress on transfer learning for **classification**, **regression** and **clustering** problem
	* Transfer learning vs. domain adaption/multi-task learning/sample selection bias/co-variate shift

## Introduction

  * Three examples:
    1. Web document classification: different websites
	2. Indoor WiFi localization: different time periods, different devices
	3. Sentiment classification (Product review): lacking enough labels for some products
  * Focus on classification, regression and clustering, not reinforcement learning

## Overview

### A Brief History of Transfer Learning

  * 1995, NIPS-95 workshop "Learning to learn"
  * Different alias: learning to learn, life-long learning, knowledge transfer, inductive transfer, multi-task learning, knowledge consolidation, context-sensitive learning, knowledge-based inductive bias, meta learning, incremental/cumulative learning
  * Most related: multi-task learning
  * 2005, BAA 05-29 of DARPA's IPTO gave a definition of transfer learning: the ability of a system to recognize and apply knowledge and skills learned in previous tasks to novel tasks
    * transfer learning vs. multi-task learning: one-way vs. bidirection
	* transfer learning vs. traditional learning: knowledge transfer vs. learning from scratch
	* research communities: data mining, machine learning, app of machine learning and data mining

### Notations and Definitions

  * Domain $$\mathcal{D}=\{\mathcal{X}, P(X)\}$$
    * $$\mathcal{X}$$ is a feature space
	* $$P(X)$$ is a marginal probability distribution
	* $$X=\{x_1,\cdots,x_n\}\in\mathcal{X}$$
  * Task $$\mathcal{T}=\{\mathcal{Y},f(\cdot)\}$$
    * trainning data: $$\{(x_i,y_i)\}$$, $$x_i\in X,y_i\in\mathcal{Y}$$
    * $$y=f(x)=P(y\mid x)$$
  * Source Domain $$D_S=\{(x_{S_i},y_{S_i})\}$$, $$x_{S_i}\in\mathcal{X}_S,y_{S_i}\in\mathcal{Y}_S$$
  * Target Domain $$D_T=\{(x_{T_i},y_{T_i})\}$$, $$x_{T_i}\in\mathcal{X}_T,y_{T_i}\in\mathcal{Y}_T$$
  * Some cases:
    1. $$\mathcal{X}_S\neq\mathcal{X}_T$$, $$P(X_S)=P(X_T)$$: e.g. different language, same documents
    2. $$\mathcal{X}_S=\mathcal{X}_T$$, $$P(X_S)\neq P(X_T)$$: e.g. same language, different topics
	3. $$\mathcal{Y}_S\neq\mathcal{Y}_T$$: e.g. binary classification, multi-class classification
	4. $$P(Y_S\mid X_S)\neq P(Y_T\mid X_T)$$: e.g. very unbalanced distribution

### A Categorization of Transfer Learning Techniques

  * main research issue: What/How/When to transfer
    * What: transfer which part of knowledge, then HOW to transfer
    * When: avoid _negative transfer_ for unrelated domains
  * categorization: inductive/transductive/unsupervised transfer learning

## Inductive Transfer Learning

### Transferring Knowledge of Instances

### Transferring Knowledge of Feature Representations

### Transferring Knowledge of Parameters

### Transferring Relational Knowledge

## Transductive Transferring Learning

### Transferring the Knowledge of Instances

### Transferring Knowledge of Feature Representations

## Unsupervised Transfer Learning

## Transfer Bounds and Negative Transfer

## Applications of Transfer Learning

