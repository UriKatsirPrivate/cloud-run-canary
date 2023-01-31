import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello Cloud Run Canary Green"

if __name__ == "__main__":
    # app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))
    from waitress import serve
    serve(app, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))