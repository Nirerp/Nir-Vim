local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local c = ls.choice_node
local i = ls.insert_node


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
