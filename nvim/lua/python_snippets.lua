local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep


-- Machine Learning Snippets:




ls.add_snippets("python", {
	s("ml",
		{
			t({ "import numpy as np",
				"import pandas as pd",
				"from matplotlib import pyplot as plt",
				"import seaborn as sns", }),
		})
})


ls.add_snippets("python", {
	s("knn",
		{
			t({
				"from sklearn.model_selection import GridSearchCV",
				"from sklearn.pipeline import Pipeline",
				"from sklearn.preprocessing import StandardScaler",
				"from sklearn.neighbors import KNeighborsClassifier",
				"from sklearn.model_selection import train_test_split",
				"from sklearn.metrics import confusion_matrix, classification_report, accuracy_score",
			}),
		})
})


ls.add_snippets("python", {
	s("decision",
		{
			t({
				"from sklearn.model_selection import GridSearchCV",
				"from sklearn.pipeline import Pipeline",
				"from sklearn.preprocessing import StandardScaler",
				"from sklearn.tree import DecisionTreeClassifier",
				"from sklearn.model_selection import train_test_split",
				"from sklearn.metrics import confusion_matrix, classification_report, accuracy_score",
			}),
		})
})


ls.add_snippets("python", {
	s("linear",
		{
			t({
				"from sklearn.model_selection import GridSearchCV",
				"from sklearn.pipeline import Pipeline",
				"from sklearn.preprocessing import StandardScaler",
				"from sklearn.linear_model import LinearRegression, ElasticNet, Lasso, Ridge",
				"from sklearn.model_selection import train_test_split",
				"from sklearn.metrics import r2_score",
				"from sklearn.preprocessing import LabelEncoder",
			}),
		})
})


ls.add_snippets("python", {
	s("logistic",
		{
			t({
				"from sklearn.model_selection import GridSearchCV",
				"from sklearn.pipeline import Pipeline",
				"from sklearn.preprocessing import StandardScaler",
				"from sklearn.linear_model import LogisticRegression",
				"from sklearn.model_selection import train_test_split",
				"#LogisticRegression().score(x_test), y_test)",
			}),
		})
})



ls.add_snippets("python", {
	s("X_train", {
		t({ "X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)" }) })
})


-- Sklearn Snippits --

ls.add_snippets("python", {
	s("sklearn",
		{
			t({ "from sklearn.pipeline import Pipeline",
				"from sklearn.model_selection import GridSearchCV",
				"from sklearn.preprocessing import StandardScaler",
				"from sklearn.multioutput import MultiOutputClassifier",
				"from sklearn.ensemble import GradientBoostingClassifier, RandomForestClassifier",
				"from sklearn.metrics import accuracy_score, classification_report",
			})
		})
})

ls.add_snippets("python", {
	s("pipe",
		{
			t('pipe = Pipeline([("scale", StandardScaler()), ("model", '),
			i(1, "name_of_model"),
			t(')])')
		}
	)
})


ls.add_snippets("python", {
	s("model", {
		t("model = GridSearchCV(estimator=pipe, param_grid={'"),
		i(1, "param1"), t("' : ["),
		i(2, "list1"), t("], '"),
		i(3, "param2"), t("' : ["),
		i(4, "list2"), t("]}, cv="),
		i(5, "5"), t(")"),
	})
})

ls.add_snippets("python", {
	s("model.fit", {
		t({
			"model.fit(X_train, y_train)",
			"model.best_params_",
			"model = model.best_estimator_",
			"prediction = model.predict(X_test)"
		})
	})
})

-- PyTorch Snippets --

ls.add_snippets("python", {
	s("ptimport", {
		t("import torch"), t{"", "import torch.nn as nn"}, t{"", "import torch.optim as optim"}, t{"", "from torch.utils.data import DataLoader, TensorDataset"}
	}),
	s("ptmodel", {
		t("class "), i(1, "ModelName"), t{"(nn.Module):", "    def __init__(self):"},
		t("        super("), rep(1), t{", self).__init__()", "        self.layer1 = nn.Linear("}, i(2, "in_features"), t{", "}, i(3, "out_features"), t{")", "", "    def forward(self, x):", "        return self.layer1(x)", "", "model = "}, rep(1), t{"()"}
	}),
	s("pttrain", {
		t("criterion = nn.CrossEntropyLoss()"), t{"", "optimizer = optim.Adam(model.parameters(), lr="}, i(1, "0.001"), t{")", "", "for epoch in range("}, i(2, "num_epochs"), t{"):", "    for i, (inputs, labels) in enumerate(train_loader):", "        # Forward pass", "        outputs = model(inputs)", "        loss = criterion(outputs, labels)", "", "        # Backward and optimize", "        optimizer.zero_grad()", "        loss.backward()", "        optimizer.step()", "", "    print(f'Epoch [{epoch+1}/"}, rep(2), t{"], Loss: {loss.item():.4f}')"}
	}),
})

-- TensorFlow/Keras Snippets --

ls.add_snippets("python", {
	s("tfimport", {
		t("import tensorflow as tf"), t{"", "from tensorflow import keras"}, t{"", "from tensorflow.keras import layers"}
	}),
	s("tfmodel", {
		t("model = keras.Sequential(["), t{"", "    layers.Dense(64, activation='relu', input_shape=["}, i(1, "input_dim"), t{"]),", "    layers.Dense(64, activation='relu'),", "    layers.Dense("}, i(2, "10"), t{")", "])", "", "model.compile(optimizer='"}, i(3, "adam"), t{"',", "              loss="}, i(4, "tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)"), t{",", "              metrics=['accuracy'])"}
	}),
	s("tffit", {
		t("history = model.fit("), t{"", "    X_train, y_train,"}, t{"", "    epochs="}, i(1, "100"), t{",", "    validation_split=0.2,", "    verbose=0", ")"}
	}),
})

-- Hugging Face Transformers Snippets --

ls.add_snippets("python", {
	s("hfpipe", {
		t("from transformers import pipeline"), t{"", ""}, t("classifier = pipeline('"), i(1, "sentiment-analysis"), t{"')"}, t{"", "result = classifier('"}, i(2, "I love building AI snippets!"), t{"')"}, t{"", "print(result)"}
	}),
	s("hftokenizer", {
		t("from transformers import AutoTokenizer, AutoModelForSeq2SeqLM"), t{"", ""}, t("tokenizer = AutoTokenizer.from_pretrained('"), i(1, "t5-small"), t{"')"}, t{"", "model = AutoModelForSeq2SeqLM.from_pretrained('"}, rep(1), t{"')"}
	}),
})
