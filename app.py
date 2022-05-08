from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
import os
app = Flask(__name__)
app.secret_key = "Secret Key"
#in the below url the env variables mentioned in the DB pod dockerfile are used. root is the root userID,admin is the root password,backendsvc is the db pod exosed service and shipping is the database name
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:admin@backendsvc/shipping"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Tracking(db.Model):
   id = db.Column(db.Integer, primary_key=True)
   tracking = db.Column(db.String(100))

   def __init__(self, tracking):
      self.tracking = tracking
      
@app.route('/liveness')
def healthx():
  time.sleep(2);
  return "<h1><center>Liveness check completed</center><h1>"
  
@app.route('/readiness')
def healthz():
  time.sleep(20);
  return "<h1><center>Readiness check completed</center><h1>"

@app.route('/')
def hello_name():
   return render_template('index.html')

@app.route('/tracking')
def tracking():
   #my_data = Tracking.query.get()
   track = request.args['track']
   my_data = Tracking.query.get(track)
   return render_template('tracking.html', result = my_data)


if __name__ == '__main__':
   port = int(os.environ.get('PORT', 5000))
   app.run(debug=True, host='0.0.0.0', port=port)
