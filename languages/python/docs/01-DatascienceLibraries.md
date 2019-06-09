# Description: Python Libraries for Data Science

### Core Libraries & Statistics
* [Numpy]()
    - A library for large multi-dimensional array and matrix processing and a large collection of high-level 
      mathematical functions.
    - Useful for fundamental scientific computations in Machine Learning, and particularly useful for linear algebra, 
      Fourier transform, and random number capabilities.
* [Scipy]()
    - A library for Machine Learning and contains different modules for optimization, linear algebra, integration and 
      statistics. 
    - SciPy library is different from SciPy stack. The SciPy is one of the core packages in SciPy stack. 
    - SciPy is also very useful for image manipulation.
* [Pandas]()
    - A popular library that provides high-level data structures and wide variety tools for data analysis.
    - It provides many inbuilt methods for groping, combining and filtering data.
    - It mainly used for data extraction and preparation before applying machine learning algorithms. 
* [Statsmodels]()
    - A library that provides statistical data analysis, such as statistical models estimation, performing statistical 
      tests, etc. 
    - It's used to implement many machine learning methods and explore different plotting possibilities.
* [SymPy]()
    - A library for symbolic math. 
    - SymPy is a full-fledged Computer Algebra System (CAS) with very simple, comprehensible extensible code. 
    - It is written in Python, and hence does not need external libraries.

### Visualisation
* [Matplotlib]()
    - A very popular Python library for data visualization. It is a 2D plotting library used for creating 2D graphs and 
      plots.
    - It can be used to visualize the patterns in the data.  
    - A module named pyplot makes it easy for programmers for plotting as it provides features to control line styles, 
      font properties, formatting axes, etc. It provides various kinds of graphs and plots for data visualization, viz., 
      histogram, error charts, bar chats, etc.
* [Seaborn]()
    - Seaborn is essentially a higher-level API based on the matplotlib library and contains more suitable default 
      settings for processing charts. 
    - There is a rich gallery of visualizations including some complex types like time series, jointplots, and violin 
      diagrams.
* [Plotly]()
    - Plotly is a popular library that allows you to build sophisticated graphics easily.
    - The package is adapted to work in interactive web applications.
    - Among its remarkable visualizations are contour graphics, ternary plots, and 3D charts.
* [Bokeh]()
    - The Bokeh library creates interactive and scalable visualizations in a browser using JavaScript widgets.
    - The library provides a versatile collection of graphs, styling possibilities, interaction abilities in the form 
      of linking plots, adding widgets, and defining callbacks, and many more useful features.
* [Pydot]()
    - Pydot is a library for generating complex oriented and non-oriented graphs. 
    - It is an interface to Graphviz, written in pure Python. With its help, it is possible to show the structure of 
      graphs, which are very often needed when building neural networks and decision trees based algorithms.

### Machine Learning
* [Scikit-learn]()
    - One of the most popular ML libraries for classical ML algorithms. 
    - It is built on top of two basic Python libraries -  NumPy and SciPy.
    - Scikit-learn supports most of the supervised and unsupervised learning algorithms. 
    - Scikit-learn can also be used for data-mining and data-analysis, and makes it a great tool for anyone who is 
      starting out with Machine Learning. 
* [XGBoost]() / [LightGBM]() / [CatBoost]()
    - XGBoost, LightGBM, and CatBoost are competing libraries that provide highly optimized, scalable and fast 
      implementations of gradient boosting. 
    - Gradient boosting is one of the most popular machine learning algorithms, which lies in building an ensemble of 
      successively refined elementary models, namely decision trees.
    - These libraries are extremely popular among data scientists and Kaggle competitors.      
* [eli5]()
    - A library for visualising & debugging machine learning models and tracking the work of an algorithm step by step. 
    - Often the results of machine learning models predictions are not entirely clear and eli5 tries to address it.
    - It provides support for scikit-learn, XGBoost, LightGBM, lightning, and sklearn-crfsuite libraries and performs 
      the different tasks for each of them.

### Deep Learning
* [TensorFlow]()
    - A very popular library for high performance numerical computation developed by the Google Brain team. 
    - Tensorflow is a framework that involves defining and running computations involving tensors.
    - It can train and run deep neural networks that can be used to develop several AI applications.
* [PyTorch]()
    - A popular Machine Learning library for Python based on Torch, which is an open-source Machine Learning library 
      which is implemented in C with a wrapper in Lua. 
    - It has an extensive choice of tools and libraries that supports Computer Vision, Natural Language Processing(NLP) 
      and many more Machine Learning programs. 
    - It allows developers to perform computations on Tensors with GPU acceleration and also helps in creating 
      computational graphs.
* [Keras]()
    - A very popular Machine Learning library for Python and makes it really easy for ML beginners to build and design 
      a Neural Network.
    - It is a high-level neural networks API capable of running on top of TensorFlow, CNTK, or Theano and can run 
      seamlessly on both CPU and GPU. 
    - It allows for easy and fast prototyping.
* [Theano]()
    - A popular library that is used to define, evaluate and optimize mathematical expressions involving 
      multi-dimensional arrays in an efficient manner. It is achieved by optimizing the utilization of CPU and GPU. 
    - It is extensively used for unit-testing and self-verification to detect and diagnose different types of errors. 
    - A very powerful library that has been used in large-scale computationally intensive scientific projects 
      for a long time but still remains simple and approachable.

### Distributed Deep Learning
* [Dist-keras]() / [elephas]() / [spark-deep-learning]()
    - These libraries are used to train neural networks based on the Keras library directly with the help of Apache 
      Spark. Spark-deep-learning also provides tools to create a pipeline with Python neural networks.
    - Deep learning problems are becoming crucial nowadays since more and more use cases require considerable effort and 
      time. However, processing such an amount of data is much easier with the use of distributed computing systems like 
      Apache Spark which again expands the possibilities for deep learning. Therefore, dist-keras, elephas, and 
      spark-deep-learning are gaining popularity and developing rapidly, and it is very difficult to single out one of 
      the libraries since they are all designed to solve a common task.

### Natural Language Processing
* [NLTK]()
    - A library for natural language processing. 
    - NLTK is used to process and analyze text in a variety of ways - tokenize, tagging, extracting information, etc. 
    - NLTK is also used for prototyping and building research systems.
* [SpaCy]()
    - A library for NLP with excellent examples, API documentation, and demo applications. The library is written in the 
      Cython language which is C extension of Python.
    - It supports almost 30 languages and provides easy deep learning integration, promises robustness and high 
      accuracy. 
    - Another great feature of spaCy is an architecture designed for entire documents processing, without breaking the 
      document into phrases.
* [Gensim]()
    - A library for robust semantic analysis, topic modeling and vector-space modeling. It is built upon Numpy & Scipy. 
    - It provides an implementation of popular NLP algorithms, such as word2vec. 
    - Although gensim has its own models, wrappers and fasttext implementation, the fasttext library can also be used 
      for efficient learning of word representations.

### Data Scraping
* [Scrapy]()
    - An extensibile and portabile library that is used to create spiders bots that scan website pages and collect 
      structured data. 
    - In addition, Scrapy can extract data from the API. 
    - It includes advances due to several upgrades in proxy servers and improved system of errors notification and 
      problems identification. 
    - It also provide support for metadata settings using scrapy parse.

### Pythonic Data Structures and Algorithms
* [algorithms](https://pypi.org/project/algorithms/)
    - A minimal and clean example implementations of data structures and algorithms in Python 3.  

### Images
* [OpenCV]()
    - One of the best and very powerful library for Image Processing.

* [Pillow]()
    - Pillow is a more user-friendly fork of PIL (Python Imaging Library) and is useful while working with images. 
