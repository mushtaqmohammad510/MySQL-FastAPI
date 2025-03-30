FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app/
EXPOSE 8000
ENV DB_HOST=mysql.default.svc.cluster.local
ENV DB_USER=root
ENV DB_PASSWORD=my-secret-pw
ENV DB_NAME=mysql
ENV DB_PORT=3306
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
