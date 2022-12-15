
# FROM continuumio/anaconda3:latest

# ENV PYTHONUNBUFFERED=TRUE

# RUN pip install pipenv

# WORKDIR /app

# COPY requirements.txt ./requirements.txt

# RUN pip3 install -r requirements.txt

# EXPOSE 8501

# COPY . /app

# ENTRYPOINT [ "streamlit", "run" ]

# CMD [ "churn_pred_app.py" ]

# # FROM continuumio/anaconda3

# # WORKDIR /home

# # COPY ../Teleco_Churn_Prediction .





FROM python:3.10

RUN pip install pipenv gunicorn

ENV PYTHONUNBUFFERED=TRUE

WORKDIR /app

COPY /tel_churn_proj .

RUN pipenv install --deploy --system 

EXPOSE 1111

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:1111", "flask_churn_pred_app:app"] 