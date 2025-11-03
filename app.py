from flask import Flask
import init_db
init_db.initialize_database()

app = Flask(__name__)

@app.get("/")
def hello():
    return "hello soukaina allali\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
