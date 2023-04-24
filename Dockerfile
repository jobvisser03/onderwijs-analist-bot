FROM python:3.10-slim

# copy code
COPY . /onderwijs_analist_bot

# install as a package
RUN pip install --upgrade pip && \
    pip install /onderwijs_analist_bot/

WORKDIR /onderwijs_analist_bot
EXPOSE 8501

# cmd for running the API
CMD ["python", "-m", "streamlit", "run", "onderwijs_analist_bot/webapp.py"]
