import pandas as pd
import quandl, math
import numpy as np
from sklearn import preprocessing, cross_validation, svm
from sklearn.linear_model import LinearRegression

# Pull in some data from quandl
dfStart = quandl.get('WIKI/GOOGL')

# Subset the df
dfStart = dfStart[['Adj. Open','Adj. High','Adj. Low','Adj. Close','Adj. Volume',]]

# Calculate things
dfStart['HL_PCT'] = (dfStart['Adj. High'] - dfStart['Adj. Close']) / dfStart['Adj. Close'] * 100.0
dfStart['PCT_change'] = (dfStart['Adj. Close'] - dfStart['Adj. Open']) / dfStart['Adj. Open'] * 100.0

# Take a look
print(dfStart.head())

# Reorganize data into a new df
dfSecond = dfStart[['Adj. Close','HL_PCT','PCT_change','Adj. Volume',]]

# Take another look
print(dfSecond.head())

# Okay, now let's set a column to forecast
forecast_col = 'Adj. Close'

# Replace NA data with -99,999 (an outlier) as opposed to removing it
dfSecond.fillna(-99999, inplace=True)

# Predict 1% in the future 
forecast_out = int(math.ceil(0.01*len(dfSecond)))

# Add a label to the df using the integer retrieved previously
dfSecond['label'] = dfSecond[forecast_col].shift(-forecast_out)

# Check out the forecast
print(dfSecond.head())

# Drop the label column of dfSecond, then return it as a NumPy array into X, which are your features
X = np.array(dfSecond.drop(['label'],1))

# Labels 
y = np.array(dfSecond['label'])

# Scale X before feeding it through a classifier
# Note:  When processing cyclically, make sure to scale everything together (new and old data), not just the new data
X = preprocessing.scale(X)
y = np.array(dfSecond['label'])

# Create our training and testing sets
# cross_validation was deprecated in version 0.18 in favor of the model_selection module into which all the refactored classes and functions are moved. This module will be removed in 0.20.
X_train, X_test, y_train, y_test = cross_validation.train_test_split(X, y, test_size=0.2)

# Make a classifier using the X_train and y_train features/labels
classifier = LinearRegression()

# Always train and test against different data
classifier.fit(X_train, y_train)
accuracy = classifier.score(X_test,y_test)

print(accuracy)
