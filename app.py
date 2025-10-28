from flask import Flask
import init_db
init_db.initialize_database()

app = Flask(__name__)

@app.get("/")
def hello():
    return "Hello user from ECR-deployed container!, version 3\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
