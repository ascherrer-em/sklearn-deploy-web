
Containerized Flask/VueJS full stack web application for serving sklearn models.
Demo application with a simple model.

# Stack description

## Backend

Backend is a REST/JSON API using [`Flask`](https://flask.palletsprojects.com/en/3.0.x/) with the following endpoints:

 - `GET` `/api/check`: healthcheck service, just to check the backend is running
 - `POST` `/api/predict`: Get a prediction given feature data sent as JSON.


## Frontend

Frontend is a [`VueJS 3`](https://vuejs.org/) application, using [`bootstrap 5`](https://getbootstrap.com/) HTML template. 

## Reverse proxy

Locally, in order to have both frontend and backend on the same domain, an nginx reverse proxy is configurred (running in a Docker container).

Check out `nginx` directory for configuration.

# Usage

1. Fork this repo

## Export your sklearn model

1. In your Jupyter notebook, export your model (and feature scaling model is applicable) as `joblib` file
    Here is a snippet of how to do that:
    ```python
    from joblib import dump, load
    dump(classifier, 'model.joblib') 
    dump(scaler, 'scaler.joblib') 
    ```
1. Copy your model and scaler `joblib` files in the `backend` directory

## Adjust backend code

1. Change `app.py` to load your model, and adjust prediction code.
1. Check that your backend works using `curl`, for instance:
```
$curl -X POST http://localhost:1351/api/predict \
   -H 'Content-Type: application/json' \
   -d '{"age":10,"salary":50}'
```

## Adjust frontend code

1. Update the title and description of your model in `PredictForm.vue` 
1. Update the form in `PredictForm.vue` 
1. Adjust data preparation (`doSubmit()` method of `PredictForm.vue`)

## Test your code!


Then you can run your app locally:

`make build` : will rebuild docker images and frontend

`make run` : will start all containers.

Then navigate to http://localhost:1351/predict and you should see the prediction form.

Check out `Makefile` to see all available options.

# Deployment on render

1. Create a free account on https://render.com/

1. Change the names in `render.yaml` file (replace `sklearn-predict-test-api` and `sklearn-predict-test-front` with your own names).

1. In the dashboard, go to blueprint and create a new blueprint using your repository. Then wait for frontend and backend to be built and you will be able to access them from everywhere in the world.

# Possible extentions

You can supercharge this very simple application with:

 - support multiple models
 - support training your model on new data
 - ...
